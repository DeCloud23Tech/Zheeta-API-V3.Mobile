import 'package:json_annotation/json_annotation.dart';

part 'create_buddy_event_request.g.dart';

@JsonSerializable()
class CreateBuddyEventRequest {
  final String creatorId;
  final String category;
  final String title;
  final String description;
  final int noOfBuddiesWanted;
  final DateTime startDate;
  final int durationOrLengthInHrs;
  final String eventMainPhoto;
  final List<String>? eventOtherPhotos;
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
  final String gender;
  final String targetCountry;
  final String maritalStatus;
  final String occupation;

  CreateBuddyEventRequest({
    required this.creatorId,
    required this.category,
    required this.title,
    required this.description,
    required this.noOfBuddiesWanted,
    required this.startDate,
    required this.durationOrLengthInHrs,
    required this.eventMainPhoto,
    this.eventOtherPhotos,
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
    required this.gender,
    required this.targetCountry,
    required this.maritalStatus,
    required this.occupation,
  });

  factory CreateBuddyEventRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateBuddyEventRequestFromJson(json);

  Map<String, dynamic> toJson() => _$CreateBuddyEventRequestToJson(this);

  @override
  String toString() {
    return '''CreateBuddyEventRequest(
      creatorId: $creatorId,
      category: $category,
      title: $title,
      description: $description,
      noOfBuddiesWanted: $noOfBuddiesWanted,
      startDate: $startDate,
      durationOrLengthInHrs: $durationOrLengthInHrs,
      eventMainPhoto: $eventMainPhoto,
      eventOtherPhotos: ${eventOtherPhotos?.join(", ")},
      eventLocationAddress: $eventLocationAddress,
      eventCity: $eventCity,
      eventState: $eventState,
      eventCountry: $eventCountry,
      buddyEventType: $buddyEventType,
      tagList: ${tagList?.join(", ")},
      eventFee: $eventFee,
      isPromoted: $isPromoted,
      eventItems: ${eventItems?.join(", ")},
      eventGuidelines: ${eventGuidelines?.join(", ")},
      gender: $gender,
      targetCountry: $targetCountry,
      maritalStatus: $maritalStatus,
      occupation: $occupation
    )''';
  }
}
