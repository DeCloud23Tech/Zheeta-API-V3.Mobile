import 'package:injectable/injectable.dart';
import 'package:zheeta/app/common/param/pagination_param.dart';
import 'package:zheeta/app/common/type_def.dart';
import 'package:zheeta/app/common/usecase/usecases.dart';
import 'package:zheeta/events/data/model/joined_buddy_event.dart';
import 'package:zheeta/events/domain/repository/event_repository.dart';

@prod
@LazySingleton()
class DeleteBuddyEvent extends UsecaseWithParams<void, String> {
  const DeleteBuddyEvent(this._repo);

  final EventRepository _repo;

  @override
  ResultFuture<void> call(String eventId) async =>
      await _repo.deleteBuddyEvent(eventId);
}
