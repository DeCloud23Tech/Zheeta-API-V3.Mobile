part of 'event_cubit.dart';

enum EventsStatus { initial, loading, success, error }

class EventState extends Equatable {
  final EventsStatus status;

  final List<JoinedBuddyEvent> joinedEvents;
  final List<CreatedBuddyEvent> createdEvents;
  final List<BuddyEvent> buddyEventsFeed;
  final BuddyEventId? buddyEventDetail;

  const EventState({
    this.status = EventsStatus.initial,
    this.joinedEvents = const [],
    this.createdEvents = const [],
    this.buddyEventsFeed = const [],
    this.buddyEventDetail,
  });

  EventState copyWith({
    EventsStatus? status,
    List<JoinedBuddyEvent>? joinedEvents,
    List<CreatedBuddyEvent>? createdEvents,
    List<BuddyEvent>? buddyEventsFeed,
    BuddyEventId? buddyEventDetail,
  }) {
    return EventState(
      status: status ?? this.status,
      joinedEvents: joinedEvents ?? this.joinedEvents,
      createdEvents: createdEvents ?? this.createdEvents,
      buddyEventsFeed: buddyEventsFeed ?? this.buddyEventsFeed,
      buddyEventDetail: buddyEventDetail ?? this.buddyEventDetail,
    );
  }

  @override
  List<Object?> get props => [
        status,
        joinedEvents,
        createdEvents,
        buddyEventsFeed,
        buddyEventDetail,
      ];
}
