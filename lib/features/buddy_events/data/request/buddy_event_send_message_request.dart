import 'package:json_annotation/json_annotation.dart';

part 'buddy_event_send_message_request.g.dart';

@JsonSerializable()
class BuddyEventSendMessageRequest {
  final String buddyEventId;
  final String buddyEventCreatorId;
  final String message;
  final String? messageParentId; // Nullable if replies are optional

  BuddyEventSendMessageRequest({
    required this.buddyEventId,
    required this.buddyEventCreatorId,
    required this.message,
    this.messageParentId,
  });

  /// Factory method for JSON deserialization
  factory BuddyEventSendMessageRequest.fromJson(Map<String, dynamic> json) =>
      _$BuddyEventSendMessageRequestFromJson(json);

  /// Method for JSON serialization
  Map<String, dynamic> toJson() => _$BuddyEventSendMessageRequestToJson(this);
}
