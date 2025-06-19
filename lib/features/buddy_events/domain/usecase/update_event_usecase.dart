import 'package:injectable/injectable.dart';
import 'package:zheeta/common/constants/type_def.dart';
import 'package:zheeta/common/usecase/usecases.dart';
import 'package:zheeta/features/buddy_events/data/request/create_buddy_event_request.dart';
import 'package:zheeta/features/buddy_events/data/request/update_buddy_event_request.dart';
import 'package:zheeta/features/buddy_events/domain/repository/event_repository.dart';


@prod
@LazySingleton()
class UpdateBuddyEvent extends UsecaseWithParams<void, UpdateEventParams> {
  const UpdateBuddyEvent(this._repo);

  final EventRepository _repo;

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
