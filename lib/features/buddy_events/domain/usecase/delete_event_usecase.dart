import 'package:injectable/injectable.dart';
import 'package:zheeta/common/constants/type_def.dart';
import 'package:zheeta/common/usecase/usecases.dart';
import 'package:zheeta/features/buddy_events/domain/repository/event_repository.dart';

@prod
@LazySingleton()
class DeleteBuddyEvent extends UsecaseWithParams<void, String> {
  const DeleteBuddyEvent(this._repo);

  final EventRepository _repo;

  @override
  ResultFuture<void> call(String params) async =>
      await _repo.deleteBuddyEvent(params);
}
