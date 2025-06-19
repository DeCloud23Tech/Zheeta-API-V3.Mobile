import 'package:injectable/injectable.dart';
import 'package:zheeta/common/constants/type_def.dart';
import 'package:zheeta/common/usecase/usecases.dart';
import 'package:zheeta/features/buddy_events/data/request/process_join_request.dart';
import 'package:zheeta/features/buddy_events/domain/repository/event_member_repository.dart';

@prod
@LazySingleton()
class ProcessJoinEventRequest extends UsecaseWithParams<void, ProcessJoinRequest> {
  const ProcessJoinEventRequest(this._repo);

  final EventMemberRepository _repo;

  @override
  ResultFuture<void> call(ProcessJoinRequest params) async =>
      await _repo.processJoinRequest(params);
}

