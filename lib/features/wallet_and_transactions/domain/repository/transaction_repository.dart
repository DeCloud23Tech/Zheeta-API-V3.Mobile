import 'package:zheeta/common/constants/type_def.dart';
import 'package:zheeta/features/wallet_and_transactions/data/model/transaction_model.dart';

abstract class TransactionRepository {
  ResultFuture<List<TransactionModel>> getAllTransactions({
    required int pageNumber,
    required int pageSize,
    required userId,
  });
}
