import 'package:freezed_annotation/freezed_annotation.dart';

part 'buddy_events_feed.freezed.dart';
part 'buddy_events_feed.g.dart';


@freezed
class BuddyEvent with _$BuddyEvent {
  const factory BuddyEvent({
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
  }) = _BuddyEvent;

  factory BuddyEvent.fromJson(Map<String, dynamic> json) => _$BuddyEventFromJson(json);
}
