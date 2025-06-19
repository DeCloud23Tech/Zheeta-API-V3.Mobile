import 'package:freezed_annotation/freezed_annotation.dart';

part 'joined_buddy_event.freezed.dart';
part 'joined_buddy_event.g.dart';

@freezed
class JoinedBuddyEvent with _$JoinedBuddyEvent {
  const factory JoinedBuddyEvent({
    required String id,
    required String title,
    required String description,
    required String eventMainPhotoUrl,
    required DateTime startDate,
    required String category,
    required String eventLocationAddress,
    required String eventCity,
    required String eventState,
    required String eventCountry,
    required int noOfBuddiesWanted,
    required int noOfBuddiesJoined,
    required int buddyEventType,
    required bool isPromoted,
    double? eventParticipationCost,
  }) = _JoinedBuddyEvent;

  factory JoinedBuddyEvent.fromJson(Map<String, dynamic> json) =>
      _$JoinedBuddyEventFromJson(json);
}
