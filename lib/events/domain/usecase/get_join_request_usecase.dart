import 'package:injectable/injectable.dart';
import 'package:zheeta/app/common/param/pagination_param.dart';
import 'package:zheeta/app/common/type_def.dart';
import 'package:zheeta/app/common/usecase/usecases.dart';
import 'package:zheeta/events/data/model/joined_buddy_event.dart';
import 'package:zheeta/events/domain/repository/event_repository.dart';

@prod
@LazySingleton()
class GetJoinRequests
    extends UsecaseWithParams<List<JoinRequest>, GetJoinRequestsParams> {
  const GetJoinRequests(this._repo);

  final EventRepository _repo;

  @override
  ResultFuture<List<JoinRequest>> call(GetJoinRequestsParams params) async =>
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
