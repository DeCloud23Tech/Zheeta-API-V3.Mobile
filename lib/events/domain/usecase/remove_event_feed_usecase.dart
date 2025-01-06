import 'package:injectable/injectable.dart';
import 'package:zheeta/app/common/param/pagination_param.dart';
import 'package:zheeta/app/common/type_def.dart';
import 'package:zheeta/app/common/usecase/usecases.dart';
import 'package:zheeta/events/data/model/joined_buddy_event.dart';
import 'package:zheeta/events/domain/repository/event_repository.dart';

@prod
@LazySingleton()
class RemoveBuddyEventMember
    extends UsecaseWithParams<void, RemoveMemberParams> {
  const RemoveBuddyEventMember(this._repo);

  final EventRepository _repo;

  @override
  ResultFuture<void> call(RemoveMemberParams params) async =>
      await _repo.removeBuddyEventMember(
        eventId: params.eventId,
        memberId: params.memberId,
      );
}

class RemoveMemberParams {
  final String eventId;
  final String memberId;

  RemoveMemberParams({
    required this.eventId,
    required this.memberId,
  });
}
