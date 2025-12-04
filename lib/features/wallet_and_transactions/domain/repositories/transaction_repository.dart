import 'package:zheeta/core/constants/type_def.dart';
import 'package:zheeta/features/wallet_and_transactions/data/models/transaction_model.dart';

abstract class ITransactionRepository {
  ResultFuture<List<TransactionModel>> getAllTransactions({
    required int pageNumber,
    required int pageSize,
    required userId,
  });
}
