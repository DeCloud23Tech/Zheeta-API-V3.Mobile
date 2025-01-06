import 'package:flutter/material.dart';
import 'package:zheeta/app/common/color.dart';
import 'package:zheeta/app/common/extensions/string_extension.dart';
import 'package:zheeta/app/injection/di.dart';
import 'package:zheeta/app/pagination_controller.dart';
import 'package:zheeta/app/router/app_router.dart';
import 'package:zheeta/events/data/model/created_buddy_event.dart';
import 'package:zheeta/events/presentation/bloc/event_cubit/event_cubit.dart';
import 'package:zheeta/profile/data/model/user_post_model.dart';
import 'package:zheeta/profile/data/model/user_profile_model.dart';
import 'package:zheeta/profile/data/model/view_profile_model.dart';
import 'package:zheeta/profile/presentation/widgets/basic_profile_prop.dart';
import 'package:zheeta/profile/presentation/widgets/counter.dart';
import 'package:zheeta/profile/presentation/widgets/intrests_tile.dart';
import 'package:zheeta/profile/presentation/widgets/events_posts.dart';
import 'package:zheeta/profile/presentation/widgets/tab_button.dart';
import 'package:zheeta/profile/presentation/widgets/user_bio.dart';
import 'package:zheeta/widgets/gender_age.dart';
import 'package:zheeta/widgets/gender_indicator.dart';
import 'package:zheeta/widgets/primary_button.dart';
import 'package:zheeta/widgets/subscription_badge.dart';

import '../../../../messages/presentation/views/chat_texts_screen.dart';

class BuildViewUserInfo extends StatefulWidget {
  final UserProfileDataModel theUser;
  final ViewProfileModel profileData;
  final String profileId;

  const BuildViewUserInfo(
      {super.key,
      required this.theUser,
      required this.profileData,
      required this.profileId});

  @override
  State<BuildViewUserInfo> createState() => _BuildUserInfoState();
}

class _BuildUserInfoState extends State<BuildViewUserInfo> {
  late PaginatedListController<CreatedBuddyEvent, EventCubit, EventState>
      _recentEventsPaginatedController;

  final ScrollController _recentEventsScrollController = ScrollController();
  EventCubit eventCubit = locator<EventCubit>();

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
          .fetchCreatedEvents(param.copyWith(userId: widget.profileId)),
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
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image:
                        NetworkImage(widget.theUser.profile!.profilePhotoURL!),
                  ),
                ),
                width: 65,
                height: 65,
              ),
              SizedBox(width: 5.0),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        if (widget.theUser.profile?.user!.isFullyVerified)
                          Image.asset('assets/images/badge.png',
                              width: 19, height: 19),
                        const SizedBox(width: 8),
                        Image.asset('assets/images/share.png',
                            width: 19, height: 19),
                        SubscriptionBadge(
                          text:
                              widget.theUser.profile?.userSubscription?.name ??
                                  '',
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 5.0),
                            child: Text(
                              '${widget.theUser.profile?.firstName} ${widget.theUser.profile?.lastName}',
                              style: const TextStyle(
                                color: AppColors.darkText,
                                fontWeight: FontWeight.w600,
                                fontSize: 20,
                              ),
                              overflow: TextOverflow
                                  .ellipsis, // Optional: Handle overflow with ellipsis
                            ),
                          ),
                        ),
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
                        const SizedBox(width: 10),
                      ],
                    ),
                    Text(
                      '${widget.theUser.profile?.residentialAddress?.city}, ${widget.theUser.profile?.residentialAddress?.country}',
                      style: const TextStyle(
                        color: AppColors.grey,
                        fontWeight: FontWeight.w400,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          // const SizedBox(height: 20),
          Visibility(
            visible: widget.profileData.isFriend ||
                widget.theUser.profile?.userSubscription!.name?.trim() ==
                    'Gold',
            child: Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: SizedBox(
                height: 40,
                child: PrimaryButton(
                  icon: 'assets/images/icons/chat_user.svg',
                  invert: false,
                  title: 'Chat User',
                  action: () {
                    print(widget.theUser.profile!.firstName);
                    print(widget.theUser.profile!.lastName);
                    print(widget.profileId);
                    final firstName = widget.theUser.profile?.firstName ?? '';
                    final lastName = widget.theUser.profile?.lastName ?? '';
                    final profileId = widget.profileId ?? '';
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ChatScreen(
                            userName: '$firstName $lastName',
                            profileId: widget.profileId),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
          Visibility(
            visible: widget.profileData.isFriend,
            child: Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: SizedBox(
                height: 40,
                child: PrimaryButton(
                  // icon: 'assets/images/icons/chat_user.svg',
                  invert: false,
                  title: 'Block User',
                  action: () {
                    // router.push(ProfileBoostRoute(
                    //   subscriptionPlan: theUser.subscription?.name,
                    // ));
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
                    label: 'Succ .. events'),
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
                if (!widget.profileData.isFriend)
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
                        leftValue:
                            '${widget.theUser.profile?.height?.round()}cm',
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
