import 'package:injectable/injectable.dart';
import 'package:zheeta/app/common/param/pagination_param.dart';
import 'package:zheeta/app/common/type_def.dart';
import 'package:zheeta/app/common/usecase/usecases.dart';
import 'package:zheeta/wallet/data/model/transaction_model.dart';
import 'package:zheeta/wallet/domain/repository/transaction_repository.dart';

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
