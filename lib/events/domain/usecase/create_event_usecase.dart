import 'package:injectable/injectable.dart';
import 'package:zheeta/app/common/type_def.dart';
import 'package:zheeta/app/common/usecase/usecases.dart';
import 'package:zheeta/events/data/request/create_buddy_event_request.dart';
import 'package:zheeta/events/domain/repository/event_repository.dart';

@prod
@LazySingleton()
class CreateBuddyEvent
    extends UsecaseWithParams<void, CreateBuddyEventRequest> {
  const CreateBuddyEvent(this._repo);

  final EventRepository _repo;

  @override
  ResultFuture<void> call(CreateBuddyEventRequest params) async =>
      await _repo.createBuddyEvent(params);
}
