import 'package:freezed_annotation/freezed_annotation.dart';

part 'buddy_events_feed.freezed.dart';
part 'buddy_events_feed.g.dart';

@freezed
abstract class BuddyEvent with _$BuddyEvent {
  const factory BuddyEvent({
    required String id,
    required String? creatorId,
    required String? creatorUsername,
    required String? creatorProfilePhotoUrl,
    required String? category,
    required String? title,
    required String? description,
    required int? noOfBuddiesWanted,
    required int? noOfBuddiesJoined,
    required String? shareLink,
    required DateTime? startDate,
    required int? durationOrLengthInHrs,
    required DateTime? endDate,
    required String? eventLocationAddress,
    required String? eventCity,
    required String? eventState,
    required String? eventCountry,
    required String? eventMainPhotoUrl,
    required List<String>? eventOtherPhotosUrl,
    required List<String>? tagList,
    required bool? isPromoted,
    required bool? isOpen,
    required bool? isActive,
    required List<String>? eventItems,
    required List<String>? eventGuidelines,
    required String? gender,
    required String? targetCountry,
    required String? maritalStatus,
    required String? occupation,
    double? eventFee,
    int? buddyEventType,
  }) = _BuddyEvent;

  factory BuddyEvent.fromJson(Map<String, dynamic> json) =>
      _$BuddyEventFromJson(json);
}

//
// @freezed
// abstract class BuddyEvent with _$BuddyEvent {
//   const factory BuddyEvent({
//     required String id,
//     required String creatorId,
//     required String creatorUsername,
//     required String creatorProfilePhotoUrl,
//     required String category,
//     required String title,
//     required String description,
//     required int noOfBuddiesWanted,
//     required int noOfBuddiesJoined,
//     required String shareLink,
//     required DateTime startDate,
//     required int durationOrLengthInHrs,
//     required DateTime endDate,
//     required String eventLocationAddress,
//     required String eventCity,
//     required String eventState,
//     required String eventCountry,
//     required String eventMainPhotoUrl,
//     required List<String> eventOtherPhotosUrl,
//     required List<String> tagList,
//     required bool isPromoted,
//     required bool isOpen,
//     required bool isActive,
//     required List<String> eventItems,
//     required List<String> eventGuidelines,
//     required String gender,
//     required String targetCountry,
//     required String maritalStatus,
//     required String occupation,
//     double? eventFee,
//     int? buddyEventType,
//   }) = _BuddyEvent;
//
//   factory BuddyEvent.fromJson(Map<String, dynamic> json) =>
//       _$BuddyEventFromJson(json);
// }
