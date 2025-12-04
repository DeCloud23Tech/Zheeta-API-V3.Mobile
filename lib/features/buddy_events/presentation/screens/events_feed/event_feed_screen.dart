import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shimmer/shimmer.dart';
import 'package:zheeta/core/constants/color.dart';
import 'package:zheeta/core/utils/pagination_controller.dart';
import 'package:zheeta/di/di.dart';
import 'package:zheeta/features/buddy_events/data/models/buddy_events_feed.dart';
import 'package:zheeta/features/buddy_events/domain/usecases/get_event_feed_usecase.dart';
import 'package:zheeta/features/buddy_events/presentation/cubits/event_cubit/buddy_events_feed_cubit.dart';
import 'package:zheeta/features/buddy_events/presentation/cubits/event_cubit/event_cubit.dart';
import 'package:zheeta/features/buddy_events/presentation/cubits/sponsored_boost_cubit/sponsored_boost_cubit.dart';
import 'package:zheeta/features/buddy_events/presentation/screens/profile_boost/sponsored_profiles.dart';
import 'package:zheeta/features/buddy_events/presentation/screens/profile_boost/sponsored_profiles_carousel.dart';
import 'package:zheeta/features/buddy_events/presentation/widgets/event_filter_bottomsheet.dart';
import 'package:zheeta/features/buddy_events/presentation/widgets/feeds_search_bar.dart';
import 'package:zheeta/features/buddy_events/presentation/widgets/reusable_event_card.dart';
import 'package:zheeta/router/app_router.gr.dart';
import 'package:zheeta/shared/widgets/loader.dart';

@RoutePage()
class EventFeedPage extends StatefulWidget {
  const EventFeedPage({super.key});

  @override
  State<EventFeedPage> createState() => _EventFeedPageState();
}

class _EventFeedPageState extends State<EventFeedPage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  late BuddyEventsFeedCubit _eventsCubit;
  late SponsoredBoostCubit _sponsoredBoostCubit;

  final ScrollController _scrollController = ScrollController();
  final TextEditingController _searchController = TextEditingController();
  final ValueNotifier<bool> _showRefreshPill = ValueNotifier(false);

  EventFilterResult? _currentFilters;

  @override
  void initState() {
    super.initState();
    _eventsCubit = locator<BuddyEventsFeedCubit>();
    _sponsoredBoostCubit = locator<SponsoredBoostCubit>();

    _searchController.addListener(_filterEvents);
    _scrollController.addListener(_scrollListener);

    _loadEvents();
    _sponsoredBoostCubit.fetchSponsoredBoosts();
  }

  void _loadEvents() {
    _eventsCubit.loadNextPage();
  }

  void _applyFilters(EventFilterResult filters) {
    setState(() => _currentFilters = filters);
    // _eventsCubit.applyParams(
    // EventFilterParams(
    //   category: filters.category,
    //   eventType: filters.eventType == 'Paid'
    //       ? 1
    //       : (filters.eventType == 'Free' ? 2 : null),
    //   eventCity: filters.city,
    //   eventState: filters.state,
    //   eventCountry: filters.country,
    //   pageNumber: 1,
    //   pageSize: 15,
    // ),
    // );
  }

  Future<void> _onRefresh() async {
    setState(() => _currentFilters = null);
    _eventsCubit.reset();
    _sponsoredBoostCubit.fetchSponsoredBoosts();
  }

  void _scrollListener() {
    if (!_scrollController.hasClients) return;
    final pos = _scrollController.position;

    // Refresh pill
    if (pos.userScrollDirection == ScrollDirection.forward && pos.pixels < 30) {
      _showRefreshPill.value = true;
    } else if (pos.userScrollDirection == ScrollDirection.reverse &&
        pos.pixels > 150) {
      _showRefreshPill.value = false;
    }

    // Pagination
    if (pos.pixels >= pos.maxScrollExtent * 0.9) _loadEvents();
  }

  void _filterEvents() {
    // Implement search logic if needed
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _searchController.dispose();
    _showRefreshPill.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      backgroundColor: AppColors.primaryDark,
      body: Stack(
        children: [
          RefreshIndicator(
            onRefresh: _onRefresh,
            child: CustomScrollView(
              controller: _scrollController,
              slivers: [
                // Sliver AppBar with Search & Sponsored Boosts
                BlocBuilder<SponsoredBoostCubit, SponsoredBoostState>(
                  bloc: _sponsoredBoostCubit,
                  builder: (context, state) {
                    return SliverAppBar(
                      backgroundColor: AppColors.primaryDark,
                      floating: true,
                      pinned: false,
                      // expandedHeight: 335.0,
                      expandedHeight: 100.0,
                      flexibleSpace: FlexibleSpaceBar(
                        background: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            FeedSearchBar(
                              searchController: _searchController,
                              onFilterApplied: _applyFilters,
                            ),
                            const Divider(thickness: 0.3),
                            // if (state.status == SponsoredBoostStatus.loaded &&
                            //     state.boosts != null &&
                            //     state.boosts!.data.isNotEmpty)
                            // const SponsoredProfilesSection(),
                          ],
                        ),
                      ),
                    );
                  },
                ),

                // Buddy Events Feed
                BlocBuilder<BuddyEventsFeedCubit, PaginationState<BuddyEvent>>(
                  bloc: _eventsCubit,
                  builder: (context, state) {
                    if (state.isLoading && state.items.isEmpty) {
                      return _buildFeedShimmerLoading();
                    } else if (state.items.isEmpty) {
                      return _buildSliverEmptyFeedsMessage();
                    }

                    return SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) {
                          if (index >= state.items.length) {
                            return state.hasMore
                                ? loadingIndicator()
                                : const SizedBox.shrink();
                          }

                          final feedItem = state.items[index];
                          return Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 15.0),
                            child: EventCard(
                              eventMainPhotoUrl:
                                  feedItem.eventMainPhotoUrl ?? '',
                              startDate: feedItem.startDate!,
                              title: feedItem.title ?? '',
                              description: feedItem.description ?? '',
                              eventLocationAddress:
                                  feedItem.eventLocationAddress ?? '',
                              noOfBuddiesJoined: feedItem.noOfBuddiesJoined!,
                              noOfBuddiesWanted: feedItem.noOfBuddiesWanted!,
                              eventParticipationCost: feedItem.eventFee,
                              category: feedItem.category ?? '',
                              onTap: () {
                                context.router.push(EventDetailsRoute(
                                  id: feedItem.id,
                                  creatorId: feedItem.creatorId,
                                ));
                              },
                            ),
                          );
                        },
                        childCount:
                            state.items.length + (state.hasMore ? 1 : 0),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),

          // Refresh Pill
          Positioned(
            top: 10,
            left: 0,
            right: 0,
            child: ValueListenableBuilder<bool>(
              valueListenable: _showRefreshPill,
              builder: (context, isVisible, child) {
                return AnimatedOpacity(
                  duration: const Duration(milliseconds: 300),
                  opacity: isVisible ? 1.0 : 0.0,
                  child: AnimatedSlide(
                    duration: const Duration(milliseconds: 250),
                    offset: isVisible ? Offset.zero : const Offset(0, -0.5),
                    child: Center(
                      child: GestureDetector(
                        onTap: _onRefresh,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 36, vertical: 6),
                          decoration: BoxDecoration(
                            color: AppColors.secondaryLight,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: AppColors.white.withOpacity(0.2),
                                blurRadius: 4,
                              ),
                            ],
                          ),
                          child: const Text(
                            'Refresh Feed',
                            style: TextStyle(
                              fontSize: 12,
                              color: AppColors.primaryDark,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  SliverList _buildFeedShimmerLoading() {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
          child: loadingIndicator(),
        ),
        childCount: 6,
      ),
    );
  }

  SliverToBoxAdapter _buildSliverEmptyFeedsMessage() {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 60.0),
        child: Column(
          children: [
            SvgPicture.asset('assets/images/icons/no-feed-item.svg'),
            const SizedBox(height: 20),
            const Text(
              'No Buddy Event for you yet',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w500,
                color: AppColors.white,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'You presently have no feeds to display, kindly send your first friend request to start seeing feeds',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w400,
                color: AppColors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
