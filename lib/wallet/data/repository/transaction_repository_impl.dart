import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:zheeta/app/common/type_def.dart';
import 'package:zheeta/wallet/data/datasource/transaction_datasource.dart';
import 'package:zheeta/wallet/domain/repository/transaction_repository.dart';

import '../../../app/api/errors/error.dart';
import '../../../app/api/errors/exception.dart';
import '../model/transaction_model.dart';

@prod
@LazySingleton(as: TransactionRepository)
class TransactionRepositoryImpl implements TransactionRepository {
  final TransactionDataSource _datasource;

  TransactionRepositoryImpl(this._datasource);

  @override
  ResultFuture<List<TransactionModel>> getAllTransactions(
      {required int pageNumber, required int pageSize, required userId}) async {
    try {
      final result = await _datasource.getAllTransactions(
          pageNumber: pageNumber, pageSize: pageSize, userId: userId);
      return right(result);
    } on ApiException catch (ex) {
      return left(ApiError(message: ex.message, statusCode: ex.statusCode));
    } on DioException catch (ex) {
      return left(
          ApiError(message: ex.message!, statusCode: ex.response!.statusCode!));
    }
  }
}
