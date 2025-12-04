import 'package:freezed_annotation/freezed_annotation.dart';

part 'buddy_event_id.freezed.dart';
part 'buddy_event_id.g.dart';

@freezed
abstract class BuddyEventId with _$BuddyEventId {
  const factory BuddyEventId({
    required String id,
    required String creatorId,
    required String creatorUsername,
    required String creatorProfilePhotoUrl,
    required String category,
    required String title,
    required String description,
    required int noOfBuddiesWanted,
    required int noOfBuddiesJoined,
    required String shareLink,
    required String startDate,
    required int durationOrLengthInHrs,
    required String endDate,
    required String eventLocationAddress,
    required String eventCity,
    required String eventState,
    required String eventCountry,
    required String eventMainPhotoUrl,
    required List<String> eventOtherPhotosUrl,
    required String buddyEventType,
    required List<String> tagList,
    required bool isPromoted,
    required bool isOpen,
    required bool isActive,
    List<String?>? eventItems,
    List<String?>? eventGuidelines,
    required String gender,
    required String targetCountry,
    required String maritalStatus,
    required String occupation,
    double? eventFee,
  }) = _BuddyEventId;

  factory BuddyEventId.fromJson(Map<String, dynamic> json) =>
      _$BuddyEventIdFromJson(json);
}
