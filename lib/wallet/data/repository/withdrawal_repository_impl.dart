import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:zheeta/app/api/errors/error.dart';
import 'package:zheeta/app/api/errors/exception.dart';
import 'package:zheeta/app/common/type_def.dart';
import 'package:zheeta/wallet/data/datasource/withdrawal_datasource.dart';
import 'package:zheeta/wallet/domain/repository/withdrawal_repository.dart';

import '../model/banks_model.dart';
import '../model/pay_out_model.dart';

@prod
@LazySingleton(as: WithdrawalRepository)
class WithdrawalRepositoryImpl implements WithdrawalRepository {
  final WithdrawalDataSource _datasource;

  WithdrawalRepositoryImpl(this._datasource);

  @override
  ResultFuture<List<BankModel>> getAllBanks({String? countryIso2Code}) async {
    try {
      final result =
          await _datasource.getAllBanks(countryIso2Code: countryIso2Code);
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
  ResultFuture<List<BankModel>> getBankBranches({
    required String id,
  }) async {
    try {
      final result = await _datasource.getBankBranches(id: id);
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
  ResultFuture<PayoutDataModel> processPayOut({
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
