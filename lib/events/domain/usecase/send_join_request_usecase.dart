import 'package:injectable/injectable.dart';
import 'package:zheeta/app/common/param/pagination_param.dart';
import 'package:zheeta/app/common/type_def.dart';
import 'package:zheeta/app/common/usecase/usecases.dart';
import 'package:zheeta/events/data/model/joined_buddy_event.dart';
import 'package:zheeta/events/domain/repository/event_repository.dart';

@prod
@LazySingleton()
class SendJoinRequest extends UsecaseWithParams<void, JoinRequestParams> {
  const SendJoinRequest(this._repo);

  final EventRepository _repo;

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
