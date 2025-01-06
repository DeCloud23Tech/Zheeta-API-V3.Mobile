import 'package:zheeta/events/data/model/created_buddy_event.dart';
import 'package:zheeta/events/data/model/buddy_events_feed.dart';
import 'package:zheeta/events/data/model/joined_buddy_event.dart';
import 'package:zheeta/events/data/request/create_buddy_event_request.dart';
import 'package:zheeta/events/data/request/process_join_request.dart';
import 'package:zheeta/events/data/request/update_buddy_event_request.dart';

import '../../domain/repository/event_repository.dart';


abstract class EventDataSource {
  Future<List<CreatedBuddyEvent>> getAllCreatedEvents(
      {required int pageNumber, required int pageSize, String? userId,});

  Future<List<JoinedBuddyEvent>> getAllJoinedEvents(
      {required int pageNumber, required int pageSize});

  Future<void> createBuddyEvent(CreateBuddyEventRequest request);

  Future<void> deleteBuddyEvent(String eventId);

  Future<BuddyEventDetails> getBuddyEventDetails({
    required String eventId,
    required String creatorId,
  });

  Future<List<BuddyEventMember>> getBuddyEventMembers({
    required String eventId,
    int? pageNumber,
    int? pageSize,
  });

  Future<List<BuddyEvent>> getBuddyEventsFeed({
    required int pageNumber,
    required int pageSize,
  });

  Future<List<FriendCreatedBuddyEvent>> getEventsCreatedByFriends({
    required int pageNumber,
    required int pageSize,
  });

  Future<List<JoinRequest>> getJoinRequests({
    required String eventId,
    int? pageNumber,
    int? pageSize,
  });

  Future<void> processJoinRequest(ProcessJoinRequest request);

  Future<void> removeBuddyEventMember({
    required String eventId,
    required String memberId,
  });

  Future<void> sendJoinRequest({
    required String eventId,
    required String eventCreatorId,
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
}
