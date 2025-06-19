import 'package:zheeta/common/constants/type_def.dart';
import 'package:zheeta/features/buddy_events/data/request/process_join_request.dart';

import '../../data/model/buddy_event_join_request.dart';
import '../../data/model/buddy_event_members.dart';

abstract class EventMemberRepository {

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

