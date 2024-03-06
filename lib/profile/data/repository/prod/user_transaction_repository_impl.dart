import 'package:injectable/injectable.dart';
import 'package:zheeta/profile/data/datasource/user_transaction_datasource.dart';
import 'package:zheeta/profile/data/model/user_transaction_model.dart';
import 'package:zheeta/profile/domain/repository/user_transaction_repository.dart';

@prod
@LazySingleton(as: UserTransactionRepository)
class UserTransactionRepositoryImpl implements UserTransactionRepository {
  final UserTransactionDataSource _datasource;
  UserTransactionRepositoryImpl(this._datasource);

  @override
  Future<UserTransactionListModel> getUserTransactionsRepo({required String userId, required int pageNumber, required int pageSize}) async {
    final result = await _datasource.getUserTransactions(
      userId: userId,
      pageNumber: pageNumber,
      pageSize: pageSize,
    );
    return result.fold(
      (error) => throw new Exception(error.message),
      (value) => UserTransactionListModel.fromJson(value),
    );
  }
}
