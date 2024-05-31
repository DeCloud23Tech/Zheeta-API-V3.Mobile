import 'package:dartz/dartz.dart';
import 'package:zheeta/authentication/domain/entity/types.dart';
import 'package:zheeta/profile/data/model/user_transaction_model.dart';

abstract class UserTransactionDataSource {
  Future<Either<ErrorResponse, MappedResponse>> getUserTransactions({
    required String userId,
    required int pageNumber,
    required int pageSize,
  });

  Future<UserTransactionListModel> getUserTransactionsNew({
    required String userId,
    required int pageNumber,
    required int pageSize,
  });
}
