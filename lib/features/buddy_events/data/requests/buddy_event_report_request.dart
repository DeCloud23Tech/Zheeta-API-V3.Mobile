import 'package:json_annotation/json_annotation.dart';

part 'buddy_event_report_request.g.dart';

@JsonSerializable()
class BuddyEventReportRequest {
  final String buddyEventId;
  final String buddyEventCreatorId;
  final String userId;
  final String username;
  final int reviewType;
  final String reason;

  BuddyEventReportRequest({
    required this.buddyEventId,
    required this.buddyEventCreatorId,
    required this.userId,
    required this.username,
    required this.reviewType,
    required this.reason,
  });

  /// Factory method for JSON deserialization
  factory BuddyEventReportRequest.fromJson(Map<String, dynamic> json) =>
      _$BuddyEventReportRequestFromJson(json);

  /// Method for JSON serialization
  Map<String, dynamic> toJson() => _$BuddyEventReportRequestToJson(this);
}
