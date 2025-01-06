part of 'event_cubit.dart';

enum EventsStatus { initial, loading, success, error, joinedEvent, leftEvent }

class EventState extends Equatable {
  final EventsStatus status;
  // final List<EventModel> events;
  final List<JoinedBuddyEvent> joinedEvents;
  final List<CreatedBuddyEvent> createdEvents;
  final List<BuddyEvent> buddyEventsFeed;

  const EventState({
    this.status = EventsStatus.initial,
    // this.events = const [],
    this.joinedEvents = const [],
    this.createdEvents = const [],
    this.buddyEventsFeed = const [],
  });

  EventState copyWith({
    EventsStatus? status,
    // List<EventModel>? events,
    List<JoinedBuddyEvent>? joinedEvents,
    List<CreatedBuddyEvent>? createdEvents,
    List<BuddyEvent>? buddyEventsFeed,
  }) {
    return EventState(
      status: status ?? this.status,
      // events: events ?? this.events,
      joinedEvents: joinedEvents ?? this.joinedEvents,
      createdEvents: createdEvents ?? this.createdEvents,
      buddyEventsFeed: buddyEventsFeed ?? this.buddyEventsFeed,
    );
  }

  @override
  List<Object> get props => [
    status,
    // events,
    joinedEvents,
    createdEvents,
    buddyEventsFeed,
  ];
}