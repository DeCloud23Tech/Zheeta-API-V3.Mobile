import 'package:injectable/injectable.dart';
import 'package:zheeta/core/common/param/pagination_param.dart';
import 'package:zheeta/core/common/usecase/usecases.dart';
import 'package:zheeta/core/constants/type_def.dart';
import 'package:zheeta/features/buddy_events/data/models/buddy_events_feed.dart';
import 'package:zheeta/features/buddy_events/domain/repositories/event_repository.dart';

@prod
@LazySingleton()
class GetBuddyEventsFeed
    extends UsecaseWithParams<List<BuddyEvent>, PaginationParam> {
  const GetBuddyEventsFeed(this._repo);

  final IEventRepository _repo;

  @override
  ResultFuture<List<BuddyEvent>> call(PaginationParam params) async =>
      await _repo.getBuddyEventsFeed(
        pageNumber: params.pageNo,
        pageSize: params.pageSize,
      );
}

class EventFilterParams {
  final int pageNumber;
  final int pageSize;
  final String? category;
  final int? eventType; // Using int for API values (1 for Paid, 2 for Free)
  final String? eventCity;
  final String? eventState;
  final String? eventCountry;

  EventFilterParams({
    required this.pageNumber,
    required this.pageSize,
    this.category,
    this.eventType,
    this.eventCity,
    this.eventState,
    this.eventCountry,
  });

  // This method converts our type-safe class into the Map for the API
  Map<String, dynamic> toApiParams() {
    final Map<String, dynamic> params = {
      'PageNumber': pageNumber,
      'PageSize': pageSize,
    };
    if (category != null) params['Category'] = category;
    if (eventType != null) params['EventType'] = eventType;
    if (eventCity != null) params['EventCity'] = eventCity;
    if (eventState != null) params['EventState'] = eventState;
    if (eventCountry != null) params['EventCountry'] = eventCountry;

    return params;
  }
}
