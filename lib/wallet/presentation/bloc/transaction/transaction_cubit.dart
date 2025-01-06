import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:zheeta/wallet/domain/usecase/transaction_usecase/get_transactions_usecase.dart';

import '../../../../app/common/param/pagination_param.dart';
import '../../../data/model/transaction_model.dart';

part 'transaction_state.dart';

@prod
@LazySingleton()
class TransactionCubit extends Cubit<TransactionState> {
  final GetAllTransactions getAllTransactions;

  TransactionCubit({required this.getAllTransactions})
      : super(TransactionInitial());


  Future<void> fetchTransactions(PaginationParam params) async {
    emit(TransactionLoading());

    final result = await getAllTransactions(params);
    print(result);
    print('result');
    result.fold(
          (failure) => emit(TransactionError(failure.message)),
          (transactions) =>
          emit(TransactionLoaded(transactions)),
    );
  }
}