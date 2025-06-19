import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zheeta/common/constants/color.dart';
import 'package:zheeta/common/extensions/string_extension.dart';
import 'package:zheeta/core/injection/di.dart';
import 'package:zheeta/core/router/app_router.gr.dart';
import 'package:zheeta/features/buddy_events/data/model/created_buddy_event.dart';
import 'package:zheeta/features/buddy_events/presentation/bloc/event_cubit/event_cubit.dart';
import 'package:zheeta/features/messages/presentation/bloc/chat_cubit/chat_cubit.dart';
import 'package:zheeta/features/profile/data/model/user_profile_model.dart';
import 'package:zheeta/features/profile/data/model/view_profile_model.dart';
import 'package:zheeta/features/profile/presentation/bloc/profile_cubit/profile_cubit.dart';
import 'package:zheeta/features/profile/presentation/widgets/basic_profile_prop.dart';
import 'package:zheeta/features/profile/presentation/widgets/counter.dart';
import 'package:zheeta/features/profile/presentation/widgets/events_posts.dart';
import 'package:zheeta/features/profile/presentation/widgets/intrests_tile.dart';
import 'package:zheeta/features/profile/presentation/widgets/tab_button.dart';
import 'package:zheeta/features/profile/presentation/widgets/user_bio.dart';
import 'package:zheeta/utils/pagination_controller.dart';
import 'package:zheeta/utils/token_utils.dart';
import 'package:zheeta/widgets/gender_age.dart';
import 'package:zheeta/widgets/gender_indicator.dart';
import 'package:zheeta/widgets/primary_button.dart';
import 'package:zheeta/widgets/subscription_badge.dart';

class BuildViewUserInfo extends StatefulWidget {
  final UserProfileDataModel theUser;
  final ViewProfileModel profileData;
  final String profileId;
  final String? blockOrUnBlockId;
  final String? userId;

  const BuildViewUserInfo(
      {super.key,
      required this.theUser,
      required this.profileData,
      required this.profileId,
      this.blockOrUnBlockId,
      this.userId});

  @override
  State<BuildViewUserInfo> createState() => _BuildUserInfoState();
}

class _BuildUserInfoState extends State<BuildViewUserInfo> {
  late PaginatedListController<CreatedBuddyEvent, EventCubit, EventState>
      _recentEventsPaginatedController;

  final ScrollController _recentEventsScrollController = ScrollController();

  EventCubit eventCubit = locator<EventCubit>();
  ProfileCubit profileCubit = locator<ProfileCubit>();
  ChatCubit chatCubit = locator<ChatCubit>();

  int activeTab = 1;
  bool _showFullBio = true;

  void toggleBio() => setState(() => _showFullBio = !_showFullBio);

  @override
  void initState() {
    super.initState();

    // Initialize paginated controller for recent activities
    _recentEventsPaginatedController =
        PaginatedListController<CreatedBuddyEvent, EventCubit, EventState>(
      fetchItems: (param) => eventCubit
          .fetchCreatedEventsCubit(param.copyWith(userId: widget.profileId)),
      cubit: eventCubit,
    );

    // Add scroll listeners
    _recentEventsScrollController.addListener(_scrollListener);
    _loadRecentEvents();
  }

  void _loadRecentEvents() {
    _recentEventsPaginatedController.loadNextPage(
      successCondition: (state) => state.status == EventsStatus.success,
      extractItems: (state) => state.createdEvents,
      isError: (state) => state.status == EventsStatus.error,
    );
  }

  void _scrollListener() {
    if (activeTab == 2 && _isRecentActivitiesBottom) {
      _loadRecentEvents();
    }
  }

  bool get _isRecentActivitiesBottom {
    if (!_recentEventsScrollController.hasClients) return false;
    final maxScroll = _recentEventsScrollController.position.maxScrollExtent;
    final currentScroll = _recentEventsScrollController.position.pixels;
    return currentScroll >= (maxScroll * 0.99);
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
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: 74,
                height: 74,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  image: DecorationImage(
                    image:
                        NetworkImage(widget.theUser.profile!.profilePhotoURL!),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(width: 5.0),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        if (widget.theUser.user!.isFullyVerified)
                          Image.asset('assets/images/badge.png',
                              width: 19, height: 19),
                        const SizedBox(width: 8),
                        Image.asset('assets/images/share.png',
                            width: 19, height: 19),
                        SubscriptionBadge(
                          text: widget.theUser.userSubscription?.name ?? '',
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
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
                        SizedBox(width: 15),
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
                        GenderAgeWidget(
                          gender: widget.theUser.profile?.gender
                                  ?.toString()
                                  .getFirstLetter ??
                              '',
                          age: widget.theUser.profile?.age ?? 0,
                        ),
                        SizedBox(width: 10),
                        GenderIndicator(
                          gender: widget.theUser.profile!.gender
                              .toString()
                              .getFirstLetter,
                        ),
                        Spacer(),
                        Text(
                          '${widget.theUser.profile?.residentialAddress?.city}, ${widget.theUser.profile?.residentialAddress?.country} ',
                          style: const TextStyle(
                            color: AppColors.grayscaleBody,
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                          ),
                        ),
                        Spacer(),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          // const SizedBox(height: 20),
          BlocBuilder<ProfileCubit, ProfileState>(
            builder: (context, state) {
              if (state is ProfileLoadedState) {
                final theUser = state.profile!.data;
                return Visibility(
                  visible: widget.profileData.isFriend ||
                      theUser?.userSubscription!.name?.trim() == 'Gold',
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: SizedBox(
                      height: 40,
                      child: PrimaryButton(
                        icon: 'assets/images/icons/chat_user.svg',
                        invert: false,
                        title: 'Chat User',
                        action: () async {
                          String? userId = await TokenUtil.getUserId();

                          if (!mounted) return;
                          context.router.push(
                            ChatConversationRoute(
                              userName:
                                  '${widget.theUser.profile!.firstName} ${widget.theUser.profile!.lastName}',
                              profileId: widget.profileId,
                              currentUserId: userId!,
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                );
              } else {
                return SizedBox.shrink();
              }
            },
          ),
          Visibility(
            visible:
                widget.profileData.isFriend && widget.profileData.isBlocked,
            child: Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: SizedBox(
                height: 40,
                child: PrimaryButton(
                  invert: false,
                  title: 'Block User',
                  state: profileCubit.state is ProfileBlockLoadingState,
                  action: () {
                    profileCubit.blockAccountCubit(
                      blockOrUnBlockId: widget.blockOrUnBlockId!,
                      userId: widget.userId!,
                    );
                  },
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          Container(
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
          ),
          const SizedBox(height: 20),
          Container(
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
                  onTabSelected: (int index) {
                    setState(() {
                      activeTab = index;
                    });
                  },
                ),
                TabButton(
                  title: 'Buddy events',
                  tabIndex: 2,
                  activeTab: activeTab,
                  onTabSelected: (int index) {
                    setState(() {
                      activeTab = index;
                      // _loadRecentPosts();
                    });
                  },
                ),
              ],
            ),
          ),
          if (activeTab == 1)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                UserBioWidget(
                  user: widget.theUser,
                  showFullBio: _showFullBio,
                  toggleBio: toggleBio,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Basic Profile",
                      style: TextStyle(
                        color: AppColors.grayscale,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 10),
                    BasicProfileProp(
                      leftTitle: 'Height',
                      leftValue: '${widget.theUser.profile?.height?.round()}cm',
                      rightTitle: 'Weight',
                      rightValue:
                          '${widget.theUser.profile?.weight?.round()}kg',
                    ),
                    BasicProfileProp(
                      leftTitle: 'Body Type',
                      leftValue: '${widget.theUser.profile?.bodyType}',
                      rightTitle: 'Occupation',
                      rightValue: '${widget.theUser.profile?.occupation}',
                    ),
                    BasicProfileProp(
                      leftTitle: 'Complexion',
                      leftValue: '${widget.theUser.profile?.complexion}',
                      rightTitle: 'Language',
                      rightValue: '${widget.theUser.profile?.languageCSV}',
                    ),
                    BasicProfileProp(
                      leftTitle: 'Religion',
                      leftValue: '${widget.theUser.profile?.religion}',
                    ),
                  ],
                ),
                if (widget.profileData.isFriend) SizedBox(height: 20),
                if (widget.profileData.isFriend)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Interest",
                        style: TextStyle(
                          color: AppColors.grayscale,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 10),
                      Wrap(
                        runSpacing: 10,
                        spacing: 10,
                        children: widget.theUser.interests
                                ?.map(
                                  (e) => InterestWidget(title: e.title),
                                )
                                .toList() ??
                            [],
                      ),
                    ],
                  ),
              ],
            )
          else
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.65,
              child: EventsWidget<EventCubit, EventState>(
                recentEventsPaginatedController:
                    _recentEventsPaginatedController,
                recentEventsScrollController: _recentEventsScrollController,
                isLoading: (state) => state.status == EventsStatus.loading,
                hasNoEvents: (state) => state.createdEvents.isEmpty,
                isError: (state) => state.status == EventsStatus.error,
                errorMessage: (state) => state.status == EventsStatus.error
                    ? state.status.toString()
                    : '',
              ),
            ),
        ],
      ),
    );
  }
}
