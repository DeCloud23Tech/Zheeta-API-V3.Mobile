import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:zheeta/core/common/usecase/usecases.dart';
import 'package:zheeta/core/constants/type_def.dart';
import 'package:zheeta/features/buddy_events/data/models/buddy_search_response.dart';
import 'package:zheeta/features/buddy_events/domain/repositories/event_search_repository.dart';

@prod
@LazySingleton()
class SearchBuddyEvent
    extends UsecaseWithParams<BuddySearchResponse, SearchBuddyEventParams> {
  const SearchBuddyEvent(this._repo);

  final IEventSearchRepository _repo;

  @override
  ResultFuture<BuddySearchResponse> call(SearchBuddyEventParams params) async {
    return await _repo.searchBuddyEvent(
      searchWord: params.searchWord,
      pageNumber: params.pageNo,
      pageSize: params.pageSize,
    );
  }
}

class SearchBuddyEventParams extends Equatable {
  final String searchWord;
  final int pageNo;
  final int pageSize;

  const SearchBuddyEventParams({
    required this.searchWord,
    required this.pageNo,
    required this.pageSize,
  });

  SearchBuddyEventParams copyWith({
    String? searchWord,
    int? pageNo,
    int? pageSize,
  }) {
    return SearchBuddyEventParams(
      searchWord: searchWord ?? this.searchWord,
      pageNo: pageNo ?? this.pageNo,
      pageSize: pageSize ?? this.pageSize,
    );
  }

  @override
  List<Object?> get props => [searchWord, pageNo, pageSize];
}
