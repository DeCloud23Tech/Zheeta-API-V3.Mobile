import 'package:zheeta/features/buddy_events/data/model/buddy_event_id.dart';
import 'package:zheeta/features/buddy_events/data/model/buddy_events_feed.dart';
import 'package:zheeta/features/buddy_events/data/model/create_buddy_event.dart';
import 'package:zheeta/features/buddy_events/data/model/created_buddy_event.dart';
import 'package:zheeta/features/buddy_events/data/model/joined_buddy_event.dart';
import 'package:zheeta/features/buddy_events/data/request/buddy_event_report_request.dart';
import 'package:zheeta/features/buddy_events/data/request/create_buddy_event_request.dart';
import 'package:zheeta/features/buddy_events/data/request/update_buddy_event_request.dart';

abstract class EventDataSource {
  Future<List<CreatedBuddyEvent>> getAllCreatedEvents({
    required int pageNumber,
    required int pageSize,
    String? userId,
  });

  Future<List<JoinedBuddyEvent>> getAllJoinedEvents(
      {required int pageNumber, required int pageSize});

  Future<CreateBuddyEventData> createBuddyEvent(
      CreateBuddyEventRequest request);

  Future<void> deleteBuddyEvent(String eventId);

  Future<BuddyEventId> getBuddyEventDetails({
    required String eventId,
    required String creatorId,
  });


  Future<List<BuddyEvent>> getBuddyEventsFeed({
    required int pageNumber,
    required int pageSize,
  });



  Future<void> shareBuddyEvent({
    required String eventId,
    required String posterId,
    required List<String> userIds,
  });

  Future<void> updateBuddyEvent({
    required String eventId,
    required UpdateBuddyEventRequest request,
  });

  Future<void> reportBuddyEvent(BuddyEventReportRequest request);

}
