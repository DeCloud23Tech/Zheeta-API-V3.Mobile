part of 'event_details_cubit.dart';

enum EventDetailsStatus { initial, loading, loaded, error }

class EventDetailsState extends Equatable {
  final EventDetailsStatus status;
  final BuddyEventId? event;
  final String? errorMessage;

  const EventDetailsState({
    required this.status,
    this.event,
    this.errorMessage,
  });

  factory EventDetailsState.initial() =>
      const EventDetailsState(status: EventDetailsStatus.initial);

  EventDetailsState copyWith({
    EventDetailsStatus? status,
    BuddyEventId? event,
    bool clearEvent = false,
    String? errorMessage,
    bool clearError = false,
  }) {
    return EventDetailsState(
      status: status ?? this.status,
      event: clearEvent ? null : (event ?? this.event),
      errorMessage: clearError ? null : (errorMessage ?? this.errorMessage),
    );
  }

  @override
  List<Object?> get props => [status, event, errorMessage];
}
