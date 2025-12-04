import 'package:zheeta/features/buddy_events/data/models/buddy_event_id.dart';
import 'package:zheeta/features/buddy_events/data/models/buddy_events_feed.dart';
import 'package:zheeta/features/buddy_events/data/models/create_buddy_event.dart';
import 'package:zheeta/features/buddy_events/data/models/created_buddy_event.dart';
import 'package:zheeta/features/buddy_events/data/models/joined_buddy_event.dart';
import 'package:zheeta/features/buddy_events/data/requests/buddy_event_report_request.dart';
import 'package:zheeta/features/buddy_events/data/requests/create_buddy_event_request.dart';
import 'package:zheeta/features/buddy_events/data/requests/update_buddy_event_request.dart';

abstract class IEventDataSource {
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
