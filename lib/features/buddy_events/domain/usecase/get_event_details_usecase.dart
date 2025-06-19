import 'package:injectable/injectable.dart';
import 'package:zheeta/common/constants/type_def.dart';
import 'package:zheeta/common/usecase/usecases.dart';
import 'package:zheeta/features/buddy_events/data/model/buddy_event_id.dart';
import 'package:zheeta/features/buddy_events/data/model/buddy_events_feed.dart';
import 'package:zheeta/features/buddy_events/domain/repository/event_repository.dart';


@prod
@LazySingleton()
class GetBuddyEventDetails
    extends UsecaseWithParams<BuddyEventId, EventDetailsParams> {
  const GetBuddyEventDetails(this._repo);

  final EventRepository _repo;

  @override
  ResultFuture<BuddyEventId> call(EventDetailsParams params) async =>
      await _repo.getBuddyEventDetails(
        eventId: params.eventId,
        creatorId: params.creatorId,
      );
}

class EventDetailsParams {
  final String eventId;
  final String creatorId;

  EventDetailsParams({
    required this.eventId,
    required this.creatorId,
  });
}
