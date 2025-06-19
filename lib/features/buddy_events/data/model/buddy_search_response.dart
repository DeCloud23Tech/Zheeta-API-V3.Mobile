import 'package:freezed_annotation/freezed_annotation.dart';

part 'buddy_search_response.freezed.dart';
part 'buddy_search_response.g.dart';

@freezed
class BuddySearchResponse with _$BuddySearchResponse {
  const factory BuddySearchResponse({
    required int statusCode,
    required String message,
    required bool success,
    required int totalCount,
    required List<BuddyEventSearch> data,
  }) = _BuddySearchResponse;

  factory BuddySearchResponse.fromJson(Map<String, dynamic> json) =>
      _$BuddySearchResponseFromJson(json);
}

@freezed
class BuddyEventSearch with _$BuddyEventSearch {
  const factory BuddyEventSearch({
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
  }) = _BuddyEventSearch;

  factory BuddyEventSearch.fromJson(Map<String, dynamic> json) =>
      _$BuddyEventSearchFromJson(json);
}
