import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:zheeta/common/constants/type_def.dart';
import 'package:zheeta/common/errors/error.dart';
import 'package:zheeta/common/errors/exception.dart';
import 'package:zheeta/features/wallet_and_transactions/data/datasource/wallet_datasource.dart';
import 'package:zheeta/features/wallet_and_transactions/data/model/wallet_counters_model.dart';
import 'package:zheeta/features/wallet_and_transactions/domain/repository/wallet_repository.dart';

@prod
@LazySingleton(as: WalletRepository)
class WalletRepositoryImpl implements WalletRepository {
  final WalletDataSource _datasource;

  WalletRepositoryImpl(this._datasource);

  @override
  ResultFuture<WalletCounters> getZheetaWallet() async {
    try {
      final result = await _datasource.getZheetaWallet();
      return right(result);
    } on ApiException catch (ex) {
      return left(ApiError(message: ex.message, statusCode: ex.statusCode));
    } on DioException catch (ex) {
      return left(ApiError(
          message: ex.response?.data['message'],
          statusCode: ex.response!.statusCode!));
    }
  }

  @override
  ResultVoid transferToUserWallet({
    required String receiverUsername,
    required String message,
    required double amount,
  }) async {
    try {
      final result = await _datasource.transferToUserWallet(
          amount: amount, receiverUsername: receiverUsername, message: message);
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
