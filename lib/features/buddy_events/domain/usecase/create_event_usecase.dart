import 'package:injectable/injectable.dart';
import 'package:zheeta/common/constants/type_def.dart';
import 'package:zheeta/common/usecase/usecases.dart';
import 'package:zheeta/features/buddy_events/data/model/create_buddy_event.dart';
import 'package:zheeta/features/buddy_events/data/request/create_buddy_event_request.dart';
import 'package:zheeta/features/buddy_events/domain/repository/event_repository.dart';

@prod
@LazySingleton()
class CreateBuddyEvent
    extends UsecaseWithParams<CreateBuddyEventData, CreateBuddyEventRequest> {
  const CreateBuddyEvent(this._repo);

  final EventRepository _repo;

  @override
  ResultFuture<CreateBuddyEventData> call(
          CreateBuddyEventRequest params) async =>
      await _repo.createBuddyEvent(params);
}
