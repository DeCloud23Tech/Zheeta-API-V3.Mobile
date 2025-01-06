import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:zheeta/app/common/param/pagination_param.dart';
import 'package:zheeta/events/data/model/buddy_events_feed.dart';
import 'package:zheeta/events/data/model/created_buddy_event.dart';
import 'package:zheeta/events/data/model/joined_buddy_event.dart';
import 'package:zheeta/events/domain/repository/event_repository.dart';
import 'package:zheeta/events/domain/usecase/created_event_usecase.dart';
import 'package:zheeta/events/domain/usecase/get_event_feed_usecase.dart';
import 'package:zheeta/events/domain/usecase/joined_event_usecase.dart';

part 'event_state.dart';

@prod
@LazySingleton()
class EventCubit extends Cubit<EventState> {
  final GetBuddyEventsFeed getBuddyEventsFeed;
  final GetAllJoinedEvents getAllJoinedEvents;
  final GetAllCreatedEvents getAllCreatedEvents;

  EventCubit({
    required this.getAllJoinedEvents,
    required this.getAllCreatedEvents,
    required this.getBuddyEventsFeed,
  }) : super(EventState());

  Future<void> fetchCreatedEvents(PaginationParam request) async {
    emit(state.copyWith(status: EventsStatus.loading));
    final result = await getAllCreatedEvents(request);
    result.fold(
      (fail) {
        emit(
          state.copyWith(status: EventsStatus.error),
        );
      },
      (success) {
        emit(
          state.copyWith(status: EventsStatus.success, createdEvents: success),
        );
      },
    );
  }

  Future<void> fetchJoinedEvents(PaginationParam request) async {
    emit(state.copyWith(status: EventsStatus.loading));
    final result = await getAllJoinedEvents(request);
    result.fold(
      (fail) {
        emit(
          state.copyWith(status: EventsStatus.error),
        );
      },
      (success) {
        emit(
          state.copyWith(status: EventsStatus.success, joinedEvents: success),
        );
      },
    );
  }

  Future<void> fetchBuddyEventsFeed(PaginationParam request) async {
    emit(state.copyWith(status: EventsStatus.loading));
    final result = await getBuddyEventsFeed(request);
    result.fold(
      (fail) {
        emit(state.copyWith(status: EventsStatus.error));
      },
      (success) {
        emit(state.copyWith(
            status: EventsStatus.success, buddyEventsFeed: success));
      },
    );
  }
}
