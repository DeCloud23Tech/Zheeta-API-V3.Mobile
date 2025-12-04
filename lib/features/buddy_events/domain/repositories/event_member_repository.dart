import 'package:zheeta/core/constants/type_def.dart';
import 'package:zheeta/features/buddy_events/data/models/buddy_event_join_request.dart';
import 'package:zheeta/features/buddy_events/data/models/buddy_event_members.dart';
import 'package:zheeta/features/buddy_events/data/requests/process_join_request.dart';

abstract class IEventMemberRepository {
  ResultVoid sendJoinRequest({
    required String eventId,
    required String eventCreatorId,
  });

  ResultFuture<List<BuddyEventJoinRequest>> getJoinRequests({
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
