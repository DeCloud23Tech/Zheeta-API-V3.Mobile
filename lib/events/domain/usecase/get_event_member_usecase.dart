import 'package:injectable/injectable.dart';
import 'package:zheeta/app/common/param/pagination_param.dart';
import 'package:zheeta/app/common/type_def.dart';
import 'package:zheeta/app/common/usecase/usecases.dart';
import 'package:zheeta/events/data/model/joined_buddy_event.dart';
import 'package:zheeta/events/domain/repository/event_repository.dart';

@prod
@LazySingleton()
class GetBuddyEventMembers
    extends UsecaseWithParams<List<BuddyEventMember>, GetEventMembersParams> {
  const GetBuddyEventMembers(this._repo);

  final EventRepository _repo;

  @override
  ResultFuture<List<BuddyEventMember>> call(GetEventMembersParams params) async =>
      await _repo.getBuddyEventMembers(
        eventId: params.eventId,
        pageNumber: params.pageNo,
        pageSize: params.pageSize,
      );
}
class GetEventMembersParams {
  final String eventId;
  final int? pageNo;
  final int? pageSize;

  GetEventMembersParams({
    required this.eventId,
    this.pageNo,
    this.pageSize,
  });
}