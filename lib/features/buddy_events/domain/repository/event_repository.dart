import 'package:zheeta/common/constants/type_def.dart';
import 'package:zheeta/features/buddy_events/data/model/buddy_event_id.dart';
import 'package:zheeta/features/buddy_events/data/model/buddy_event_verification.dart';
import 'package:zheeta/features/buddy_events/data/model/buddy_events_feed.dart';
import 'package:zheeta/features/buddy_events/data/model/create_buddy_event.dart';
import 'package:zheeta/features/buddy_events/data/model/created_buddy_event.dart';
import 'package:zheeta/features/buddy_events/data/model/joined_buddy_event.dart';
import 'package:zheeta/features/buddy_events/data/request/create_buddy_event_request.dart';
import 'package:zheeta/features/buddy_events/data/request/process_join_request.dart';
import 'package:zheeta/features/buddy_events/data/request/update_buddy_event_request.dart';

import '../../data/request/buddy_event_report_request.dart';

abstract class EventRepository {

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

  ResultVoid shareBuddyEvent({required String eventId,
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