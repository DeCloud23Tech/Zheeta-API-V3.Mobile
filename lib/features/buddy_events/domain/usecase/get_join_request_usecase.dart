import 'package:injectable/injectable.dart';
import 'package:zheeta/common/constants/type_def.dart';
import 'package:zheeta/common/usecase/usecases.dart';
import 'package:zheeta/features/buddy_events/data/model/buddy_event_join_request.dart';
import 'package:zheeta/features/buddy_events/domain/repository/event_member_repository.dart';


@prod
@LazySingleton()
class GetJoinRequests
    extends UsecaseWithParams<List<BuddyEventJoinRequest>, GetJoinRequestsParams> {
  const GetJoinRequests(this._repo);

  final EventMemberRepository _repo;

  @override
  ResultFuture<List<BuddyEventJoinRequest>> call(GetJoinRequestsParams params) async =>
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
