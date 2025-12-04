import 'package:freezed_annotation/freezed_annotation.dart';

part 'buddy_event_join_request.freezed.dart';
part 'buddy_event_join_request.g.dart';

@freezed
abstract class BuddyEventJoinRequest with _$BuddyEventJoinRequest {
  const factory BuddyEventJoinRequest({
    required String buddyEventId,
    required String buddyEventCreatorId,
    required String userId,
    required String username,
    required String id,
    required String partitionKey,
    required DateTime lastModifiedDate,
    required DateTime createdDate,
  }) = _BuddyEventJoinRequest;

  factory BuddyEventJoinRequest.fromJson(Map<String, dynamic> json) =>
      _$BuddyEventJoinRequestFromJson(json);
}
