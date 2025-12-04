import 'package:injectable/injectable.dart';
import 'package:zheeta/core/common/usecase/usecases.dart';
import 'package:zheeta/core/constants/type_def.dart';
import 'package:zheeta/features/buddy_events/data/models/buddy_event_join_request.dart';
import 'package:zheeta/features/buddy_events/domain/repositories/event_member_repository.dart';

@prod
@LazySingleton()
class GetJoinRequests extends UsecaseWithParams<List<BuddyEventJoinRequest>,
    GetJoinRequestsParams> {
  const GetJoinRequests(this._repo);

  final IEventMemberRepository _repo;

  @override
  ResultFuture<List<BuddyEventJoinRequest>> call(
          GetJoinRequestsParams params) async =>
      await _repo.getJoinRequests(
        eventId: params.eventId,
        pageNumber: params.pageNo,
        pageSize: params.pageSize,
      );
}

class GetJoinRequestsParams {
  final String eventId;
  final int? pageNo;
  final int? pageSize;

  GetJoinRequestsParams({
    required this.eventId,
    this.pageNo,
    this.pageSize,
  });
}
