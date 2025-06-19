import 'package:zheeta/features/buddy_events/data/model/buddy_search_response.dart';

abstract class EventSearchDataSource {

  Future<BuddySearchResponse> searchBuddyEvent({
    required String searchWord,
    required int pageNumber,
    required int pageSize,
  });
}
