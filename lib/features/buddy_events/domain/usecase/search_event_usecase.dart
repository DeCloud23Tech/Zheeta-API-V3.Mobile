import 'package:injectable/injectable.dart';
import 'package:zheeta/common/constants/type_def.dart';
import 'package:zheeta/common/usecase/usecases.dart';
import 'package:zheeta/features/buddy_events/data/model/buddy_search_response.dart';
import 'package:zheeta/features/buddy_events/domain/repository/event_search_repository.dart';

@prod
@LazySingleton()
class SearchBuddyEvent
    extends UsecaseWithParams<BuddySearchResponse, SearchBuddyEventParams> {
  const SearchBuddyEvent(this._repo);

  final EventSearchRepository _repo;

  @override
  ResultFuture<BuddySearchResponse> call(SearchBuddyEventParams params) async {
    return await _repo.searchBuddyEvent(
      searchWord: params.searchWord,
      pageNumber: params.pageNo,
      pageSize: params.pageSize,
    );
  }
}

class SearchBuddyEventParams {
  final String searchWord;
  final int pageNo;
  final int pageSize;

  SearchBuddyEventParams({
    required this.searchWord,
    required this.pageNo,
    required this.pageSize,
  });
}
