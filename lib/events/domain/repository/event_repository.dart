import 'package:zheeta/app/common/type_def.dart';
import 'package:zheeta/events/data/model/created_buddy_event.dart';
import 'package:zheeta/events/data/model/buddy_events_feed.dart';
import 'package:zheeta/events/data/model/joined_buddy_event.dart';
import 'package:zheeta/events/data/request/create_buddy_event_request.dart';
import 'package:zheeta/events/data/request/process_join_request.dart';
import 'package:zheeta/events/data/request/update_buddy_event_request.dart';

abstract class EventRepository {
  ResultFuture<List<CreatedBuddyEvent>> getAllCreatedEvents({
    required int pageNumber,
    required int pageSize,
    String? userId,
  });

  ResultFuture<List<JoinedBuddyEvent>> getAllJoinedEvents({
    required int pageNumber,
    required int pageSize,
  });

  ResultVoid createBuddyEvent(CreateBuddyEventRequest request);

  ResultVoid shareBuddyEvent(
      {required String eventId,
      required String posterId,
      required List<String> userIds});

  ResultVoid updateBuddyEvent(
      {required String eventId, required UpdateBuddyEventRequest request});

  ResultVoid deleteBuddyEvent(String eventId);

  ResultFuture<BuddyEventDetails> getBuddyEventDetails({
    required String eventId,
    required String creatorId,
  });

  ResultFuture<List<BuddyEvent>> getBuddyEventsFeed({
    required int pageNumber,
    required int pageSize,
  });

  ResultFuture<List<FriendCreatedBuddyEvent>> getEventsCreatedByFriends({
    required int pageNumber,
    required int pageSize,
  });

  ResultVoid sendJoinRequest({
    required String eventId,
    required String eventCreatorId,
  });

  ResultFuture<List<JoinRequest>> getJoinRequests({
    required String eventId,
    int? pageNumber,
    int? pageSize,
  });

  ResultVoid processJoinRequest(ProcessJoinRequest request);

  ResultFuture<List<BuddyEventMember>> getBuddyEventMembers({
    required String eventId,
    int? pageNumber,
    int? pageSize,
  });

  ResultVoid removeBuddyEventMember({
    required String eventId,
    required String memberId,
  });
}

class FriendCreatedBuddyEvent {}

class JoinRequest {}

class BuddyEventMember {}


class BuddyEventDetails {}
