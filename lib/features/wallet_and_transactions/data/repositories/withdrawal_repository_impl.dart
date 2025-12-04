import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:zheeta/core/constants/type_def.dart';
import 'package:zheeta/core/error/error.dart';
import 'package:zheeta/core/error/exception.dart';
import 'package:zheeta/features/wallet_and_transactions/data/datasources/i_withdrawal_datasource.dart';
import 'package:zheeta/features/wallet_and_transactions/data/models/pay_out_model.dart';
import 'package:zheeta/features/wallet_and_transactions/domain/repositories/withdrawal_repository.dart';

@prod
@LazySingleton(as: IWithdrawalRepository)
class WithdrawalRepositoryImpl implements IWithdrawalRepository {
  final IWithdrawalDataSource _datasource;

  WithdrawalRepositoryImpl(this._datasource);

  @override
  ResultFuture<PayoutData> processPayOut({
    required double coinAmount,
    required String payOutAccountId,
  }) async {
    try {
      final result = await _datasource.processPayOut(
        coinAmount: coinAmount,
        payOutAccountId: payOutAccountId,
      );
      return right(result);
    } on ApiException catch (ex) {
      return left(ApiError(message: ex.message, statusCode: ex.statusCode));
    } on DioException catch (ex) {
      return left(
        ApiError(
            message: ex.message!, statusCode: ex.response?.statusCode ?? 500),
      );
    }
  }

  @override
  ResultFuture<double> getRateByCountry({
    required String countryName,
  }) async {
    try {
      final result =
          await _datasource.getRateByCountry(countryName: countryName);
      return right(result);
    } on ApiException catch (ex) {
      return left(ApiError(message: ex.message, statusCode: ex.statusCode));
    } on DioException catch (ex) {
      return left(
        ApiError(
            message: ex.message!, statusCode: ex.response?.statusCode ?? 500),
      );
    }
  }
}
