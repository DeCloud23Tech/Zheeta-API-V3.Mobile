import 'package:dartz/dartz.dart';
import 'package:zheeta/authentication/domain/entity/types.dart';

abstract class UserTransactionDataSource {
  Future<Either<ErrorResponse, MappedResponse>> getUserTransactions({
    required String userId,
    required int pageNumber,
    required int pageSize,
  });
}
