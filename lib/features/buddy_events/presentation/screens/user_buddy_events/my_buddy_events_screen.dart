import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zheeta/core/constants/color.dart';
import 'package:zheeta/di/di.dart';
import 'package:zheeta/features/app/presentation/widgets/general_footer_nav.dart';
import 'package:zheeta/features/buddy_events/data/models/created_buddy_event.dart';
import 'package:zheeta/features/buddy_events/data/models/joined_buddy_event.dart';
import 'package:zheeta/features/buddy_events/presentation/cubits/event_cubit/created_events_cubit.dart';
import 'package:zheeta/core/utils/pagination_controller.dart';
import 'package:zheeta/features/buddy_events/presentation/cubits/event_cubit/joined_events_cubit.dart';
import 'package:zheeta/features/buddy_events/presentation/widgets/reusable_event_card.dart';
import 'package:zheeta/router/app_router.gr.dart';
import 'package:zheeta/shared/widgets/back_button.dart';
import 'package:zheeta/shared/widgets/loader.dart';

@RoutePage()
class MyBuddyEventsScreen extends StatefulWidget {
  const MyBuddyEventsScreen({super.key});

  @override
  State<MyBuddyEventsScreen> createState() => _MyBuddyEventsScreenState();
}

class _MyBuddyEventsScreenState extends State<MyBuddyEventsScreen> {
  late CreatedEventsCubit _createdEventsCubit;
  late JoinedEventsCubit _joinedEventsCubit;

  final PageController _pageController = PageController();
  int activeTab = 0; // switch to 0-based for easier PageView handling

  @override
  void initState() {
    super.initState();
    _createdEventsCubit = locator<CreatedEventsCubit>();
    _joinedEventsCubit = locator<JoinedEventsCubit>();

    // load first pages
    _createdEventsCubit.reset();
    _joinedEventsCubit.reset();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onTabSelected(int index) {
    setState(() {
      activeTab = index;
    });
    _pageController.jumpToPage(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryDark,
      extendBody: true,
      bottomNavigationBar: buildGeneralFooterNav(context),
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: AppColors.primaryDark,
        surfaceTintColor: AppColors.primaryDark,
        scrolledUnderElevation: 0.5,
        shadowColor: Colors.grey,
        leadingWidth: MediaQuery.of(context).size.width * 0.2,
        leading: Row(
          children: [AppBackButton()],
        ),
        title: Text(
          'My Buddy Events',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: AppColors.white,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            _buildTabBar(),
            SizedBox(height: 10),
            Expanded(
              child: PageView(
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() => activeTab = index);
                },
                children: [
                  _CreatedEventsList(cubit: _createdEventsCubit),
                  _JoinedEventsList(cubit: _joinedEventsCubit),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTabBar() {
    return Container(
      height: 40,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: AppColors.primaryLightBackground,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildTabButton(0, "Created"),
          _buildTabButton(1, "Joined"),
        ],
      ),
    );
  }

  Widget _buildTabButton(int index, String text) {
    return GestureDetector(
      onTap: () => _onTabSelected(index),
      child: Container(
        color: Colors.transparent,
        child: Column(
          children: [
            Container(
              height: 3,
              width: MediaQuery.of(context).size.width * 0.44,
              decoration: BoxDecoration(
                color:
                    activeTab == index ? AppColors.white : Colors.transparent,
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            SizedBox(height: 5),
            Text(
              text,
              style: TextStyle(
                color: activeTab == index
                    ? AppColors.white
                    : AppColors.white.withOpacity(0.5),
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CreatedEventsList extends StatefulWidget {
  final CreatedEventsCubit cubit;
  const _CreatedEventsList({required this.cubit});

  @override
  State<_CreatedEventsList> createState() => _CreatedEventsListState();
}

class _CreatedEventsListState extends State<_CreatedEventsList>
    with AutomaticKeepAliveClientMixin {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
          _scrollController.position.maxScrollExtent * 0.9) {
        widget.cubit.loadNextPage();
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context); // required
    return BlocBuilder<CreatedEventsCubit, PaginationState<CreatedBuddyEvent>>(
      bloc: widget.cubit,
      builder: (context, state) {
        if (state.isLoading && state.items.isEmpty) {
          return loadingIndicator();
        } else if (state.items.isEmpty) {
          return Center(
            child: Text(
              'No Created Buddy Events.',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: AppColors.white,
              ),
            ),
          );
        }

        return ListView.builder(
          controller: _scrollController,
          itemCount:
              state.hasMore ? state.items.length + 1 : state.items.length,
          itemBuilder: (context, index) {
            if (index >= state.items.length) {
              return state.hasMore ? loadingIndicator() : SizedBox.shrink();
            }
            final event = state.items[index];
            return EventCard(
              eventMainPhotoUrl: event.eventMainPhotoUrl,
              startDate: event.startDate,
              title: event.title,
              description: event.description,
              eventLocationAddress: event.eventLocationAddress,
              noOfBuddiesJoined: event.noOfBuddiesJoined,
              noOfBuddiesWanted: event.noOfBuddiesWanted,
              eventParticipationCost: event.eventParticipationCost,
              category: event.category,
              onTap: () {
                context.router.push(EventDetailsRoute(
                  id: event.id,
                  creatorId: event.creatorId,
                ));
              },
            );
          },
        );
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class _JoinedEventsList extends StatefulWidget {
  final JoinedEventsCubit cubit;
  const _JoinedEventsList({required this.cubit});

  @override
  State<_JoinedEventsList> createState() => _JoinedEventsListState();
}

class _JoinedEventsListState extends State<_JoinedEventsList>
    with AutomaticKeepAliveClientMixin {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
          _scrollController.position.maxScrollExtent * 0.9) {
        widget.cubit.loadNextPage();
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context); // required for keepAlive
    return BlocBuilder<JoinedEventsCubit, PaginationState<JoinedBuddyEvent>>(
      bloc: widget.cubit,
      builder: (context, state) {
        if (state.isLoading && state.items.isEmpty) {
          return loadingIndicator();
        } else if (state.items.isEmpty) {
          return Center(
            child: Text(
              'No Joined Buddy Events.',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: AppColors.white,
              ),
            ),
          );
        }

        return ListView.builder(
          controller: _scrollController,
          itemCount:
              state.hasMore ? state.items.length + 1 : state.items.length,
          itemBuilder: (context, index) {
            if (index >= state.items.length) {
              return state.hasMore ? loadingIndicator() : SizedBox.shrink();
            }
            final event = state.items[index];
            return EventCard(
              eventMainPhotoUrl: event.eventMainPhotoUrl,
              startDate: event.startDate,
              title: event.title,
              description: event.description,
              eventLocationAddress: event.eventLocationAddress,
              noOfBuddiesJoined: event.noOfBuddiesJoined,
              noOfBuddiesWanted: event.noOfBuddiesWanted,
              eventParticipationCost: event.eventParticipationCost,
              category: event.category,
              onTap: () {
                context.router.push(EventDetailsRoute(
                  id: event.id,
                  creatorId: event.creatorId,
                ));
              },
            );
          },
        );
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}
