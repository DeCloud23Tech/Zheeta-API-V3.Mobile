import 'package:injectable/injectable.dart';
import 'package:zheeta/app/common/param/pagination_param.dart';
import 'package:zheeta/app/common/type_def.dart';
import 'package:zheeta/app/common/usecase/usecases.dart';
import 'package:zheeta/events/data/model/buddy_events_feed.dart';
import 'package:zheeta/events/data/model/joined_buddy_event.dart';
import 'package:zheeta/events/domain/repository/event_repository.dart';

@prod
@LazySingleton()
class GetBuddyEventsFeed
    extends UsecaseWithParams<List<BuddyEvent>, PaginationParam> {
  const GetBuddyEventsFeed(this._repo);

  final EventRepository _repo;

  @override
  ResultFuture<List<BuddyEvent>> call(PaginationParam params) async =>
      await _repo.getBuddyEventsFeed(
        pageNumber: params.pageNo,
        pageSize: params.pageSize,
      );
}
