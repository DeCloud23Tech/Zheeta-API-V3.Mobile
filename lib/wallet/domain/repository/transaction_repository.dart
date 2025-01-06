import 'package:zheeta/app/common/type_def.dart';
import '../../data/model/transaction_model.dart';

abstract class TransactionRepository {
  ResultFuture<List<TransactionModel>> getAllTransactions({
    required int pageNumber,
    required int pageSize,
    required userId,
  });
}
