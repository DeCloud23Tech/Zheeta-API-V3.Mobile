import 'package:injectable/injectable.dart';
import 'package:zheeta/common/constants/type_def.dart';
import 'package:zheeta/common/usecase/usecases.dart';
import 'package:zheeta/features/buddy_events/data/model/buddy_event_members.dart';
import 'package:zheeta/features/buddy_events/domain/repository/event_member_repository.dart';

@prod
@LazySingleton()
class GetBuddyEventMembers
    extends UsecaseWithParams<List<BuddyEventMember>, GetEventMembersParams> {
  const GetBuddyEventMembers(this._repo);

  final EventMemberRepository _repo;

  @override
  ResultFuture<List<BuddyEventMember>> call(GetEventMembersParams params) async =>
      await _repo.getBuddyEventMembers(
        eventId: params.eventId,
        pageNumber: params.pageNo,
        pageSize: params.pageSize,
      );
}
class GetEventMembersParams {
  final String eventId;
  final int? pageNo;
  final int? pageSize;

  GetEventMembersParams({
    required this.eventId,
    this.pageNo,
    this.pageSize,
  });
}