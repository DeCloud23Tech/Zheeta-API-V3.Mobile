import 'package:injectable/injectable.dart';
import 'package:zheeta/core/common/usecase/usecases.dart';
import 'package:zheeta/core/constants/type_def.dart';
import 'package:zheeta/features/buddy_events/data/models/buddy_event_id.dart';
import 'package:zheeta/features/buddy_events/domain/repositories/event_repository.dart';

@prod
@LazySingleton()
class GetBuddyEventDetails
    extends UsecaseWithParams<BuddyEventId, EventDetailsParams> {
  const GetBuddyEventDetails(this._repo);

  final IEventRepository _repo;

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
