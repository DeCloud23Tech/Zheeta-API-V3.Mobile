import 'package:injectable/injectable.dart';
import 'package:zheeta/app/common/type_def.dart';
import 'package:zheeta/app/common/usecase/usecases.dart';
import 'package:zheeta/events/domain/repository/event_repository.dart';

@prod
@LazySingleton()
class ShareBuddyEvent extends UsecaseWithParams<void, ShareEventParams> {
  const ShareBuddyEvent(this._repo);

  final EventRepository _repo;

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