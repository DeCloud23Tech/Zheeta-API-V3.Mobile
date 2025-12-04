import 'package:injectable/injectable.dart';
import 'package:zheeta/core/common/param/pagination_param.dart';
import 'package:zheeta/core/common/usecase/usecases.dart';
import 'package:zheeta/core/constants/type_def.dart';
import 'package:zheeta/features/buddy_events/data/models/created_buddy_event.dart';
import 'package:zheeta/features/buddy_events/domain/repositories/event_repository.dart';

@prod
@LazySingleton()
class GetAllCreatedEvents
    extends UsecaseWithParams<List<CreatedBuddyEvent>, PaginationParam> {
  const GetAllCreatedEvents(this._repo);

  final IEventRepository _repo;

  @override
  ResultFuture<List<CreatedBuddyEvent>> call(PaginationParam params) async =>
      await _repo.getAllCreatedEvents(
        pageNumber: params.pageNo,
        pageSize: params.pageSize,
        userId: params.userId,
      );
}
