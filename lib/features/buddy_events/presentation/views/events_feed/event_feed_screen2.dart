// import 'package:auto_route/auto_route.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:shimmer/shimmer.dart';
// import 'package:zheeta/common/constants/color.dart';
// import 'package:zheeta/common/notify/notify_user.dart';
// import 'package:zheeta/core/injection/di.dart';
// import 'package:zheeta/core/router/app_router.gr.dart';
// import 'package:zheeta/features/buddy_events/data/model/buddy_events_feed.dart';
// import 'package:zheeta/features/buddy_events/presentation/bloc/event_cubit/event_cubit.dart';
// import 'package:zheeta/features/buddy_events/presentation/bloc/sponsored_boost_cubit/sponsored_boost_cubit.dart';
// import 'package:zheeta/features/buddy_events/presentation/views/profile_boost/sponsored_profiles_carousel.dart';
// import 'package:zheeta/features/buddy_events/presentation/widgets/feeds_search_bar.dart';
// import 'package:zheeta/features/buddy_events/presentation/widgets/reusable_event_card.dart';
// import 'package:zheeta/features/buddy_events/presentation/views/profile_boost/sponsored_profiles.dart';
// import 'package:zheeta/utils/pagination_controller.dart';
// import 'package:zheeta/widgets/loader.dart';
//
// @RoutePage()
// class EventFeedPage extends StatefulWidget {
//   const EventFeedPage({super.key});
//
//   @override
//   State<EventFeedPage> createState() => _EventFeedPageState();
// }
//
// class _EventFeedPageState extends State<EventFeedPage>
//     with AutomaticKeepAliveClientMixin {
//   @override
//   bool get wantKeepAlive => true;
//
//   final EventCubit eventsCubit = locator<EventCubit>();
//   final SponsoredBoostCubit sponsoredBoostCubit =
//       locator<SponsoredBoostCubit>();
//
//   static PaginatedListController<BuddyEvent, EventCubit, EventState>?
//       _eventsPaginatedController;
//
//   final ScrollController _scrollController = ScrollController();
//   final TextEditingController _searchController = TextEditingController();
//   final ValueNotifier<bool> _showRefreshPill = ValueNotifier(false);
//   final ValueNotifier<double> _appBarHeight = ValueNotifier(335.0);
//
//   @override
//   void initState() {
//     super.initState();
//
//     _searchController.addListener(_filterEvents);
//
//     _eventsPaginatedController =
//         PaginatedListController<BuddyEvent, EventCubit, EventState>(
//       fetchItems: (param) => eventsCubit.fetchBuddyEventsFeedCubit(param),
//       cubit: eventsCubit,
//     );
//     _loadEventsPage();
//
//     if (sponsoredBoostCubit.state is! SponsoredBoostLoadedState) {
//       sponsoredBoostCubit.fetchProfileBoostsCubit();
//     }
//
//     _scrollController.addListener(_scrollListener);
//   }
//
//   void _filterEvents() {
//     // Implement filtering logic
//   }
//
//   void _loadEventsPage() {
//     if (_eventsPaginatedController == null) return;
//     _eventsPaginatedController!.loadNextPage(
//       successCondition: (state) => state.status == EventsStatus.success,
//       extractItems: (state) => state.buddyEventsFeed,
//       isError: (state) => state.status == EventsStatus.error,
//     );
//   }
//
//   void _scrollListener() {
//     if (!_scrollController.hasClients) return;
//
//     final position = _scrollController.position;
//     final scrollOffset = position.pixels;
//     final direction = position.userScrollDirection;
//
//     // Show refresh pill when scrolling up quickly or reaching the top
//     if (direction == ScrollDirection.forward && scrollOffset < 30) {
//       _showRefreshPill.value = true;
//     } else if (direction == ScrollDirection.reverse && scrollOffset > 150) {
//       _showRefreshPill.value = false;
//     }
//
//     // Hide it when scrolling down
//     else if (direction == ScrollDirection.reverse) {
//       _showRefreshPill.value = false;
//     }
//
//     // Load more events when near the bottom
//     if (_isBottom) {
//       _loadEventsPage();
//     }
//   }
//
//   bool get _isBottom {
//     if (!_scrollController.hasClients) return false;
//     final maxScroll = _scrollController.position.maxScrollExtent;
//     final currentScroll = _scrollController.position.pixels;
//     return currentScroll >= (maxScroll * 0.9);
//   }
//
//   Future<void> _onRefresh() async {
//     _showRefreshPill.value = false;
//     sponsoredBoostCubit.fetchProfileBoostsCubit();
//     _eventsPaginatedController?.reset();
//     _loadEventsPage();
//   }
//
//   @override
//   void dispose() {
//     _scrollController.dispose();
//     _searchController.dispose();
//     _showRefreshPill.dispose();
//     sponsoredBoostCubit.reset();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     super.build(context);
//     return Stack(
//       children: [
//         RefreshIndicator(
//           onRefresh: _onRefresh,
//           child: CustomScrollView(
//             controller: _scrollController,
//             slivers: [
//               BlocBuilder<SponsoredBoostCubit, SponsoredBoostState>(
//                 builder: (context, state) {
//                   return SliverAppBar(
//                     backgroundColor: AppColors.primaryDark,
//                     automaticallyImplyLeading: false,
//                     floating: true,
//                     pinned: false,
//                     expandedHeight: state is! SponsoredBoostLoadedState
//                         ? 100.0
//                         : state.boosts.data.isNotEmpty
//                             ? _appBarHeight.value
//                             : 100.0,
//                     // Default height before loading
//                     flexibleSpace: FlexibleSpaceBar(
//                       background: Column(
//                         mainAxisSize: MainAxisSize.min,
//                         children: [
//                           FeedSearchBar(searchController: _searchController),
//                           const Divider(thickness: 0.3),
//                           if (state is SponsoredBoostLoadedState)
//                             const SponsoredProfilesSection(),
//                         ],
//                       ),
//                     ),
//                   );
//                 },
//               ),
//               BlocBuilder<EventCubit, EventState>(
//                 builder: (context, state) {
//                   if (_eventsPaginatedController == null ||
//                       (state.status == EventsStatus.loading &&
//                           _eventsPaginatedController!.items.isEmpty)) {
//                     return _buildFeedShimmerLoading();
//                   } else if (state.status == EventsStatus.success &&
//                       _eventsPaginatedController!.items.isEmpty) {
//                     return _buildSliverEmptyFeedsMessage();
//                   } else if (state.status == EventsStatus.error) {
//                     return SliverToBoxAdapter(
//                       child: Center(
//                         child: Column(
//                           mainAxisSize: MainAxisSize.min,
//                           children: [
//                             Text(
//                               'Failed to load events. Please try again.',
//                               style: TextStyle(
//                                 fontSize: 16,
//                                 fontWeight: FontWeight.w500,
//                                 color: AppColors.white,
//                               ),
//                             ),
//                             const SizedBox(height: 10),
//                             ElevatedButton(
//                               onPressed: _onRefresh,
//                               child: const Text('Retry'),
//                             ),
//                           ],
//                         ),
//                       ),
//                     );
//                   }
//
//                   return SliverList(
//                     delegate: SliverChildBuilderDelegate(
//                       (context, index) {
//                         if (index == _eventsPaginatedController!.items.length) {
//                           return _eventsPaginatedController!.hasMoreItems
//                               ? loadingIndicator()
//                               : const SizedBox.shrink();
//                         }
//
//                         if ((index + 1) % 16 == 0) {
//                           return Padding(
//                             padding: const EdgeInsets.only(bottom: 20.0),
//                             child: const SponsoredProfilesCarousel(),
//                           );
//                         }
//
//                         final feedPostIndex = index - (index ~/ 16);
//
//                         if (feedPostIndex >=
//                             _eventsPaginatedController!.items.length) {
//                           return const SizedBox.shrink();
//                         }
//
//                         final feedItem =
//                             _eventsPaginatedController!.items[index];
//
//                         return Padding(
//                           padding: const EdgeInsets.symmetric(horizontal: 15.0),
//                           child: EventCard(
//                             eventMainPhotoUrl: feedItem.eventMainPhotoUrl ?? '',
//                             startDate: feedItem.startDate!,
//                             title: feedItem.title ?? '',
//                             description: feedItem.description ?? '',
//                             eventLocationAddress:
//                                 feedItem.eventLocationAddress ?? '',
//                             noOfBuddiesJoined: feedItem.noOfBuddiesJoined!,
//                             noOfBuddiesWanted: feedItem.noOfBuddiesWanted!,
//                             eventParticipationCost: feedItem.eventFee,
//                             category: feedItem.category ?? '',
//                             onTap: () {
//                               context.router.push(EventDetailsRoute(
//                                 id: feedItem.id,
//                                 creatorId: feedItem.creatorId,
//                               ));
//                             },
//                           ),
//                         );
//                       },
//                       childCount: _eventsPaginatedController!.items.length + 1,
//                     ),
//                   );
//                 },
//               ),
//             ],
//           ),
//         ),
//
//         // Floating Refresh Pill
//         Positioned(
//           top: 10,
//           left: 0,
//           right: 0,
//           child: ValueListenableBuilder<bool>(
//             valueListenable: _showRefreshPill,
//             builder: (context, isVisible, child) {
//               return AnimatedOpacity(
//                 duration: const Duration(milliseconds: 300),
//                 opacity: isVisible ? 1.0 : 0.0,
//                 child: AnimatedSlide(
//                   duration: const Duration(milliseconds: 250),
//                   offset: isVisible ? Offset.zero : const Offset(0, -0.5),
//                   child: Center(
//                     child: GestureDetector(
//                       onTap: _onRefresh,
//                       child: Container(
//                         padding: const EdgeInsets.symmetric(
//                             horizontal: 36, vertical: 6),
//                         decoration: BoxDecoration(
//                           color: AppColors.secondaryLight,
//                           borderRadius: BorderRadius.circular(20),
//                           boxShadow: [
//                             BoxShadow(
//                               color: AppColors.white.withOpacity(0.2),
//                               blurRadius: 4,
//                             ),
//                           ],
//                         ),
//                         child: const Text(
//                           'Refresh Feed',
//                           style: TextStyle(
//                             fontSize: 12,
//                             color: AppColors.primaryDark,
//                             fontWeight: FontWeight.w600,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               );
//             },
//           ),
//         ),
//       ],
//     );
//   }
//
//   Widget _buildFeedShimmerLoading() {
//     return SliverList(
//       delegate: SliverChildBuilderDelegate(
//         (context, index) {
//           return Padding(
//             padding:
//                 const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
//             child: Shimmer.fromColors(
//               baseColor: Colors.grey[300]!,
//               highlightColor: Colors.grey[100]!,
//               child: Row(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   // Feed Content Placeholder
//                   Expanded(
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         // Title Bar
//                         Container(
//                           width: double.infinity,
//                           height: 15.0,
//                           color: Colors.grey[300],
//                         ),
//                         const SizedBox(height: 8.0),
//                         // Short Text Line
//                         Container(
//                           width: MediaQuery.of(context).size.width * 0.6,
//                           height: 12.0,
//                           color: Colors.grey[300],
//                         ),
//                         const SizedBox(height: 8.0),
//                         // Long Text Line
//                         Container(
//                           width: double.infinity,
//                           height: 12.0,
//                           color: Colors.grey[300],
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           );
//         },
//         childCount: 6, // Number of loading feed items
//       ),
//     );
//   }
//
//   Widget _buildSliverEmptyFeedsMessage() {
//     return SliverToBoxAdapter(
//       child: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 60.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: [
//             SvgPicture.asset('assets/images/icons/no-feed-item.svg'),
//             const SizedBox(height: 20),
//             const Text(
//               'No Buddy Event for you yet',
//               style: TextStyle(
//                 fontSize: 24,
//                 fontWeight: FontWeight.w500,
//                 color: AppColors.white,
//               ),
//             ),
//             const SizedBox(height: 20),
//             const Text(
//               'You presently have no feeds to display, kindly send your first friend request to start seeing feeds',
//               textAlign: TextAlign.center,
//               style: TextStyle(
//                 fontSize: 18,
//                 fontWeight: FontWeight.w400,
//                 color: AppColors.white,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
