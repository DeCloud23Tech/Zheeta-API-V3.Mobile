import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:zheeta/app/common/color.dart';
import 'package:zheeta/app/injection/di.dart';
import 'package:zheeta/app/pagination_controller.dart';
import 'package:zheeta/app/router/app_router.gr.dart';
import 'package:zheeta/events/data/model/buddy_events_feed.dart';
import 'package:zheeta/events/domain/repository/event_repository.dart';
import 'package:zheeta/events/presentation/bloc/event_cubit/event_cubit.dart';
import 'package:zheeta/events/presentation/bloc/sponsored_boost_cubit/sponsored_boost_cubit.dart';
import 'package:zheeta/events/presentation/widgets/feeds_search_bar.dart';
import 'package:zheeta/events/presentation/widgets/reusable_event_card.dart';
import 'package:zheeta/events/presentation/widgets/sponsored_profiles.dart';
import 'package:zheeta/events/presentation/widgets/sponsored_profiles_carousel.dart';
import 'package:zheeta/widgets/loader.dart';
import 'package:zheeta/widgets/search_field.dart';

@RoutePage()
class EventFeedPage extends StatefulWidget {
  const EventFeedPage({super.key});

  @override
  State<EventFeedPage> createState() => _EventFeedPageState();
}

class _EventFeedPageState extends State<EventFeedPage> {
  final TextEditingController _searchController = TextEditingController();
  List<BuddyEvent> filteredEvents = [];

  late PaginatedListController<BuddyEvent, EventCubit, EventState>
      _eventsPaginatedController;
  final ScrollController _scrollController = ScrollController();
  EventCubit eventsCubit = locator<EventCubit>();
  SponsoredBoostCubit sponsoredBoostCubit = locator<SponsoredBoostCubit>();

  @override
  void initState() {
    super.initState();

    sponsoredBoostCubit.fetchProfileBoostsCubit();
    _searchController.addListener(_filterEvents);

    // Initialize the paginated controller for buddy events
    _eventsPaginatedController =
        PaginatedListController<BuddyEvent, EventCubit, EventState>(
      fetchItems: (param) => eventsCubit.fetchBuddyEventsFeed(param),
      cubit: eventsCubit,
    );

    // Add scroll listener to load more items when reaching the bottom
    _scrollController.addListener(_scrollListener);

    // Load the initial page of buddy events
    _loadEventsPage();
  }

  void _filterEvents() {
    // setState(() {
    //   filteredEvents = _eventsPaginatedController.items.where((event) {
    //     return event.title
    //         .toLowerCase()
    //         .contains(_searchController.text.toLowerCase());
    //   }).toList();
    // });
  }

  void _loadEventsPage() {
    // Load the next page of buddy events
    _eventsPaginatedController.loadNextPage(
      successCondition: (state) => state.status == EventsStatus.success,
      extractItems: (state) => state.buddyEventsFeed,
      isError: (state) => state.status == EventsStatus.error,
    );
  }

  void _scrollListener() {
    if (_isBottom) {
      _loadEventsPage();
    }
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;
    return currentScroll >=
        (maxScroll * 0.9); // Trigger loading when 90% scrolled
  }

  Future<void> _onRefresh() async {
    _eventsPaginatedController.reset();
    _loadEventsPage();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        FeedSearchBar(searchController: _searchController),
        const Divider(thickness: 0.3),
        Expanded(
          child: RefreshIndicator(
            onRefresh: _onRefresh,
            child: BlocBuilder<EventCubit, EventState>(
              builder: (context, state) {
                if (state.status == EventsStatus.loading &&
                    _eventsPaginatedController.items.isEmpty) {
                  return LoadingIndicator();
                } else if (state.status == EventsStatus.success &&
                    _eventsPaginatedController.items.isEmpty) {
                  return _buildEmptyFeedsMessage();
                }

                return SingleChildScrollView(
                  controller: _scrollController,
                  child: Column(
                    children: [
                      const SponsoredProfilesSection(),

                      //                   ListView.builder(
                      //                     padding: const EdgeInsets.only(bottom: 120),
                      //                     shrinkWrap: true,
                      //                     physics: const NeverScrollableScrollPhysics(),
                      //                     itemCount: _eventsPaginatedController.items.length +
                      //                         (_eventsPaginatedController.items.length ~/ 15) +
                      //                         1,
                      //                     itemBuilder: (context, index) {
                      //                       if (index ==
                      //                           _eventsPaginatedController.items.length +
                      //                               (_eventsPaginatedController.items.length ~/
                      //                                   15)) {
                      //                         return _eventsPaginatedController.hasMoreItems &&
                      //                                 (_eventsPaginatedController.items.length >=
                      //                                     _eventsPaginatedController.pageSize)
                      //                             ? LoadingIndicator()
                      //                             : const SizedBox.shrink();
                      //                       }
                      //
                      //                       if ((index + 1) % 16 == 0) {
                      //                         return const SponsoredProfilesCarousel();
                      //                       }
                      //
                      //                       final feedPostIndex = index - (index ~/ 5);
                      //                       final feedItem =
                      //                           _eventsPaginatedController.items[feedPostIndex];
                      //                       return EventCard(
                      //                         eventMainPhotoUrl: feedItem.eventMainPhotoUrl,
                      //                         startDate: feedItem.startDate,
                      //                         title: feedItem.title,
                      //                         description: feedItem.description,
                      //                         eventLocationAddress: feedItem.eventLocationAddress,
                      //                         noOfBuddiesJoined: feedItem.noOfBuddiesJoined,
                      //                         noOfBuddiesWanted: feedItem.noOfBuddiesWanted,
                      //                         eventParticipationCost:
                      //                             feedItem.eventParticipationCost,
                      //                         category: feedItem.category,
                      //                         onTap: () {
                      // // context.router
                      // //     .push(FeedPostRoute(feedItem: feedItem));
                      //                         },
                      //                       );
                      //                       // FeedPostCard(
                      //                       // feedItem: feedItem,
                      //                       // onTap: () {
                      //
                      //                       // },
                      //                       // );
                      //                     },
                      //                   ),
                      ListView.builder(
                        padding: const EdgeInsets.only(bottom: 120),
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: _eventsPaginatedController.items.length +
                            (_eventsPaginatedController.items.length ~/ 16) +
                            1,
                        itemBuilder: (context, index) {
                          // Show Loading Indicator at the end
                          if (index ==
                              _eventsPaginatedController.items.length +
                                  (_eventsPaginatedController.items.length ~/
                                      16)) {
                            return _eventsPaginatedController.hasMoreItems &&
                                    (_eventsPaginatedController.items.length >=
                                        _eventsPaginatedController.pageSize)
                                ? LoadingIndicator()
                                : const SizedBox.shrink();
                          }

                          // Insert Sponsored Profiles Carousel every 16th position
                          if ((index + 1) % 16 == 0) {
                            return const SponsoredProfilesCarousel();
                          }

                          // Calculate the feed index
                          final feedPostIndex = index - (index ~/ 16);

                          // Bounds-checking for safety
                          if (feedPostIndex >=
                              _eventsPaginatedController.items.length) {
                            return const SizedBox.shrink();
                          }

                          // Display the event card
                          final feedItem =
                              _eventsPaginatedController.items[feedPostIndex];
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15.0),
                            child: EventCard(
                              eventMainPhotoUrl: feedItem.eventMainPhotoUrl,
                              startDate: feedItem.startDate,
                              title: feedItem.title,
                              description: feedItem.description,
                              eventLocationAddress: feedItem.eventLocationAddress,
                              noOfBuddiesJoined: feedItem.noOfBuddiesJoined,
                              noOfBuddiesWanted: feedItem.noOfBuddiesWanted,
                              eventParticipationCost:
                                  feedItem.eventParticipationCost,
                              category: feedItem.category,
                              onTap: () {
                                // Navigate to event details
                                context.router.push(EventDetailsRoute(event: feedItem));
                              },
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildEmptyFeedsMessage() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            'assets/images/icons/no-feed-item.svg',
          ),
          const SizedBox(height: 20),
          const Text(
            'No events-ref to display yet.',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w500,
              color: AppColors.white,
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            'You presently have no events-ref to display, kindly send your first friend request to start seeing events-ref',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w400,
              color: AppColors.white,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
