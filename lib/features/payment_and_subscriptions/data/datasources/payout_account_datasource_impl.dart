import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:zheeta/core/network/api.dart';
import 'package:zheeta/core/utils/token_utils.dart';
import 'package:zheeta/features/payment_and_subscriptions/data/datasources/i_payout_account_datasource.dart';
import 'package:zheeta/features/payment_and_subscriptions/data/models/payment_account_model.dart';
import 'package:zheeta/features/payment_and_subscriptions/data/models/payment_countries_model.dart';

@prod
@Singleton(as: IPayoutAccountDataSource)
class PayoutAccountRepositoryImpl implements IPayoutAccountDataSource {
  final Api _api;

  PayoutAccountRepositoryImpl(this._api);

  @override
  Future<bool> addBankAccount({
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
    final response = await _api.dio.post(
      '/payment/account/bank',
      data: {
        'userId': userId,
        'firstName': firstName,
        'lastName': lastName,
        'countryIso2Code': countryIso2Code,
        'currency': currency,
        'bankId': bankId,
        'bankName': bankName,
        'bankCode': bankCode,
        'branchCode': branchCode,
        'accountNumber': accountNumber,
        'routingNumber': routingNumber,
        'swiftCode': swiftCode,
      },
      options: Options(contentType: Headers.jsonContentType),
    );

    return response.statusCode == 200 && response.data['status'] == true;
  }

  @override
  Future<bool> addCryptoAccount({
    required String userId,
    required String firstName,
    required String lastName,
    required String countryIso2Code,
    required String currency,
    required String cryptoCoinName,
    required String cryptoCoinAddress,
  }) async {
    final response = await _api.dio.post(
      '/payment/account/crypto',
      data: {
        'userId': userId,
        'firstName': firstName,
        'lastName': lastName,
        'countryIso2Code': countryIso2Code,
        'currency': currency,
        'cryptoCoinName': cryptoCoinName,
        'cryptoCoinAddress': cryptoCoinAddress,
      },
      options: Options(contentType: Headers.jsonContentType),
    );

    return response.statusCode == 200 && response.data['status'] == true;
  }

  @override
  Future<bool> addMobileMoneyAccount({
    required String userId,
    required String firstName,
    required String lastName,
    required String countryIso2Code,
    required String currency,
    required String mobileMoneyProvider,
    required String mobileMoneyAccount,
  }) async {
    final response = await _api.dio.post(
      '/payment/account/mobile-money',
      data: {
        'userId': userId,
        'firstName': firstName,
        'lastName': lastName,
        'countryIso2Code': countryIso2Code,
        'currency': currency,
        'mobileMoneyProvider': mobileMoneyProvider,
        'mobileMoneyAccount': mobileMoneyAccount,
      },
      options: Options(contentType: Headers.jsonContentType),
    );

    return response.statusCode == 200 && response.data['status'] == true;
  }

  @override
  Future<bool> addPaypalAccount({
    required String userId,
    required String firstName,
    required String lastName,
    required String countryIso2Code,
    required String currency,
    required String paypalAddress,
  }) async {
    final response = await _api.dio.post(
      '/payment/account/paypal',
      data: {
        'userId': userId,
        'firstName': firstName,
        'lastName': lastName,
        'countryIso2Code': countryIso2Code,
        'currency': currency,
        'paypalAddress': paypalAddress,
      },
      options: Options(contentType: Headers.jsonContentType),
    );

    return response.statusCode == 200 && response.data['status'] == true;
  }

  @override
  Future<bool> deleteAccountById(String accountId) async {
    final response = await _api.dio.delete(
      '/payment/account/$accountId',
      options: Options(contentType: Headers.jsonContentType),
    );

    if (response.statusCode == 200) {
      return response.data['success'];
    } else {
      throw DioException.badResponse(
        statusCode: response.statusCode ?? 400,
        requestOptions: response.requestOptions,
        response: response,
      );
    }
  }

  @override
  Future<PaymentAccount> getAccountById(String accountId) async {
    final response = await _api.dio.get(
      '/payment/account/$accountId',
      options: Options(contentType: Headers.jsonContentType),
    );

    if (response.statusCode == 200) {
      return PaymentAccount.fromJson(response.data['data']);
    } else {
      throw DioException.badResponse(
        statusCode: response.statusCode ?? 400,
        requestOptions: response.requestOptions,
        response: response,
      );
    }
  }

  @override
  Future<List<PaymentAccount>> getAllAccounts() async {
    final String? userId = await TokenUtil.getUserId();
    final response = await _api.dio.get(
      '/payment/account?userId=$userId',
      options: Options(contentType: Headers.jsonContentType),
    );

    if (response.statusCode == 200) {
      List<dynamic> data = response.data['data'] ?? [];
      return data.map((json) => PaymentAccount.fromJson(json)).toList();
    } else {
      throw DioException.badResponse(
        statusCode: response.statusCode ?? 400,
        requestOptions: response.requestOptions,
        response: response,
      );
    }
  }

  @override
  Future<List<CountryData>> getPayoutCountries() async {
    final response = await _api.dio.get(
      '/payment/get-pay-out-countries',
      options: Options(contentType: Headers.jsonContentType),
    );

    if (response.statusCode == 200) {
      List<dynamic> data = response.data['data'] ?? [];
      return data.map((json) => CountryData.fromJson(json)).toList();
    } else {
      throw DioException.badResponse(
        statusCode: response.statusCode ?? 400,
        requestOptions: response.requestOptions,
        response: response,
      );
    }
  }
}
