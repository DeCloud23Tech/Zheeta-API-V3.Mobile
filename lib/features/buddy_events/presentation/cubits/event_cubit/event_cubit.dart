// import 'package:bloc/bloc.dart';
// import 'package:equatable/equatable.dart';
// import 'package:injectable/injectable.dart';
// import 'package:zheeta/core/common/param/pagination_param.dart';
// import 'package:zheeta/features/buddy_events/data/models/buddy_event_id.dart';
// import 'package:zheeta/features/buddy_events/data/models/buddy_events_feed.dart';
// import 'package:zheeta/features/buddy_events/data/models/created_buddy_event.dart';
// import 'package:zheeta/features/buddy_events/data/models/joined_buddy_event.dart';
// import 'package:zheeta/features/buddy_events/domain/usecases/created_event_usecase.dart';
// import 'package:zheeta/features/buddy_events/domain/usecases/get_event_details_usecase.dart';
// import 'package:zheeta/features/buddy_events/domain/usecases/get_event_feed_usecase.dart';
// import 'package:zheeta/features/buddy_events/domain/usecases/joined_event_usecase.dart';
//
// part 'event_state.dart';
//
// @prod
// @LazySingleton()
// class EventCubit extends Cubit<EventState> {
//   final GetBuddyEventsFeed getBuddyEventsFeed;
//   final GetAllJoinedEvents getAllJoinedEvents;
//   final GetAllCreatedEvents getAllCreatedEvents;
//   final GetBuddyEventDetails getBuddyEventDetails;
//
//   EventCubit({
//     required this.getAllJoinedEvents,
//     required this.getAllCreatedEvents,
//     required this.getBuddyEventsFeed,
//     required this.getBuddyEventDetails,
//   }) : super(EventState());
//
//   Future<void> fetchCreatedEventsCubit(PaginationParam request) async {
//     emit(state.copyWith(status: EventsStatus.loading));
//     final result = await getAllCreatedEvents(request);
//     result.fold(
//       (fail) {
//         emit(
//           state.copyWith(status: EventsStatus.error),
//         );
//       },
//       (success) {
//         emit(
//           state.copyWith(status: EventsStatus.success, createdEvents: success),
//         );
//       },
//     );
//   }
//
//   Future<void> fetchJoinedEventsCubit(PaginationParam request) async {
//     emit(state.copyWith(status: EventsStatus.loading));
//     final result = await getAllJoinedEvents(request);
//     result.fold(
//       (fail) {
//         emit(
//           state.copyWith(status: EventsStatus.error),
//         );
//       },
//       (success) {
//         emit(
//           state.copyWith(status: EventsStatus.success, joinedEvents: success),
//         );
//       },
//     );
//   }
//
//   Future<void> fetchBuddyEventsFeedCubit(PaginationParam request) async {
//     emit(state.copyWith(status: EventsStatus.loading));
//     final result = await getBuddyEventsFeed(request);
//     result.fold(
//       (fail) {
//         emit(state.copyWith(status: EventsStatus.error));
//       },
//       (success) {
//         emit(state.copyWith(
//             status: EventsStatus.success, buddyEventsFeed: success));
//       },
//     );
//   }
//
//   Future<void> fetchEventDetailsCubit(String eventId, String creatorId) async {
//     emit(state.copyWith(status: EventsStatus.loading));
//     final result = await getBuddyEventDetails(EventDetailsParams(
//       eventId: eventId,
//       creatorId: creatorId,
//     ));
//     result.fold(
//       (fail) {
//         emit(state.copyWith(status: EventsStatus.error));
//       },
//       (success) {
//         emit(state.copyWith(
//           status: EventsStatus.success,
//           buddyEventDetail: success,
//         ));
//       },
//     );
//   }
// }
