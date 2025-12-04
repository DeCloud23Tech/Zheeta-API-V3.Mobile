import 'package:freezed_annotation/freezed_annotation.dart';

part 'created_buddy_event.freezed.dart';
part 'created_buddy_event.g.dart';

@freezed
abstract class CreatedBuddyEvent with _$CreatedBuddyEvent {
  const factory CreatedBuddyEvent({
    required String id,
    required String creatorId,
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
  }) = _CreatedBuddyEvent;

  factory CreatedBuddyEvent.fromJson(Map<String, dynamic> json) =>
      _$CreatedBuddyEventFromJson(json);
}
