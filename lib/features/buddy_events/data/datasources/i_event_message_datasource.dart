import 'package:zheeta/features/buddy_events/data/models/buddy_event_message.dart';
import 'package:zheeta/features/buddy_events/data/requests/buddy_event_send_message_request.dart';

abstract class IEventMessageDataSource {
  Future<void> sendMessageRequest(BuddyEventSendMessageRequest request);

  Future<List<BuddyEventMessage>> getBuddyEventMessages({
    required String eventId,
    required String eventCreatorId,
    int? pageNumber,
    int? pageSize,
  });

  Future<void> deleteBuddyEventMessage({
    required String buddyEventId,
    required String messageId,
  });
}
