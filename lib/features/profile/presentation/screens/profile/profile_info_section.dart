import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:zheeta/core/constants/color.dart';
import 'package:zheeta/core/utils/extensions/string_extension.dart';
import 'package:zheeta/di/di.dart';
import 'package:zheeta/features/profile/data/models/user_profile_model.dart';
import 'package:zheeta/features/profile/presentation/cubits/profile_created_events_cubit/profile_created_events_cubit.dart';
import 'package:zheeta/features/profile/presentation/widgets/counter.dart';
import 'package:zheeta/features/profile/presentation/widgets/intrests_tile.dart';
import 'package:zheeta/features/profile/presentation/widgets/recent-downlines.dart';
import 'package:zheeta/features/profile/presentation/widgets/tab_button.dart';
import 'package:zheeta/features/profile/presentation/widgets/user_bio.dart';
import 'package:zheeta/router/app_router.gr.dart';
import 'package:zheeta/shared/bottom_sheets/reusable_bottom_sheet.dart';
import 'package:zheeta/shared/widgets/gender_age.dart';
import 'package:zheeta/shared/widgets/gender_indicator.dart';
import 'package:zheeta/shared/widgets/primary_button.dart';
import 'package:zheeta/shared/widgets/subscription_badge.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zheeta/core/utils/pagination_controller.dart';
import 'package:zheeta/features/buddy_events/data/models/created_buddy_event.dart';
import 'package:zheeta/features/buddy_events/presentation/widgets/reusable_event_card.dart';
import 'package:zheeta/shared/widgets/loader.dart';

class BuildUserInfo extends StatefulWidget {
  final UserProfileDataModel theUser;

  const BuildUserInfo({super.key, required this.theUser});

  @override
  State<BuildUserInfo> createState() => _BuildUserInfoState();
}

class _BuildUserInfoState extends State<BuildUserInfo> {
  final ScrollController _recentEventsScrollController = ScrollController();
  final ProfileCreatedEventsCubit _profileCreatedEventsCubit =
      locator<ProfileCreatedEventsCubit>();

  int activeTab = 1;
  bool _showFullBio = false;

  void toggleBio() => setState(() => _showFullBio = !_showFullBio);

  @override
  void initState() {
    super.initState();

    _profileCreatedEventsCubit.refreshProfileCreatedEvents();

    _recentEventsScrollController.addListener(_scrollListener);
  }

  void _scrollListener() {
    if (activeTab == 2 && _isRecentActivitiesBottom) {
      _profileCreatedEventsCubit.loadNextPage();
    }
  }

  bool get _isRecentActivitiesBottom {
    if (!_recentEventsScrollController.hasClients) return false;
    final maxScroll = _recentEventsScrollController.position.maxScrollExtent;
    final currentScroll = _recentEventsScrollController.position.pixels;
    return currentScroll >= (maxScroll * 0.9);
  }

  @override
  void dispose() {
    _recentEventsScrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildUserHeader(),
          const SizedBox(height: 20),
          _buildProfileCounters(),
          //const SizedBox(height: 20),
          //_buildBoostProfileButton(context),
          const SizedBox(height: 20),
          _buildTabButtons(),
          const SizedBox(height: 20),
          // Inside the build method
          if (activeTab == 1)
            _buildBioTab()
          else
            SizedBox(
              height: MediaQuery.of(context).size.height,
              child: _CreatedEventsList(cubit: _profileCreatedEventsCubit),
            )
        ],
      ),
    );
  }

  Widget _buildUserHeader() {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  if (widget.theUser.user?.isFullyVerified ?? false)
                    Image.asset('assets/images/badge.png',
                        width: 19, height: 19),
                  const SizedBox(width: 8),
                  Image.asset('assets/images/share.png', width: 19, height: 19),
                  SubscriptionBadge(
                    text: widget.theUser.userSubscription?.name?.trim() ?? '',
                  ),
                ],
              ),
              const SizedBox(height: 5),
              Row(
                children: [
                  Text(
                    '@${(widget.theUser.user?.userName ?? '').toLowerCase()}',
                    style: const TextStyle(
                      color: AppColors.darkText,
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(width: 15),
                  Text(
                    '${widget.theUser.profile?.firstName ?? ''} ${widget.theUser.profile?.lastName ?? ''}',
                    style: const TextStyle(
                      color: AppColors.grayscaleBody,
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
              const SizedBox(height: 5),
              Row(
                children: [
                  Text(
                    '${widget.theUser.profile?.residentialAddress?.city}, ${widget.theUser.profile?.residentialAddress?.country}',
                    style: const TextStyle(
                      color: AppColors.grayscaleBody,
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                    ),
                  ),
                  const Spacer(),
                  GenderAgeWidget(
                    gender: widget.theUser.profile?.gender
                            ?.toString()
                            .getFirstLetter ??
                        '',
                    age: widget.theUser.profile?.age ?? 0,
                  ),
                  const SizedBox(width: 10),
                  GenderIndicator(
                    gender: widget.theUser.profile!.gender
                        .toString()
                        .getFirstLetter,
                  ),
                  const Spacer(),
                ],
              ),
            ],
          ),
        ),
        GestureDetector(
          onTap: () {
            showCustomModalBottomSheet(
              context: context,
              titles: [
                'Manage profile',
                'Manage interests',
                //'Boost insights',
                'Manage access'
              ],
              icons: [
                'assets/images/icons/user-profile.svg',
                'assets/images/icons/interests-outline-rounded.svg',
                //'assets/images/icons/boost-insight.svg',
                'assets/images/icons/user-access.svg'
              ],
              actions: [
                () => context.router.push(ProfileEditRoute(activeTab: 1)),
                () => context.router.push(ProfileEditRoute(activeTab: 2)),
                // () => context.router.push(ProfileBoostInsightRoute(
                //     userName: widget.theUser.user?.userName ?? '')),
                () => context.router.push(ProfileAccessManagementRoute()),
              ],
            );
          },
          child: Container(
            padding: const EdgeInsets.all(10),
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(100),
            ),
            child: SvgPicture.asset('assets/images/icons/dots.svg', width: 30),
          ),
        ),
      ],
    );
  }

  Widget _buildProfileCounters() {
    return Container(
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          buildCounterWidget(
              count: widget.theUser.profileCounters?.friendsCount,
              label: 'Friends'),
          buildCounterWidget(
              count: widget.theUser.profileCounters?.downlinesCount,
              label: 'Downlines'),
          buildCounterWidget(
              count: widget.theUser.profileCounters?.successfulEventCount,
              label: 'Events'),
        ],
      ),
    );
  }

  Widget _buildBoostProfileButton(BuildContext context) {
    return SizedBox(
      height: 40,
      child: PrimaryButton(
        icon: 'assets/images/icons/rocket.svg',
        title: 'Boost Profile',
        action: () => context.router.push(ProfileBoostRoute()),
      ),
    );
  }

  Widget _buildTabButtons() {
    return Container(
      height: 40,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TabButton(
            title: 'Bio',
            tabIndex: 1,
            activeTab: activeTab,
            onTabSelected: (index) => setState(() => activeTab = index),
          ),
          TabButton(
            title: 'Buddy events',
            tabIndex: 2,
            activeTab: activeTab,
            onTabSelected: (index) => setState(() => activeTab = index),
          ),
        ],
      ),
    );
  }

  Widget _buildBioTab() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        UserBioWidget(
          user: widget.theUser,
          showFullBio: _showFullBio,
          toggleBio: toggleBio,
        ),
        if (widget.theUser.userDownlines != null)
          RecentDownlinesWidget(
            userDownlines: widget.theUser.userDownlines!,
            onViewAll: () {
              context.router.push(DownlinesRoute());
            },
          ),
        const SizedBox(height: 10),
        const Text(
          "Interest",
          style: TextStyle(
            color: AppColors.grayscale,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 10),
        Wrap(
          runSpacing: 10,
          spacing: 10,
          children: widget.theUser.interests
                  ?.map((e) => InterestWidget(title: e.title!))
                  .toList() ??
              [],
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}

class _CreatedEventsList extends StatefulWidget {
  final ProfileCreatedEventsCubit cubit;

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
    super.build(context); // Required for AutomaticKeepAliveClientMixin

    return BlocBuilder<ProfileCreatedEventsCubit,
        PaginationState<CreatedBuddyEvent>>(
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
