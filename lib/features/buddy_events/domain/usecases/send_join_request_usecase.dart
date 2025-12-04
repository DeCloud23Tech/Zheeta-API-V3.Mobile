import 'package:injectable/injectable.dart';
import 'package:zheeta/core/common/usecase/usecases.dart';
import 'package:zheeta/core/constants/type_def.dart';
import 'package:zheeta/features/buddy_events/domain/repositories/event_member_repository.dart';

@prod
@LazySingleton()
class SendJoinRequest extends UsecaseWithParams<void, JoinRequestParams> {
  const SendJoinRequest(this._repo);

  final IEventMemberRepository _repo;

  @override
  ResultFuture<void> call(JoinRequestParams params) async =>
      await _repo.sendJoinRequest(
        eventId: params.eventId,
        eventCreatorId: params.eventCreatorId,
      );
}

class JoinRequestParams {
  final String eventId;
  final String eventCreatorId;

  JoinRequestParams({
    required this.eventId,
    required this.eventCreatorId,
  });
}
