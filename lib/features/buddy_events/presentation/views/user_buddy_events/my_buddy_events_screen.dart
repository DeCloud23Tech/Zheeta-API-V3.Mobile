import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:zheeta/common/constants/color.dart';
import 'package:zheeta/core/injection/di.dart';
import 'package:zheeta/features/buddy_events/data/model/created_buddy_event.dart';
import 'package:zheeta/features/buddy_events/data/model/joined_buddy_event.dart';
import 'package:zheeta/features/buddy_events/presentation/bloc/event_cubit/event_cubit.dart';
import 'package:zheeta/features/buddy_events/presentation/widgets/reusable_event_card.dart';
import 'package:zheeta/utils/pagination_controller.dart';
import 'package:zheeta/widgets/back_button.dart';
import 'package:zheeta/widgets/loader.dart';

@RoutePage()
class MyBuddyEventsScreen extends StatefulWidget {
  const MyBuddyEventsScreen({super.key});

  @override
  State<MyBuddyEventsScreen> createState() => _MyBuddyEventsScreenState();
}

class _MyBuddyEventsScreenState extends State<MyBuddyEventsScreen> {
  late PaginatedListController<CreatedBuddyEvent, EventCubit, EventState>
      _createdEventsPaginatedController;
  late PaginatedListController<JoinedBuddyEvent, EventCubit, EventState>
      _joinedEventsPaginatedController;

  final ScrollController _createdEventsScrollController = ScrollController();
  final ScrollController _joinedEventsScrollController = ScrollController();

  final EventCubit _eventCubit = locator<EventCubit>();
  int activeTab = 1;

  @override
  void initState() {
    super.initState();

    // Initialize paginated controllers for upcoming and past buddy_events
    _initializeCreatedEventsPagination();
    _initializeJoinedEventsPagination();

    // Add scroll listeners
    _createdEventsScrollController.addListener(_scrollListener);
    _joinedEventsScrollController.addListener(_scrollListener);

    // Load initial data for the active tab
    _loadInitialDataForActiveTab();
  }

  void _initializeCreatedEventsPagination() {
    _createdEventsPaginatedController =
        PaginatedListController<CreatedBuddyEvent, EventCubit, EventState>(
      fetchItems: (param) => _eventCubit.fetchCreatedEventsCubit(param),
      cubit: _eventCubit,
    );
  }

  void _initializeJoinedEventsPagination() {
    _joinedEventsPaginatedController =
        PaginatedListController<JoinedBuddyEvent, EventCubit, EventState>(
      fetchItems: (param) => _eventCubit.fetchJoinedEventsCubit(param),
      cubit: _eventCubit,
    );
  }

  void _loadInitialDataForActiveTab() {
    if (activeTab == 1) {
      _loadCreatedEventsPage();
    } else if (activeTab == 2) {
      _loadJoinedEventsPage();
    }
  }

  void _resetPaginationForActiveTab() {
    if (activeTab == 1) {
      _createdEventsPaginatedController.reset();
    } else if (activeTab == 2) {
      _joinedEventsPaginatedController.reset();
    }
  }

  void _loadCreatedEventsPage() {
    _createdEventsPaginatedController.loadNextPage(
      successCondition: (state) => state.status == EventsStatus.success,
      extractItems: (state) => state.createdEvents,
      isError: (state) => state.status == EventsStatus.error,
    );
  }

  void _loadJoinedEventsPage() {
    _joinedEventsPaginatedController.loadNextPage(
      successCondition: (state) => state.status == EventsStatus.success,
      extractItems: (state) => state.joinedEvents,
      isError: (state) => state.status == EventsStatus.error,
    );
  }

  void _scrollListener() {
    if (activeTab == 1 && _isCreatedEventsBottom) {
      _loadCreatedEventsPage();
    } else if (activeTab == 2 && _isJoinedEventsBottom) {
      _loadJoinedEventsPage();
    }
  }

  bool get _isCreatedEventsBottom {
    if (!_createdEventsScrollController.hasClients) return false;
    final maxScroll = _createdEventsScrollController.position.maxScrollExtent;
    final currentScroll = _createdEventsScrollController.position.pixels;
    return currentScroll >= (maxScroll * 0.9);
  }

  bool get _isJoinedEventsBottom {
    if (!_joinedEventsScrollController.hasClients) return false;
    final maxScroll = _joinedEventsScrollController.position.maxScrollExtent;
    final currentScroll = _joinedEventsScrollController.position.pixels;
    return currentScroll >= (maxScroll * 0.9);
  }

  @override
  void dispose() {
    _createdEventsScrollController.dispose();
    _joinedEventsScrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryDark,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: AppColors.primaryDark,
        surfaceTintColor: AppColors.primaryDark,
        scrolledUnderElevation: 0.5,
        shadowColor: Colors.grey,
        leadingWidth: MediaQuery.of(context).size.width * 0.2,
        leading: Row(
          children: [
            AppBackButton(),
          ],
        ),
        title: Text(
          'My buddy events',
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
            Expanded(child: _buildTabContent()),
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
          _buildTabButton(1, "Created"),
          _buildTabButton(2, "Joined"),
        ],
      ),
    );
  }

  Widget _buildTabButton(int tabIndex, String text) {
    return GestureDetector(
      onTap: () {
        setState(() {
          activeTab = tabIndex;
          _resetPaginationForActiveTab();
        });
        _loadInitialDataForActiveTab();
      },
      child: Container(
        color: Colors.transparent,
        child: Column(
          children: [
            Container(
              height: 3,
              width: MediaQuery.of(context).size.width * 0.44,
              decoration: BoxDecoration(
                color: activeTab == tabIndex
                    ? AppColors.white
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            SizedBox(height: 5),
            Text(
              text,
              style: TextStyle(
                color: activeTab == tabIndex
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

  Widget _buildTabContent() {
    return activeTab == 1
        ? _buildCreatedEventsList()
        : _buildJoinedEventsList();
  }

  Widget _buildCreatedEventsList() {
    return BlocBuilder<EventCubit, EventState>(
      builder: (context, state) {
        if (state.status == EventsStatus.loading &&
            _createdEventsPaginatedController.items.isEmpty) {
          return loadingIndicator();
        } else if (state.status == EventsStatus.success &&
            _createdEventsPaginatedController.items.isEmpty) {
          return Center(
            child: Text(
              'No Buddy Events.',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: AppColors.white),
            ),
          );
        }

        return ListView.builder(

          controller: _createdEventsScrollController,
          itemCount: _createdEventsPaginatedController.items.length + 1,
          itemBuilder: (context, index) {
            if (index == _createdEventsPaginatedController.items.length) {
              return _createdEventsPaginatedController.hasMoreItems
                  ? loadingIndicator()
                  : SizedBox.shrink();
            }

            final event = _createdEventsPaginatedController.items[index];
            return _buildEventCard(event);
          },
        );
      },
    );
  }

  Widget _buildJoinedEventsList() {
    return BlocBuilder<EventCubit, EventState>(
      builder: (context, state) {
        if (state.status == EventsStatus.loading &&
            _joinedEventsPaginatedController.items.isEmpty) {
          return loadingIndicator();
        } else if (state.status == EventsStatus.success &&
            _joinedEventsPaginatedController.items.isEmpty) {
          return Center(
            child: Text(
              'No Joined Buddy Events.',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: AppColors.white),
            ),
          );
        }

        return ListView.builder(
          shrinkWrap: true,

          controller: _joinedEventsScrollController,
          itemCount: _joinedEventsPaginatedController.items.length + 1,
          itemBuilder: (context, index) {
            if (index == _joinedEventsPaginatedController.items.length) {
              return _joinedEventsPaginatedController.hasMoreItems
                  ? loadingIndicator()
                  : SizedBox.shrink();
            }

            final event = _joinedEventsPaginatedController.items[index];
            return _buildEventCard(event);
          },
        );
      },
    );
  }

  Widget _buildEventCard(dynamic event) {
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
    );
  }
}
