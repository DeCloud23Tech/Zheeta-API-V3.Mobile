import 'package:zheeta/features/buddy_events/data/models/buddy_event_join_request.dart';
import 'package:zheeta/features/buddy_events/data/models/buddy_event_members.dart';
import 'package:zheeta/features/buddy_events/data/requests/process_join_request.dart';

abstract class IEventMemberDataSource {
  Future<void> sendJoinRequest({
    required String eventId,
    required String eventCreatorId,
  });

  Future<List<BuddyEventJoinRequest>> getJoinRequests({
    required String eventId,
    int? pageNumber,
    int? pageSize,
  });

  Future<void> processJoinRequest(ProcessJoinRequest request);

  Future<List<BuddyEventMember>> getBuddyEventMembers({
    required String eventId,
    int? pageNumber,
    int? pageSize,
  });

  Future<void> removeBuddyEventMember({
    required String eventId,
    required String memberId,
  });
}
