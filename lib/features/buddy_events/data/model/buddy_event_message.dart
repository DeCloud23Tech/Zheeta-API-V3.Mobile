import 'package:freezed_annotation/freezed_annotation.dart';

part 'buddy_event_message.freezed.dart';
part 'buddy_event_message.g.dart';

@freezed
class BuddyEventMessage with _$BuddyEventMessage {
  const factory BuddyEventMessage({
    required String buddyEventId,
    required String buddyEventCreatorId,
    required String userId,
    required String username,
    required String message,
    String? messageParentId,
    required String id,
    required String partitionKey,
    required DateTime lastModifiedDate,
    required DateTime createdDate,
  }) = _BuddyEventMessage;

  factory BuddyEventMessage.fromJson(Map<String, dynamic> json) =>
      _$BuddyEventMessageFromJson(json);
}
