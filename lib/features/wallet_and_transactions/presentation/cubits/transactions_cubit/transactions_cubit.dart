import 'package:injectable/injectable.dart';
import 'package:zheeta/core/common/param/pagination_param.dart';
import 'package:zheeta/core/utils/pagination_controller.dart';
import 'package:zheeta/core/utils/token_utils.dart';
import 'package:zheeta/features/wallet_and_transactions/data/models/transaction_model.dart';
import 'package:zheeta/features/wallet_and_transactions/domain/usecases/transaction_usecase/get_transactions_usecase.dart';

@prod
@injectable
class TransactionsCubit
    extends PaginationCubit<TransactionModel, PaginationParam> {
  final GetAllTransactions _getAllTransactions;
  static const int fixedPageSize = 15; // fixed page size

  TransactionsCubit({required GetAllTransactions getAllTransactions})
      : _getAllTransactions = getAllTransactions,
        super(
          fetchPage: ((params) async {
            // Enforce fixed page size
            final fetchParams = params.copyWith(pageSize: fixedPageSize);

            print(
                "[TransactionsCubit] fetchPage called with pageNo=${fetchParams.pageNo}, pageSize=${fetchParams.pageSize}");
            final result = await getAllTransactions.call(fetchParams);

            return result.fold(
              (error) {
                print(
                    "[TransactionsCubit] Error fetching transactions: ${error.message}");
                throw Exception(error.message);
              },
              (data) {
                print(
                    "[TransactionsCubit] Successfully fetched ${data.length} transactions");
                return data;
              },
            );
          }),
          baseParams: PaginationParam(pageNo: 1, pageSize: fixedPageSize),
        );

  /// Initialize cubit with userId and reset to page 1
  Future<void> initWithUserId() async {
    final fetchedUserId = await TokenUtil.getUserId();
    if (fetchedUserId == null) {
      print("[TransactionsCubit] initWithUserId: No userId found");
      return;
    }

    print("[TransactionsCubit] initWithUserId: userId=$fetchedUserId");

    // Always enforce pageSize=15 here
    final newParams = baseParams.copyWith(
      userId: fetchedUserId,
      pageNo: 1,
      pageSize: fixedPageSize,
    );
    await applyParams(newParams);

    emit(state.copyWith(currentPage: 1));
  }

  /// Jump to a specific page
  Future<void> jumpToPageDirect(int pageNo) async {
    print("[TransactionsCubit] jumpToPageDirect called with pageNo=$pageNo");
    if (pageNo < 1) return;

    emit(state.copyWith(isLoading: true, error: null));

    try {
      // Always enforce pageSize=15 here
      final newParams = baseParams.copyWith(
        pageNo: pageNo,
        pageSize: fixedPageSize,
      );
      final newItems = await fetchPage(newParams);

      emit(state.copyWith(
        items: newItems,
        currentPage: pageNo,
        isLoading: false,
        hasMore: newItems.length >= fixedPageSize,
        error: null,
      ));

      print(
          "[TransactionsCubit] jumpToPageDirect finished loading page $pageNo");
    } catch (e) {
      emit(state.copyWith(isLoading: false, error: e.toString()));
      print("[TransactionsCubit] Error in jumpToPageDirect: $e");
    }
  }

  /// Refresh all transactions
  Future<void> refreshTransactions() async {
    print("[TransactionsCubit] refreshTransactions called");
    await reset();
    emit(state.copyWith(currentPage: 1));
  }
}
