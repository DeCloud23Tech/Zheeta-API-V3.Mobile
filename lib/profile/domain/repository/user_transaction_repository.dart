import 'package:zheeta/app/common/type_def.dart';
import 'package:zheeta/profile/data/model/user_transaction_model.dart';

abstract class UserTransactionRepository {
  ResultFuture<UserTransactionListModel> getUserTransactionsRepo({
    required String userId,
    required int pageNumber,
    required int pageSize,
  });
}
