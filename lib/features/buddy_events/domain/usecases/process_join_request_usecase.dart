import 'package:injectable/injectable.dart';
import 'package:zheeta/core/common/usecase/usecases.dart';
import 'package:zheeta/core/constants/type_def.dart';
import 'package:zheeta/features/buddy_events/data/requests/process_join_request.dart';
import 'package:zheeta/features/buddy_events/domain/repositories/event_member_repository.dart';

@prod
@LazySingleton()
class ProcessJoinEventRequest
    extends UsecaseWithParams<void, ProcessJoinRequest> {
  const ProcessJoinEventRequest(this._repo);

  final IEventMemberRepository _repo;

  @override
  ResultFuture<void> call(ProcessJoinRequest params) async =>
      await _repo.processJoinRequest(params);
}
