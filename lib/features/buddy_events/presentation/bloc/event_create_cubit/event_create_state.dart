part of 'event_create_cubit.dart';

abstract class EventCreateState extends Equatable {
  const EventCreateState();
  @override
  List<Object?> get props => [];
}

class EventCreateInitial extends EventCreateState {}

class EventCreateUpdated extends EventCreateState {
  final Map<String, dynamic> eventData;

  const EventCreateUpdated(this.eventData);

  @override
  List<Object> get props => [eventData];
}

class EventCreateLoading extends EventCreateState {}

class EventCreateSuccess extends EventCreateState {
  final CreateBuddyEventData eventData;

  const EventCreateSuccess({required this.eventData});

  @override
  List<Object?> get props => [eventData];
}

class EventCreateFailure extends EventCreateState {
  final String errorMessage;

  const EventCreateFailure({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}
