import 'package:zheeta/core/constants/type_def.dart';
import 'package:zheeta/features/buddy_events/data/models/buddy_search_response.dart';

abstract class IEventSearchRepository {
  ResultFuture<BuddySearchResponse> searchBuddyEvent({
    required String searchWord,
    required int pageNumber,
    required int pageSize,
  });
}
