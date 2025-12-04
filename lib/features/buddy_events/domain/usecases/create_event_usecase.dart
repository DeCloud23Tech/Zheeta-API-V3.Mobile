import 'package:injectable/injectable.dart';
import 'package:zheeta/core/common/usecase/usecases.dart';
import 'package:zheeta/core/constants/type_def.dart';
import 'package:zheeta/features/buddy_events/data/models/create_buddy_event.dart';
import 'package:zheeta/features/buddy_events/data/requests/create_buddy_event_request.dart';
import 'package:zheeta/features/buddy_events/domain/repositories/event_repository.dart';

@prod
@LazySingleton()
class CreateBuddyEvent
    extends UsecaseWithParams<CreateBuddyEventData, CreateBuddyEventRequest> {
  const CreateBuddyEvent(this._repo);

  final IEventRepository _repo;

  @override
  ResultFuture<CreateBuddyEventData> call(
          CreateBuddyEventRequest params) async =>
      await _repo.createBuddyEvent(params);
}
