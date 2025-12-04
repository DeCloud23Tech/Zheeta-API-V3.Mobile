import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_buddy_event.freezed.dart';
part 'create_buddy_event.g.dart';

@freezed
abstract class CreateBuddyEventData with _$CreateBuddyEventData {
  const factory CreateBuddyEventData({
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
    required DateTime startDate,
    required int durationOrLengthInHrs,
    required DateTime endDate,
    required String eventLocationAddress,
    required String eventCity,
    required String eventState,
    required String eventCountry,
    required String eventMainPhotoUrl,
    required List<String> eventOtherPhotosUrl,
  }) = _CreateBuddyEventData;

  factory CreateBuddyEventData.fromJson(Map<String, dynamic> json) =>
      _$CreateBuddyEventDataFromJson(json);
}
