import 'package:zheeta/profile/data/model/user_transaction_model.dart';

abstract class UserTransactionRepository {
  Future<UserTransactionListModel> getUserTransactionsRepo({
    required String userId,
    required int pageNumber,
    required int pageSize,
  });
}
