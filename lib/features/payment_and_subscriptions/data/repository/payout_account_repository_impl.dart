import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:zheeta/common/constants/type_def.dart';
import 'package:zheeta/features/payment_and_subscriptions/data/datasource/payout_account_datasource.dart';
import 'package:zheeta/features/payment_and_subscriptions/data/model/payment_account_model.dart';
import 'package:zheeta/features/payment_and_subscriptions/data/model/payment_countries_model.dart';
import 'package:zheeta/features/payment_and_subscriptions/domain/repository/payout_account_repository.dart';

import '../../../../common/errors/error.dart';
import '../../../../common/errors/exception.dart';

@prod
@LazySingleton(as: PayoutAccountRepository)
class PayoutAccountRepositoryImpl implements PayoutAccountRepository {
  final PayoutAccountDataSource _datasource;

  PayoutAccountRepositoryImpl(this._datasource);

  @override
  ResultFuture<bool> addBankAccount({
    required String userId,
    required String firstName,
    required String lastName,
    required String countryIso2Code,
    required String currency,
    required String bankId,
    required String bankName,
    required String bankCode,
    required String branchCode,
    required String accountNumber,
    required String routingNumber,
    required String swiftCode,
  }) async {
    try {
      final result = await _datasource.addBankAccount(
        userId: userId,
        firstName: firstName,
        lastName: lastName,
        countryIso2Code: countryIso2Code,
        currency: currency,
        bankId: bankId,
        bankName: bankName,
        bankCode: bankCode,
        branchCode: branchCode,
        accountNumber: accountNumber,
        routingNumber: routingNumber,
        swiftCode: swiftCode,
      );
      return right(result);
    } on ApiException catch (ex) {
      return left(ApiError(message: ex.message, statusCode: ex.statusCode));
    } on DioException catch (ex) {
      return left(ApiError(
        message: ex.response?.data['message'],
        statusCode: ex.response!.statusCode!,
      ));
    }
  }

  @override
  ResultFuture<bool> addCryptoAccount({
    required String userId,
    required String firstName,
    required String lastName,
    required String countryIso2Code,
    required String currency,
    required String cryptoCoinName,
    required String cryptoCoinAddress,
  }) async {
    try {
      final result = await _datasource.addCryptoAccount(
        userId: userId,
        firstName: firstName,
        lastName: lastName,
        countryIso2Code: countryIso2Code,
        currency: currency,
        cryptoCoinName: cryptoCoinName,
        cryptoCoinAddress: cryptoCoinAddress,
      );
      return right(result);
    } on ApiException catch (ex) {
      return left(ApiError(message: ex.message, statusCode: ex.statusCode));
    } on DioException catch (ex) {
      return left(ApiError(
        message: ex.response?.data['message'],
        statusCode: ex.response!.statusCode!,
      ));
    }
  }

  @override
  ResultFuture<bool> addMobileMoneyAccount({
    required String userId,
    required String firstName,
    required String lastName,
    required String countryIso2Code,
    required String currency,
    required String mobileMoneyProvider,
    required String mobileMoneyAccount,
  }) async {
    try {
      final result = await _datasource.addMobileMoneyAccount(
        userId: userId,
        firstName: firstName,
        lastName: lastName,
        countryIso2Code: countryIso2Code,
        currency: currency,
        mobileMoneyProvider: mobileMoneyProvider,
        mobileMoneyAccount: mobileMoneyAccount,
      );
      return right(result);
    } on ApiException catch (ex) {
      return left(ApiError(message: ex.message, statusCode: ex.statusCode));
    } on DioException catch (ex) {
      return left(ApiError(
        message: ex.response?.data['message'],
        statusCode: ex.response!.statusCode!,
      ));
    }
  }

  @override
  ResultFuture<bool> addPaypalAccount({
    required String userId,
    required String firstName,
    required String lastName,
    required String countryIso2Code,
    required String currency,
    required String paypalAddress,
  }) async {
    try {
      final result = await _datasource.addPaypalAccount(
        userId: userId,
        firstName: firstName,
        lastName: lastName,
        countryIso2Code: countryIso2Code,
        currency: currency,
        paypalAddress: paypalAddress,
      );
      return right(result);
    } on ApiException catch (ex) {
      return left(ApiError(message: ex.message, statusCode: ex.statusCode));
    } on DioException catch (ex) {
      return left(ApiError(
        message: ex.response?.data['message'],
        statusCode: ex.response!.statusCode!,
      ));
    }
  }

  @override
  ResultFuture<bool> deleteAccountById(String accountId) async {
    try {
      final result = await _datasource.deleteAccountById(accountId);
      return right(result);
    } on ApiException catch (ex) {
      return left(ApiError(message: ex.message, statusCode: ex.statusCode));
    } on DioException catch (ex) {
      return left(ApiError(
        message: ex.response?.data['message'],
        statusCode: ex.response!.statusCode!,
      ));
    }
  }

  @override
  ResultFuture<PaymentAccount> getAccountById(String accountId) async {
    try {
      final result = await _datasource.getAccountById(accountId);
      return right(result);
    } on ApiException catch (ex) {
      return left(ApiError(message: ex.message, statusCode: ex.statusCode));
    } on DioException catch (ex) {
      return left(ApiError(
        message: ex.response?.data['message'],
        statusCode: ex.response!.statusCode!,
      ));
    }
  }

  @override
  ResultFuture<List<PaymentAccount>> getAllAccounts() async {
    try {
      final result = await _datasource.getAllAccounts();
      return right(result);
    } on ApiException catch (ex) {
      return left(ApiError(message: ex.message, statusCode: ex.statusCode));
    } on DioException catch (ex) {
      return left(ApiError(
        message: ex.response?.data['message'],
        statusCode: ex.response!.statusCode!,
      ));
    }
  }

  @override
  ResultFuture<List<CountryData>> getPayoutCountries() async {
    try {
      final result = await _datasource.getPayoutCountries();
      return right(result);
    } on ApiException catch (ex) {
      return left(ApiError(message: ex.message, statusCode: ex.statusCode));
    } on DioException catch (ex) {
      return left(ApiError(
        message: ex.response?.data['message'],
        statusCode: ex.response!.statusCode!,
      ));
    }
  }
}
