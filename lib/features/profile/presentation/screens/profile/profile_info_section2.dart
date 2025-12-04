// import 'package:auto_route/auto_route.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:zheeta/core/constants/color.dart';
// import 'package:zheeta/core/utils/extensions/string_extension.dart';
// import 'package:zheeta/core/utils/pagination_controller.dart';
// import 'package:zheeta/di/di.dart';
// import 'package:zheeta/features/buddy_events/data/models/created_buddy_event.dart';
// import 'package:zheeta/features/buddy_events/presentation/cubits/event_cubit/event_cubit.dart';
// import 'package:zheeta/features/profile/data/models/user_profile_model.dart';
// import 'package:zheeta/features/profile/presentation/cubits/profile_boost_cubit/profile_boost_cubit.dart';
// import 'package:zheeta/features/profile/presentation/widgets/counter.dart';
// import 'package:zheeta/features/profile/presentation/widgets/events_posts.dart';
// import 'package:zheeta/features/profile/presentation/widgets/intrests_tile.dart';
// import 'package:zheeta/features/profile/presentation/widgets/recent-downlines.dart';
// import 'package:zheeta/features/profile/presentation/widgets/tab_button.dart';
// import 'package:zheeta/features/profile/presentation/widgets/user_bio.dart';
// import 'package:zheeta/router/app_router.gr.dart';
// import 'package:zheeta/shared/bottom_sheets/reusable_bottom_sheet.dart';
// import 'package:zheeta/shared/widgets/gender_age.dart';
// import 'package:zheeta/shared/widgets/gender_indicator.dart';
// import 'package:zheeta/shared/widgets/primary_button.dart';
// import 'package:zheeta/shared/widgets/subscription_badge.dart';
//
// class BuildUserInfo extends StatefulWidget {
//   final UserProfileDataModel theUser;
//
//   const BuildUserInfo({super.key, required this.theUser});
//
//   @override
//   State<BuildUserInfo> createState() => _BuildUserInfoState();
// }
//
// class _BuildUserInfoState extends State<BuildUserInfo> {
//   late PaginatedListController<CreatedBuddyEvent, EventCubit, EventState>
//       _recentEventsPaginatedController;
//
//   final ScrollController _recentEventsScrollController = ScrollController();
//   EventCubit eventCubit = locator<EventCubit>();
//   ProfileBoostCubit profileBoostCubit = locator<ProfileBoostCubit>();
//
//   int activeTab = 1;
//   bool _showFullBio = true;
//
//   void toggleBio() => setState(() => _showFullBio = !_showFullBio);
//
//   @override
//   void initState() {
//     super.initState();
//
//     // Initialize paginated controller for recent activities
//     _recentEventsPaginatedController =
//         PaginatedListController<CreatedBuddyEvent, EventCubit, EventState>(
//       fetchItems: (param) => eventCubit.fetchCreatedEventsCubit(param),
//       cubit: eventCubit,
//     );
//
//     // Add scroll listeners
//     _recentEventsScrollController.addListener(_scrollListener);
//
//     _loadRecentEvents();
//   }
//
//   void _loadRecentEvents() {
//     _recentEventsPaginatedController.loadNextPage(
//       successCondition: (state) => state.status == EventsStatus.success,
//       extractItems: (state) => state.createdEvents,
//       isError: (state) => state.status == EventsStatus.error,
//     );
//   }
//
//   void _scrollListener() {
//     if (activeTab == 2 && _isRecentActivitiesBottom) {
//       _loadRecentEvents();
//     }
//   }
//
//   bool get _isRecentActivitiesBottom {
//     if (!_recentEventsScrollController.hasClients) return false;
//     final maxScroll = _recentEventsScrollController.position.maxScrollExtent;
//     final currentScroll = _recentEventsScrollController.position.pixels;
//     return currentScroll >= (maxScroll * 0.99);
//   }
//
//   @override
//   void dispose() {
//     _recentEventsScrollController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(20.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Row(
//             children: [
//               Expanded(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       children: [
//                         if (widget.theUser.user?.isFullyVerified)
//                           Image.asset('assets/images/badge.png',
//                               width: 19, height: 19),
//                         const SizedBox(width: 8),
//                         Image.asset('assets/images/share.png',
//                             width: 19, height: 19),
//                         SubscriptionBadge(
//                           text: widget.theUser.userSubscription?.name ?? '',
//                         ),
//                       ],
//                     ),
//                     const SizedBox(height: 5),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       children: [
//                         Text(
//                           '@${(widget.theUser.user?.userName ?? '').toLowerCase()}',
//                           style: const TextStyle(
//                             color: AppColors.darkText,
//                             fontWeight: FontWeight.w600,
//                             fontSize: 20,
//                           ),
//                           overflow: TextOverflow.ellipsis,
//                         ),
//                         SizedBox(width: 15),
//                         Text(
//                           '${widget.theUser.profile?.firstName ?? ''} ${widget.theUser.profile?.lastName ?? ''}',
//                           style: const TextStyle(
//                             color: AppColors.grayscaleBody,
//                             fontWeight: FontWeight.w400,
//                             fontSize: 12,
//                           ),
//                           overflow: TextOverflow.ellipsis,
//                         ),
//                       ],
//                     ),
//                     const SizedBox(height: 5),
//                     Row(
//                       children: [
//                         Text(
//                           '${widget.theUser.profile?.residentialAddress?.city}, ${widget.theUser.profile?.residentialAddress?.country}',
//                           style: const TextStyle(
//                             color: AppColors.grayscaleBody,
//                             fontWeight: FontWeight.w400,
//                             fontSize: 12,
//                           ),
//                         ),
//                         Spacer(),
//                         GenderAgeWidget(
//                           gender: widget.theUser.profile?.gender
//                                   ?.toString()
//                                   .getFirstLetter ??
//                               '',
//                           age: widget.theUser.profile?.age ?? 0,
//                         ),
//                         SizedBox(width: 10),
//                         GenderIndicator(
//                           gender: widget.theUser.profile!.gender
//                               .toString()
//                               .getFirstLetter,
//                         ),
//                         Spacer(),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//               GestureDetector(
//                 onTap: () {
//                   showCustomModalBottomSheet(
//                     context: context,
//                     titles: [
//                       'Manage profile',
//                       'Manage interests',
//                       'Boost insights',
//                       'Manage access'
//                     ],
//                     icons: [
//                       'assets/images/icons/user-profile.svg',
//                       'assets/images/icons/interests-outline-rounded.svg',
//                       'assets/images/icons/boost-insight.svg',
//                       'assets/images/icons/user-access.svg'
//                     ],
//                     actions: [
//                       () => context.router.push(ProfileEditRoute(activeTab: 1)),
//                       () => context.router.push(ProfileEditRoute(activeTab: 2)),
//                       () {
//                         profileBoostCubit.getProfileBoostInsightCubit(
//                             widget.theUser.user?.userId);
//                         context.router.push(ProfileBoostInsightRoute(
//                             userName: widget.theUser.user?.userName ?? ''));
//                       },
//                       () => context.router.push(ProfileAccessManagementRoute()),
//                     ],
//                   );
//                 },
//                 child: Container(
//                   padding: const EdgeInsets.all(10),
//                   height: 40,
//                   width: 40,
//                   decoration: BoxDecoration(
//                     color: AppColors.white,
//                     borderRadius: BorderRadius.circular(100),
//                   ),
//                   child: SvgPicture.asset('assets/images/icons/dots.svg',
//                       width: 30),
//                 ),
//               ),
//             ],
//           ),
//           const SizedBox(height: 20),
//           Container(
//             padding: const EdgeInsets.all(22),
//             decoration: BoxDecoration(
//               color: AppColors.white,
//               borderRadius: BorderRadius.circular(8),
//             ),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 buildCounterWidget(
//                     count: widget.theUser.profileCounters?.friendsCount,
//                     label: 'Friends'),
//                 buildCounterWidget(
//                     count: widget.theUser.profileCounters?.downlinesCount,
//                     label: 'Downlines'),
//                 buildCounterWidget(
//                     count: widget.theUser.profileCounters?.successfulEventCount,
//                     label: 'Events'),
//               ],
//             ),
//           ),
//           const SizedBox(height: 20),
//           SizedBox(
//             height: 40,
//             child: PrimaryButton(
//               icon: 'assets/images/icons/rocket.svg',
//               title: 'Boost Profile',
//               action: () => context.router.push(ProfileBoostRoute()),
//             ),
//           ),
//           const SizedBox(height: 20),
//           Container(
//             height: 40,
//             width: double.infinity,
//             decoration: BoxDecoration(
//               color: AppColors.white,
//               borderRadius: BorderRadius.circular(8),
//             ),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 TabButton(
//                   title: 'Bio',
//                   tabIndex: 1,
//                   activeTab: activeTab,
//                   onTabSelected: (int index) {
//                     setState(() {
//                       activeTab = index;
//                     });
//                   },
//                 ),
//                 TabButton(
//                   title: 'Buddy events',
//                   tabIndex: 2,
//                   activeTab: activeTab,
//                   onTabSelected: (int index) {
//                     setState(() {
//                       activeTab = index;
//                       // _loadRecentPosts();
//                     });
//                   },
//                 ),
//               ],
//             ),
//           ),
//           if (activeTab == 1)
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 UserBioWidget(
//                   user: widget.theUser,
//                   showFullBio: _showFullBio,
//                   toggleBio: toggleBio,
//                 ),
//                 if (widget.theUser.userDownlines != null)
//                   RecentDownlinesWidget(
//                     userDownlines: widget.theUser.userDownlines!,
//                     onViewAll: () {
//                       // context.router.push(DownLinesRoute());
//                     },
//                   ),
//                 Text(
//                   "Interest",
//                   style: TextStyle(
//                     color: AppColors.grayscale,
//                     fontSize: 18,
//                     fontWeight: FontWeight.w600,
//                   ),
//                 ),
//                 SizedBox(height: 10),
//                 Wrap(
//                   runSpacing: 10,
//                   spacing: 10,
//                   children: widget.theUser.interests
//                           ?.map(
//                             (e) => InterestWidget(title: e.title!),
//                           )
//                           .toList() ??
//                       [],
//                 ),
//                 const SizedBox(height: 20),
//               ],
//             )
//           else
//             SizedBox(
//               height: MediaQuery.of(context).size.height * 0.65,
//               child: EventsWidget<EventCubit, EventState>(
//                 recentEventsPaginatedController:
//                     _recentEventsPaginatedController,
//                 recentEventsScrollController: _recentEventsScrollController,
//                 isLoading: (state) => state.status == EventsStatus.loading,
//                 hasNoEvents: (state) => state.createdEvents.isEmpty,
//                 isError: (state) => state.status == EventsStatus.error,
//                 errorMessage: (state) => state.status == EventsStatus.error
//                     ? state.status.toString()
//                     : '',
//               ),
//             ),
//         ],
//       ),
//     );
//   }
// }
