// import 'package:auto_route/auto_route.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:shimmer/shimmer.dart';
// import 'package:zheeta/core/constants/color.dart';
// import 'package:zheeta/core/utils/pagination_controller.dart';
// import 'package:zheeta/di/di.dart';
// import 'package:zheeta/features/buddy_events/data/models/buddy_events_feed.dart';
// import 'package:zheeta/features/buddy_events/presentation/cubits/event_cubit/event_cubit.dart';
// import 'package:zheeta/features/buddy_events/presentation/cubits/sponsored_boost_cubit/sponsored_boost_cubit.dart';
// import 'package:zheeta/features/buddy_events/presentation/screens/profile_boost/sponsored_profiles.dart';
// import 'package:zheeta/features/buddy_events/presentation/screens/profile_boost/sponsored_profiles_carousel.dart';
// import 'package:zheeta/features/buddy_events/presentation/widgets/event_filter_bottomsheet.dart';
// import 'package:zheeta/features/buddy_events/presentation/widgets/feeds_search_bar.dart';
// import 'package:zheeta/features/buddy_events/presentation/widgets/reusable_event_card.dart';
// import 'package:zheeta/router/app_router.gr.dart';
// import 'package:zheeta/shared/widgets/loader.dart';
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
//   // MODIFIED: Removed 'static' to allow re-assignment
//   PaginatedListController<BuddyEvent, EventCubit, EventState>?
//       _eventsPaginatedController;
//
//   final ScrollController _scrollController = ScrollController();
//   final TextEditingController _searchController = TextEditingController();
//   final ValueNotifier<bool> _showRefreshPill = ValueNotifier(false);
//   final ValueNotifier<double> _appBarHeight = ValueNotifier(335.0);
//
//   // NEW: State variable to hold the selected filters
//   EventFilterResult? _currentFilters;
//
//   @override
//   void initState() {
//     super.initState();
//     _searchController.addListener(_filterEvents);
//
//     // MODIFIED: Set up the controller using a new helper method
//     _initializeController();
//
//     sponsoredBoostCubit.fetchProfileBoostsCubit();
//     _loadEventsPage();
//     _scrollController.addListener(_scrollListener);
//   }
//
//   // NEW: Helper method to initialize or re-initialize the controller.
//   // This is the core of the filtering logic.
//   void _initializeController() {
//     _eventsPaginatedController =
//         PaginatedListController<BuddyEvent, EventCubit, EventState>(
//       fetchItems: (paginationParam) {
//         // Create the type-safe params object here
//         final params = EventFilterParams(
//           pageNumber: paginationParam.pageNo,
//           pageSize: paginationParam.pageSize,
//           category: _currentFilters?.category,
//           eventType: _currentFilters?.eventType == 'Paid'
//               ? 1
//               : (_currentFilters?.eventType == 'Free' ? 2 : null),
//           eventCity: _currentFilters?.city,
//           eventState: _currentFilters?.state,
//           eventCountry: _currentFilters?.country,
//         );
//
//         // Call the cubit with the strongly-typed object
//         return eventsCubit.fetchBuddyEventsFeedCubit(params);
//       },
//       cubit: eventsCubit,
//     );
//   }
//
//   // NEW: This function is called by the FeedSearchBar when filters are applied.
//   void _applyFilters(EventFilterResult filters) {
//     setState(() {
//       _currentFilters = filters;
//       // Re-create the controller so its 'fetchItems' closure captures the new filters
//       _initializeController();
//     });
//     // Load page 1 of the new, filtered results
//     _loadEventsPage();
//   }
//
//   // MODIFIED: The _onRefresh method now also resets the filters.
//   @override
//   Future<void> _onRefresh() async {
//     _showRefreshPill.value = false;
//     setState(() {
//       // Clear any active filters
//       _currentFilters = null;
//       // Re-create the controller to ensure it fetches without filters
//       _initializeController();
//     });
//     sponsoredBoostCubit.fetchProfileBoostsCubit();
//     // The reset method clears the item list and resets the page number to 1
//     _eventsPaginatedController?.reset();
//     _loadEventsPage();
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
//   // No changes needed below this point for the filtering logic
//   // ...
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
//                     flexibleSpace: FlexibleSpaceBar(
//                       background: Column(
//                         mainAxisSize: MainAxisSize.min,
//                         children: [
//                           // MODIFIED: Pass the _applyFilters function to the search bar
//                           FeedSearchBar(
//                             searchController: _searchController,
//                             onFilterApplied: _applyFilters,
//                           ),
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
//                             child: SponsoredProfilesCarousel(),
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
//                             _eventsPaginatedController!.items[feedPostIndex];
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
//                       childCount: _eventsPaginatedController!.items.length +
//                           (_eventsPaginatedController!.hasMoreItems ? 1 : 0),
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
//   void _filterEvents() {
//     // Implement filtering logic
//   }
//
//   @override
//   void dispose() {
//     _scrollController.dispose();
//     _searchController.dispose();
//     _showRefreshPill.dispose();
//     super.dispose();
//   }
//
//   bool get _isBottom {
//     if (!_scrollController.hasClients) return false;
//     final maxScroll = _scrollController.position.maxScrollExtent;
//     final currentScroll = _scrollController.position.pixels;
//     return currentScroll >= (maxScroll * 0.9);
//   }
//
//   void _scrollListener() {
//     if (!_scrollController.hasClients) return;
//
//     final position = _scrollController.position;
//     final scrollOffset = position.pixels;
//     final direction = position.userScrollDirection;
//
//     if (direction == ScrollDirection.forward && scrollOffset < 30) {
//       _showRefreshPill.value = true;
//     } else if (direction == ScrollDirection.reverse && scrollOffset > 150) {
//       _showRefreshPill.value = false;
//     } else if (direction == ScrollDirection.reverse) {
//       _showRefreshPill.value = false;
//     }
//
//     if (_isBottom) {
//       _loadEventsPage();
//     }
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
//                   Expanded(
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Container(
//                           width: double.infinity,
//                           height: 15.0,
//                           color: Colors.grey[300],
//                         ),
//                         const SizedBox(height: 8.0),
//                         Container(
//                           width: MediaQuery.of(context).size.width * 0.6,
//                           height: 12.0,
//                           color: Colors.grey[300],
//                         ),
//                         const SizedBox(height: 8.0),
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
//         childCount: 6,
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
