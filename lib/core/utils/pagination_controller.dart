import 'package:flutter_bloc/flutter_bloc.dart';

/// A generic pagination state class.
class PaginationState<T> {
  final List<T> items;
  final int currentPage;
  final bool isLoading;
  final bool hasMore;
  final String? error;

  PaginationState({
    required this.items,
    required this.currentPage,
    required this.isLoading,
    required this.hasMore,
    this.error,
  });

  factory PaginationState.initial() {
    return PaginationState(
      items: [],
      currentPage: 1,
      isLoading: false,
      hasMore: true,
      error: null,
    );
  }

  PaginationState<T> copyWith({
    List<T>? items,
    int? currentPage,
    bool? isLoading,
    bool? hasMore,
    String? error,
  }) {
    return PaginationState<T>(
      items: items ?? this.items,
      currentPage: currentPage ?? this.currentPage,
      isLoading: isLoading ?? this.isLoading,
      hasMore: hasMore ?? this.hasMore,
      error: error,
    );
  }
}

/// Generic Cubit to handle pagination with debug logs.
class PaginationCubit<T, P> extends Cubit<PaginationState<T>> {
  final Future<List<T>> Function(P params) fetchPage;
  P baseParams;
  final int pageSize;
  int _lastRequestId = 0;

  PaginationCubit({
    required this.fetchPage,
    required this.baseParams,
    this.pageSize = 15,
  }) : super(PaginationState<T>.initial());

  /// Loads the first page (resets everything)
  Future<void> reset() async {
    print("[PaginationCubit] Resetting pagination...");
    emit(PaginationState<T>.initial());
    await loadNextPage();
  }

  /// Loads the next page
  Future<void> loadNextPage() async {
    if (state.isLoading || !state.hasMore) {
      print(
          "[PaginationCubit] Skipping loadNextPage: isLoading=${state.isLoading}, hasMore=${state.hasMore}");
      return;
    }

    print("[PaginationCubit] Loading page ${state.currentPage}...");
    emit(state.copyWith(isLoading: true, error: null));

    final requestId = DateTime.now().millisecondsSinceEpoch;
    _lastRequestId = requestId;
    print("[PaginationCubit] Assigned requestId: $requestId");

    try {
      final pageParams = (baseParams as dynamic).copyWith(
        pageNo: state.currentPage,
        pageSize: pageSize,
      ) as P;

      print("[PaginationCubit] Fetching with params: $pageParams");
      final newItems = await fetchPage(pageParams);
      print("[PaginationCubit] Fetched ${newItems.length} items");

      if (requestId != _lastRequestId) {
        print(
            "[PaginationCubit] Ignoring outdated response for requestId: $requestId");
        return;
      }

      final updatedItems = List<T>.from(state.items)..addAll(newItems);
      print(
          "[PaginationCubit] Total items after merge: ${updatedItems.length}");

      emit(state.copyWith(
        items: updatedItems,
        currentPage: state.currentPage + 1,
        isLoading: false,
        hasMore: newItems.length >= pageSize,
        error: null,
      ));

      print(
          "[PaginationCubit] Page ${state.currentPage - 1} loaded successfully, hasMore=${state.hasMore}");
    } catch (e) {
      if (requestId != _lastRequestId) return;
      print("[PaginationCubit] Error loading page: $e");
      emit(state.copyWith(isLoading: false, error: e.toString()));
    }
  }

  /// Replace baseParams (for filters) and refresh
  Future<void> applyParams(P newParams) async {
    print("[PaginationCubit] Applying new params: $newParams");
    baseParams = newParams;
    await reset();
  }
}
