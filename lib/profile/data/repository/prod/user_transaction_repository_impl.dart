import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:zheeta/app/api/errors/error.dart';
import 'package:zheeta/app/api/errors/exception.dart';
import 'package:zheeta/app/common/type_def.dart';
import 'package:zheeta/profile/data/datasource/user_transaction_datasource.dart';
import 'package:zheeta/profile/data/model/user_transaction_model.dart';
import 'package:zheeta/profile/domain/repository/user_transaction_repository.dart';

@prod
@LazySingleton(as: UserTransactionRepository)
class UserTransactionRepositoryImpl implements UserTransactionRepository {
  final UserTransactionDataSource _datasource;
  UserTransactionRepositoryImpl(this._datasource);

  @override
  ResultFuture<UserTransactionListModel> getUserTransactionsRepo(
      {required String userId,
      required int pageNumber,
      required int pageSize}) async {
    try {
      final result = await _datasource.getUserTransactionsNew(
        userId: userId,
        pageNumber: pageNumber,
        pageSize: pageSize,
      );
      return right(result);
    } on ApiException catch (ex) {
      return left(ApiError(message: ex.message, statusCode: ex.statusCode));
    } on DioException catch (ex) {
      return left(
          ApiError(message: ex.message!, statusCode: ex.response!.statusCode!));
    }
  }
}
