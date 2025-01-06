import 'package:injectable/injectable.dart';
import 'package:zheeta/app/common/param/pagination_param.dart';
import 'package:zheeta/app/common/type_def.dart';
import 'package:zheeta/app/common/usecase/usecases.dart';
import 'package:zheeta/events/data/model/joined_buddy_event.dart';
import 'package:zheeta/events/domain/repository/event_repository.dart';

@prod
@LazySingleton()
class GetAllJoinedEvents
    extends UsecaseWithParams<List<JoinedBuddyEvent>, PaginationParam> {
  const GetAllJoinedEvents(this._repo);

  final EventRepository _repo;

  @override
  ResultFuture<List<JoinedBuddyEvent>> call(PaginationParam params) async =>
      await _repo.getAllJoinedEvents(
          pageNumber: params.pageNo, pageSize: params.pageSize);
}
