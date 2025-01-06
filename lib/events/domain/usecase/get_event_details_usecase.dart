import 'package:injectable/injectable.dart';
import 'package:zheeta/app/common/param/pagination_param.dart';
import 'package:zheeta/app/common/type_def.dart';
import 'package:zheeta/app/common/usecase/usecases.dart';
import 'package:zheeta/events/data/model/joined_buddy_event.dart';
import 'package:zheeta/events/domain/repository/event_repository.dart';

@prod
@LazySingleton()
class GetBuddyEventDetails
    extends UsecaseWithParams<BuddyEventDetails, EventDetailsParams> {
  const GetBuddyEventDetails(this._repo);

  final EventRepository _repo;

  @override
  ResultFuture<BuddyEventDetails> call(EventDetailsParams params) async =>
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
