import 'package:json_annotation/json_annotation.dart';

part 'update_buddy_event_request.g.dart';

@JsonSerializable()
class UpdateBuddyEventRequest {
  final String category;
  final String title;
  final String description;
  final int noOfBuddiesWanted;
  final DateTime startDate;
  final int durationOrLengthInHrs;
  final String eventLocationAddress;
  final String eventCity;
  final String eventState;
  final String eventCountry;
  final int buddyEventType;
  final List<String>? tagList;
  final double eventFee;
  final bool isPromoted;
  final List<String>? eventItems;
  final List<String>? eventGuidelines;
  final String targetCountry;

  UpdateBuddyEventRequest({
    required this.category,
    required this.title,
    required this.description,
    required this.noOfBuddiesWanted,
    required this.startDate,
    required this.durationOrLengthInHrs,
    required this.eventLocationAddress,
    required this.eventCity,
    required this.eventState,
    required this.eventCountry,
    required this.buddyEventType,
    this.tagList,
    required this.eventFee,
    required this.isPromoted,
    this.eventItems,
    this.eventGuidelines,
    required this.targetCountry,
  });

  factory UpdateBuddyEventRequest.fromJson(Map<String, dynamic> json) => _$UpdateBuddyEventRequestFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateBuddyEventRequestToJson(this);
}
