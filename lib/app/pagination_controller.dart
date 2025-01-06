import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zheeta/app/common/param/pagination_param.dart';

class PaginatedListController<T, CubitType extends Cubit<StateType>, StateType> {
  final Future<void> Function(PaginationParam param) fetchItems;
  final CubitType cubit;
  final int pageSize;
  List<T> items = [];
  int currentPage = 1;
  bool isLoading = false;
  bool hasMoreItems = true;

  PaginatedListController({
    required this.fetchItems,
    required this.cubit,
    this.pageSize = 15,
  });

  Future<void> loadNextPage({
    required bool Function(StateType) successCondition,
    required List<T> Function(StateType) extractItems,
    required bool Function(StateType) isError,
  }) async {
    if (isLoading || !hasMoreItems) return;

    isLoading = true;
    await fetchItems(PaginationParam(pageNo: currentPage, pageSize: pageSize));
    final state = cubit.state;

    if (successCondition(state)) {
      final newItems = extractItems(state);
      if (newItems.isEmpty) {
        hasMoreItems = false;
      } else {
        items.addAll(newItems);
        currentPage++;
      }
    } else if (isError(state)) {
      // Handle error state here
      hasMoreItems = false;
    }

    isLoading = false;
  }

  void reset() {
    currentPage = 1;
    items.clear();
    hasMoreItems = true;
  }
}
