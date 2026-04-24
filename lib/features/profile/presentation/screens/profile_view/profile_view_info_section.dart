import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:zheeta/core/constants/color.dart';
import 'package:zheeta/core/utils/extensions/string_extension.dart';
import 'package:zheeta/core/utils/notify.dart';
import 'package:zheeta/core/utils/token_utils.dart';
import 'package:zheeta/di/di.dart';
import 'package:zheeta/features/connections/presentation/cubits/block_account_cubit/block_account_cubit.dart';
import 'package:zheeta/features/profile/data/models/user_profile_model.dart';
import 'package:zheeta/features/profile/data/models/view_profile_model.dart';
import 'package:zheeta/features/profile/presentation/cubits/profile_created_events_cubit/profile_created_events_cubit.dart';
import 'package:zheeta/features/profile/presentation/cubits/profile_view_cubit/profile_view_cubit.dart';
import 'package:zheeta/features/profile/presentation/widgets/counter.dart';
import 'package:zheeta/features/profile/presentation/widgets/intrests_tile.dart';
import 'package:zheeta/features/profile/presentation/widgets/recent-downlines.dart';
import 'package:zheeta/features/profile/presentation/widgets/tab_button.dart';
import 'package:zheeta/features/profile/presentation/widgets/basic_profile_section.dart';
import 'package:zheeta/features/profile/presentation/widgets/user_bio.dart';
import 'package:zheeta/router/app_router.gr.dart';
import 'package:zheeta/shared/bottom_sheets/reusable_bottom_sheet.dart';
import 'package:zheeta/shared/widgets/gender_age.dart';
import 'package:zheeta/shared/widgets/gender_indicator.dart';
import 'package:zheeta/shared/widgets/primary_button.dart';
import 'package:zheeta/shared/widgets/subscription_badge.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zheeta/core/constants/color.dart';
import 'package:zheeta/core/utils/pagination_controller.dart';
import 'package:zheeta/features/buddy_events/data/models/created_buddy_event.dart';
import 'package:zheeta/features/buddy_events/presentation/cubits/event_cubit/created_events_cubit.dart';
import 'package:zheeta/features/buddy_events/presentation/widgets/reusable_event_card.dart';
import 'package:zheeta/shared/widgets/loader.dart';
import 'package:auto_route/auto_route.dart';
import 'package:zheeta/router/app_router.gr.dart';

class BuildViewUserInfo extends StatefulWidget {
  final UserProfileDataModel theUser;
  final ViewProfileModel profileData;
  final String profileId;
  final String? blockOrUnBlockId;
  final String? userId;

  const BuildViewUserInfo({
    super.key,
    required this.theUser,
    required this.profileData,
    required this.profileId,
    this.blockOrUnBlockId,
    this.userId,
  });

  @override
  State<BuildViewUserInfo> createState() => _BuildViewUserInfoState();
}

class _BuildViewUserInfoState extends State<BuildViewUserInfo> {
  late ProfileCreatedEventsCubit _profileCreatedEventsCubit =
      locator<ProfileCreatedEventsCubit>();

  final ScrollController _recentEventsScrollController = ScrollController();

  int activeTab = 1;
  bool _showFullBio = false;

  void toggleBio() => setState(() => _showFullBio = !_showFullBio);

  String _shortenCountry(String? country) {
    final normalizedCountry = country?.trim().toLowerCase() ?? '';

    switch (normalizedCountry) {
      case 'united states':
      case 'united states of america':
        return 'US';
      case 'united kingdom':
        return 'UK';
      case 'united arab emirates':
      case 'united arab emirate':
        return 'UAE';
      default:
        return country?.trim() ?? '';
    }
  }

  String _formatDistance(double distance) {
    if (distance == distance.roundToDouble()) {
      return '${distance.toInt()}km Away';
    }

    return '${distance.toStringAsFixed(1)}km Away';
  }

  @override
  void initState() {
    super.initState();

    _profileCreatedEventsCubit = locator<ProfileCreatedEventsCubit>(
      param1: widget.profileId, // pass the userId/profileId here
    );

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
    final theUser = widget.theUser;
    final profileData = widget.profileData;

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(theUser),
          const SizedBox(height: 20),
          _buildChatButton(profileData),
          const SizedBox(height: 20),
          _buildProfileCounters(theUser),
          const SizedBox(height: 20),
          _buildTabButtons(),
          const SizedBox(height: 20),
          activeTab == 1
              ? _buildBioTab(theUser, profileData)
              : _buildEventsTab(),
        ],
      ),
    );
  }

  Widget _buildHeader(UserProfileDataModel user) {
    final city = user.profile?.residentialAddress?.city?.trim() ?? '';
    final country = _shortenCountry(
      user.profile?.residentialAddress?.country,
    );
    final locationParts = [
      if (city.isNotEmpty) city,
      if (country.isNotEmpty) country
    ];
    final locationText = locationParts.join(', ');

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 74,
          height: 74,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            image: DecorationImage(
              image: NetworkImage(user.profile!.profilePhotoURL!),
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Wrap(
                      spacing: 6,
                      runSpacing: 6,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        if (user.user!.isFullyVerified!)
                          Image.asset(
                            'assets/images/badge.png',
                            width: 19,
                            height: 19,
                          ),
                        SubscriptionBadge(
                          text: user.userSubscription?.name?.trim() ?? '',
                          margin: EdgeInsets.zero,
                        ),
                      ],
                    ),
                    const SizedBox(height: 6),
                    Wrap(
                      spacing: 10,
                      runSpacing: 4,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        Text(
                          '@${user.user?.userName ?? ''}',
                          style: const TextStyle(
                            color: AppColors.darkText,
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          '${user.profile?.firstName ?? ''} ${user.profile?.lastName ?? ''}',
                          style: const TextStyle(
                            color: AppColors.grayscaleBody,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 6),
                    Row(
                      children: [
                        GenderAgeWidget(
                          gender:
                              user.profile?.gender?.toString().getFirstLetter ??
                                  '',
                          age: user.profile?.age ?? 0,
                        ),
                        const SizedBox(width: 8),
                        GenderIndicator(
                          gender:
                              user.profile!.gender.toString().getFirstLetter,
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            locationText.isEmpty
                                ? _formatDistance(widget.profileData.distance)
                                : '$locationText (${_formatDistance(widget.profileData.distance)})',
                            style: const TextStyle(
                              color: AppColors.grayscaleBody,
                              fontSize: 12,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              GestureDetector(
                onTap: () {
                  showCustomModalBottomSheet(
                    context: context,
                    titles: ['Report profile', 'Block user'],
                    icons: [
                      'assets/images/icons/user-profile.svg',
                      'assets/images/icons/interests-outline-rounded.svg',
                    ],
                    actions: [
                      () {
                        // TODO: Add report logic
                      },
                      () {
                        final userId = widget.userId;
                        final blockId = widget.blockOrUnBlockId;
                        print(userId);
                        print(blockId);

                        if (userId != null && blockId != null) {
                          context.read<BlockAccountCubit>().blockUser(
                                userId,
                                blockId,
                              );
                        }
                      },
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
                  child: SvgPicture.asset(
                    'assets/images/icons/dots.svg',
                    width: 30,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildChatButton(ViewProfileModel profileData) {
    final isDisabled = !profileData.canMessage;

    return SizedBox(
      height: 40,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: isDisabled
            ? () => NotifyUser.showSnackBar(
                'Upgrade your subscription plan to chat with this User')
            : null,
        child: AbsorbPointer(
          absorbing: isDisabled,
          child: PrimaryButton(
            icon: 'assets/images/icons/chat_user.svg',
            invert: false,
            disabled: isDisabled,
            title: 'Chat User',
            action: () async {
              final userId = await TokenUtil.getUserId();
              if (!mounted) return;
              // context.router.push(ChatConversationRoute(
              //   userName:
              //   '${widget.theUser.profile!.firstName} ${widget.theUser.profile!.lastName}',
              //   profileId: widget.profileId,
              //   currentUserId: userId!,
              // ));
            },
          ),
        ),
      ),
    );
  }

  Widget _buildProfileCounters(UserProfileDataModel user) {
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
              count: user.profileCounters?.friendsCount,
              label: 'Total Friends'),
          buildCounterWidget(
              count: user.profileCounters?.downlinesCount,
              label: 'Direct Downlines'),
          buildCounterWidget(
              count: user.profileCounters?.successfulEventCount,
              label: 'Hosted Events'),
        ],
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

  Widget _buildBioTab(UserProfileDataModel user, ViewProfileModel profileData) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        UserBioWidget(
          user: user,
          showFullBio: _showFullBio,
          toggleBio: toggleBio,
        ),
        BasicProfileSection(user: user),
        if (profileData.isFriend)
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Interest",
                  style: TextStyle(
                      color: AppColors.grayscale,
                      fontWeight: FontWeight.w600,
                      fontSize: 16),
                ),
                const SizedBox(height: 10),
                Wrap(
                  runSpacing: 10,
                  spacing: 10,
                  children: user.interests
                          ?.map((e) => InterestWidget(title: e.title ?? ''))
                          .toList() ??
                      [],
                ),
              ],
            ),
          ),
      ],
    );
  }

  Widget _buildEventsTab() {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.65,
      child: _CreatedEventsList(cubit: _profileCreatedEventsCubit),
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
