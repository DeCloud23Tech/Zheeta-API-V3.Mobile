import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:zheeta/core/constants/type_def.dart';
import 'package:zheeta/core/error/error.dart';
import 'package:zheeta/core/error/exception.dart';
import 'package:zheeta/features/wallet_and_transactions/data/datasources/i_transaction_datasource.dart';
import 'package:zheeta/features/wallet_and_transactions/data/models/transaction_model.dart';
import 'package:zheeta/features/wallet_and_transactions/domain/repositories/transaction_repository.dart';

@prod
@LazySingleton(as: ITransactionRepository)
class TransactionRepositoryImpl implements ITransactionRepository {
  final ITransactionDataSource _datasource;

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
      return left(ApiError(
          message: ex.response?.data['message'],
          statusCode: ex.response!.statusCode!));
    }
  }
}
