import 'package:zheeta/core/constants/type_def.dart';
import 'package:zheeta/features/buddy_events/data/models/buddy_event_id.dart';
import 'package:zheeta/features/buddy_events/data/models/buddy_events_feed.dart';
import 'package:zheeta/features/buddy_events/data/models/create_buddy_event.dart';
import 'package:zheeta/features/buddy_events/data/models/created_buddy_event.dart';
import 'package:zheeta/features/buddy_events/data/models/joined_buddy_event.dart';
import 'package:zheeta/features/buddy_events/data/requests/buddy_event_report_request.dart';
import 'package:zheeta/features/buddy_events/data/requests/create_buddy_event_request.dart';
import 'package:zheeta/features/buddy_events/data/requests/update_buddy_event_request.dart';

abstract class IEventRepository {
  ResultFuture<List<BuddyEvent>> getBuddyEventsFeed({
    required int pageNumber,
    required int pageSize,
  });

  ResultFuture<List<CreatedBuddyEvent>> getAllCreatedEvents({
    required int pageNumber,
    required int pageSize,
    String? userId,
  });

  ResultFuture<List<JoinedBuddyEvent>> getAllJoinedEvents({
    required int pageNumber,
    required int pageSize,
  });

  ResultFuture<BuddyEventId> getBuddyEventDetails({
    required String eventId,
    required String creatorId,
  });

  ResultFuture<CreateBuddyEventData> createBuddyEvent(
      CreateBuddyEventRequest request);

  ResultVoid shareBuddyEvent(
      {required String eventId,
      required String posterId,
      required List<String> userIds});

  ResultVoid updateBuddyEvent(
      {required String eventId, required UpdateBuddyEventRequest request});

  ResultVoid deleteBuddyEvent(String eventId);

  ResultVoid reportBuddyEvent(BuddyEventReportRequest request);

// ResultFuture<List<FriendCreatedBuddyEvent>> getEventsCreatedByFriends({
//   required int pageNumber,
//   required int pageSize,
// });
}
