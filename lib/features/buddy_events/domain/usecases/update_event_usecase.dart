import 'package:injectable/injectable.dart';
import 'package:zheeta/core/common/usecase/usecases.dart';
import 'package:zheeta/core/constants/type_def.dart';
import 'package:zheeta/features/buddy_events/data/requests/update_buddy_event_request.dart';
import 'package:zheeta/features/buddy_events/domain/repositories/event_repository.dart';

@prod
@LazySingleton()
class UpdateBuddyEvent extends UsecaseWithParams<void, UpdateEventParams> {
  const UpdateBuddyEvent(this._repo);

  final IEventRepository _repo;

  @override
  ResultFuture<void> call(UpdateEventParams params) async =>
      await _repo.updateBuddyEvent(
        eventId: params.eventId,
        request: params.request,
      );
}

class UpdateEventParams {
  final String eventId;
  final UpdateBuddyEventRequest request;

  UpdateEventParams({
    required this.eventId,
    required this.request,
  });
}
