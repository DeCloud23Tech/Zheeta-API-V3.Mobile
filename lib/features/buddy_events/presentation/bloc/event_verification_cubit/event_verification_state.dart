part of 'event_verification_cubit.dart';

abstract class EventVerificationState extends Equatable {
  const EventVerificationState();

  @override
  List<Object?> get props => [];
}

class EventVerificationInitial extends EventVerificationState {}

class EventVerificationLoading extends EventVerificationState {}

class EventVerificationLoaded extends EventVerificationState {
  final BuddyEventVerification? verification;

  const EventVerificationLoaded(this.verification);

  @override
  List<Object?> get props => [verification];
}

class EventVerificationError extends EventVerificationState {
  final String message;

  const EventVerificationError(this.message);

  @override
  List<Object?> get props => [message];
}
