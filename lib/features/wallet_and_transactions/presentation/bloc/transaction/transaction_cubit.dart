
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:zheeta/common/param/pagination_param.dart';
import 'package:zheeta/features/wallet_and_transactions/data/model/transaction_model.dart';
import 'package:zheeta/features/wallet_and_transactions/domain/usecase/transaction_usecase/get_transactions_usecase.dart';

part 'transaction_state.dart';

@prod
@LazySingleton()
class TransactionCubit extends Cubit<TransactionState> {
  final GetAllTransactions getAllTransactions;

  TransactionCubit({required this.getAllTransactions})
      : super(TransactionInitial());


  Future<void> fetchTransactionsCubit(PaginationParam params) async {
    emit(TransactionLoading());

    final result = await getAllTransactions(params);
    result.fold(
          (failure) => emit(TransactionError(failure.message)),
          (transactions) =>
          emit(TransactionLoaded(transactions)),
    );
  }
}