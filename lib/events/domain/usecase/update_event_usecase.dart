import 'package:injectable/injectable.dart';
import 'package:zheeta/app/common/param/pagination_param.dart';
import 'package:zheeta/app/common/type_def.dart';
import 'package:zheeta/app/common/usecase/usecases.dart';
import 'package:zheeta/events/data/model/joined_buddy_event.dart';
import 'package:zheeta/events/data/request/update_buddy_event_request.dart';
import 'package:zheeta/events/domain/repository/event_repository.dart';

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
