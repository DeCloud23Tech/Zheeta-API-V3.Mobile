import 'package:injectable/injectable.dart';
import 'package:zheeta/core/common/usecase/usecases.dart';
import 'package:zheeta/core/constants/type_def.dart';
import 'package:zheeta/features/buddy_events/domain/repositories/event_repository.dart';

@prod
@LazySingleton()
class ShareBuddyEvent extends UsecaseWithParams<void, ShareEventParams> {
  const ShareBuddyEvent(this._repo);

  final IEventRepository _repo;

  @override
  ResultFuture<void> call(ShareEventParams params) async =>
      await _repo.shareBuddyEvent(
        eventId: params.eventId,
        posterId: params.posterId,
        userIds: params.userIds,
      );
}

class ShareEventParams {
  final String eventId;
  final String posterId;
  final List<String> userIds;

  ShareEventParams({
    required this.eventId,
    required this.posterId,
    required this.userIds,
  });
}
