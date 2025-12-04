part of 'event_verification_cubit.dart';

enum EventVerificationStatus { initial, loading, loaded, error }

class EventVerificationState {
  final EventVerificationStatus status;
  final BuddyEventVerification? verification;
  final String? errorMessage;

  const EventVerificationState({
    required this.status,
    this.verification,
    this.errorMessage,
  });

  factory EventVerificationState.initial() =>
      const EventVerificationState(status: EventVerificationStatus.initial);

  EventVerificationState copyWith({
    EventVerificationStatus? status,
    BuddyEventVerification? verification,
    String? errorMessage,
  }) {
    return EventVerificationState(
      status: status ?? this.status,
      verification: verification ?? this.verification,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
