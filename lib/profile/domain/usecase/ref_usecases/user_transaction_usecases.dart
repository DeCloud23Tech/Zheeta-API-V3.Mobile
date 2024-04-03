import 'package:zheeta/app/common/type_def.dart';
import 'package:zheeta/app/common/usecase/usecases.dart';
import 'package:zheeta/profile/data/model/user_transaction_model.dart';
import 'package:zheeta/profile/domain/repository/user_transaction_repository.dart';
import 'package:zheeta/profile/domain/usecase/ref_usecases/user_search_usecases.dart';

class GetUserTransactions extends UsecaseWithParams<UserTransactionListModel,
    UserSearchByEmailParam> {
  const GetUserTransactions(this._repo);

  final UserTransactionRepository _repo;

  @override
  ResultFuture<UserTransactionListModel> call(
          UserSearchByEmailParam param) async =>
      await _repo.getUserTransactionsRepo(
          pageNumber: param.pageNo,
          pageSize: param.pageSize,
          userId: param.email);
}
