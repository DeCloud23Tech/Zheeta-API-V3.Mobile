import 'package:zheeta/common/constants/type_def.dart';
import '../../data/model/buddy_event_message.dart';
import '../../data/request/buddy_event_send_message_request.dart';

abstract class EventMessageRepository {

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

