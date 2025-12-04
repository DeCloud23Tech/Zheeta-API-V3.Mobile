import 'package:zheeta/features/wallet_and_transactions/data/models/transaction_model.dart';

abstract class ITransactionDataSource {
  Future<List<TransactionModel>> getAllTransactions({
    required int pageNumber,
    required int pageSize,
    required userId,
  });
}
