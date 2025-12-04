import 'package:injectable/injectable.dart';
import 'package:zheeta/core/common/usecase/usecases.dart';
import 'package:zheeta/core/constants/type_def.dart';
import 'package:zheeta/features/buddy_events/domain/repositories/event_member_repository.dart';

@prod
@LazySingleton()
class RemoveBuddyEventMember
    extends UsecaseWithParams<void, RemoveMemberParams> {
  const RemoveBuddyEventMember(this._repo);

  final IEventMemberRepository _repo;

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
