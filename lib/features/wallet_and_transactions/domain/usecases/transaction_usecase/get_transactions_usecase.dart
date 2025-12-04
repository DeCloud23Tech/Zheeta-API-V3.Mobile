import 'package:injectable/injectable.dart';
import 'package:zheeta/core/common/param/pagination_param.dart';
import 'package:zheeta/core/common/usecase/usecases.dart';
import 'package:zheeta/core/constants/type_def.dart';
import 'package:zheeta/features/wallet_and_transactions/data/models/transaction_model.dart';
import 'package:zheeta/features/wallet_and_transactions/domain/repositories/transaction_repository.dart';

@prod
@LazySingleton()
class GetAllTransactions
    extends UsecaseWithParams<List<TransactionModel>, PaginationParam> {
  const GetAllTransactions(this._repo);

  final ITransactionRepository _repo;

  @override
  ResultFuture<List<TransactionModel>> call(PaginationParam params) async =>
      await _repo.getAllTransactions(
          pageNumber: params.pageNo,
          pageSize: params.pageSize,
          userId: params.userId);
}
