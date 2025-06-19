import 'package:zheeta/common/constants/type_def.dart';
import 'package:zheeta/features/buddy_events/data/model/buddy_search_response.dart';

abstract class EventSearchRepository {
  ResultFuture<BuddySearchResponse> searchBuddyEvent({
    required String searchWord,
    required int pageNumber,
    required int pageSize,
  });

}
