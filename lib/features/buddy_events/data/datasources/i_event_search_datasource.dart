import 'package:zheeta/features/buddy_events/data/models/buddy_search_response.dart';

abstract class IEventSearchDataSource {
  Future<BuddySearchResponse> searchBuddyEvent({
    required String searchWord,
    required int pageNumber,
    required int pageSize,
  });
}
