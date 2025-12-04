import 'package:injectable/injectable.dart';
import 'package:zheeta/core/common/param/pagination_param.dart';
import 'package:zheeta/core/utils/pagination_controller.dart';
import 'package:zheeta/features/buddy_events/data/models/buddy_search_response.dart';
import 'package:zheeta/features/buddy_events/domain/usecases/search_event_usecase.dart';

/// Cubit to search buddy events with pagination (like Gifts Cubits)
@prod
@injectable
class SearchBuddyEventCubit
    extends PaginationCubit<BuddyEventSearch, SearchBuddyEventParams> {
  final SearchBuddyEvent _searchBuddyEvent;

  SearchBuddyEventCubit({
    required SearchBuddyEvent searchBuddyEvent,
  })  : _searchBuddyEvent = searchBuddyEvent,
        super(
          fetchPage: ((params) async {
            final result = await searchBuddyEvent.call(params);

            return result.fold(
              (error) {
                print("SearchBuddyEventCubit error: ${error.message}");
                throw Exception(error.message);
              },
              (data) {
                print(
                  "SearchBuddyEventCubit fetched ${data.data.length} results",
                );
                return data.data; // assuming results is a List
              },
            );
          }),
          baseParams: SearchBuddyEventParams(
            searchWord: '',
            pageNo: 1,
            pageSize: 15,
          ),
        );

  Future<void> search(String query) async {
    await applyParams(
      baseParams.copyWith(
        searchWord: query,
        pageNo: 1,
      ),
    );
  }

  Future<void> refreshSearch() async => reset();
}
