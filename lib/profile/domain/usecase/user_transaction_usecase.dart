import 'package:zheeta/profile/data/model/user_transaction_model.dart';

abstract class UserTransactionUseCase {
  Future<UserTransactionListModel> getUserTransactionsUseCase({
    required String userId,
    required int pageNumber,
    required int pageSize,
  });
}
