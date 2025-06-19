
import 'package:injectable/injectable.dart';
import 'package:zheeta/common/constants/type_def.dart';
import 'package:zheeta/common/param/pagination_param.dart';
import 'package:zheeta/common/usecase/usecases.dart';
import 'package:zheeta/features/wallet_and_transactions/data/model/transaction_model.dart';
import 'package:zheeta/features/wallet_and_transactions/domain/repository/transaction_repository.dart';

@prod
@LazySingleton()
class GetAllTransactions
    extends UsecaseWithParams<List<TransactionModel>, PaginationParam> {
  const GetAllTransactions(this._repo);

  final TransactionRepository _repo;

  @override
  ResultFuture<List<TransactionModel>> call(PaginationParam params) async =>
      await _repo.getAllTransactions(
          pageNumber: params.pageNo,
          pageSize: params.pageSize,
          userId: params.userId);
}
