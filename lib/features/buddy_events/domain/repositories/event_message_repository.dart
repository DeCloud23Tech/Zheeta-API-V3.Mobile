import 'package:zheeta/core/constants/type_def.dart';
import 'package:zheeta/features/buddy_events/data/models/buddy_event_message.dart';
import 'package:zheeta/features/buddy_events/data/requests/buddy_event_send_message_request.dart';

abstract class IEventMessageRepository {
  ResultVoid sendMessageRequest(BuddyEventSendMessageRequest request);

  ResultFuture<List<BuddyEventMessage>> getBuddyEventMessages({
    required String eventId,
    required String eventCreatorId,
    int? pageNumber,
    int? pageSize,
  });

  ResultVoid deleteBuddyEventMessage({
    required String buddyEventId,
    required String messageId,
  });
}
