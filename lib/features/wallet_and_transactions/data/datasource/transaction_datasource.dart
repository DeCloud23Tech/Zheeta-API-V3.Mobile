import '../model/transaction_model.dart';

abstract class TransactionDataSource {
  Future<List<TransactionModel>> getAllTransactions({
    required int pageNumber,
    required int pageSize,
    required userId,
  });
}
