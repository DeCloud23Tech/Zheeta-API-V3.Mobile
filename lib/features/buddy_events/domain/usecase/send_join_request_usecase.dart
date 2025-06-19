import 'package:injectable/injectable.dart';
import 'package:zheeta/common/constants/type_def.dart';
import 'package:zheeta/common/usecase/usecases.dart';
import 'package:zheeta/features/buddy_events/domain/repository/event_member_repository.dart';
import 'package:zheeta/features/buddy_events/domain/repository/event_repository.dart';

@prod
@LazySingleton()
class SendJoinRequest extends UsecaseWithParams<void, JoinRequestParams> {
  const SendJoinRequest(this._repo);

  final EventMemberRepository _repo;

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
