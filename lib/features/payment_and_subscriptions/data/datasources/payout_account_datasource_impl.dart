import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:zheeta/core/network/api.dart';
import 'package:zheeta/core/utils/token_utils.dart';
import 'package:zheeta/features/payment_and_subscriptions/data/datasources/i_payout_account_datasource.dart';
import 'package:zheeta/features/payment_and_subscriptions/data/models/payment_account_model.dart';
import 'package:zheeta/features/payment_and_subscriptions/data/models/payment_banks_model.dart';
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
      final raw = Map<String, dynamic>.from(response.data['data'] ?? {});
      return PaymentAccount.fromJson(_normalizePaymentAccount(raw));
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
      return data
          .map(
            (json) => PaymentAccount.fromJson(
              _normalizePaymentAccount(Map<String, dynamic>.from(json)),
            ),
          )
          .toList();
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

  @override
  Future<List<String>> getPayoutMethodsByCurrency(String currency) async {
    final response = await _api.dio.get(
      '/payment/get-currency-pay-out-methods?currency=$currency',
      options: Options(contentType: Headers.jsonContentType),
    );

    if (response.statusCode == 200) {
      List<dynamic> data = response.data['data'] ?? [];
      return data.map((e) => e.toString()).toList();
    } else {
      throw DioException.badResponse(
        statusCode: response.statusCode ?? 400,
        requestOptions: response.requestOptions,
        response: response,
      );
    }
  }

  @override
  Future<List<BankProvider>> getAllBanksByCurrency(String currency) async {
    final response = await _api.dio.get(
      '/payment/get-all-banks?currency=$currency',
      options: Options(contentType: Headers.jsonContentType),
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = response.data['data'] ?? [];
      return data.map((raw) {
        if (raw is String) {
          return BankProvider(code: raw, name: raw);
        }
        final json = raw as Map<String, dynamic>;
        final code = (json['code'] ??
                json['bankCode'] ??
                json['providerCode'] ??
                json['id'] ??
                '')
            .toString();
        final name = (json['name'] ??
                json['bankName'] ??
                json['providerName'] ??
                code)
            .toString();
        return BankProvider(code: code, name: name);
      }).toList();
    } else {
      throw DioException.badResponse(
        statusCode: response.statusCode ?? 400,
        requestOptions: response.requestOptions,
        response: response,
      );
    }
  }

  @override
  Future<bool> createPayoutAccount({
    required String firstName,
    required String lastName,
    required String countryCode,
    required String currency,
    required String providerCode,
    required String providerName,
    required String providerAccountNumber,
    required int type,
  }) async {
    final String? userId = await TokenUtil.getUserId();
    final response = await _api.dio.post(
      '/payment/account',
      data: {
        'userId': userId,
        'firstName': firstName,
        'lastName': lastName,
        'countryCode': countryCode,
        'currency': currency,
        'providerCode': providerCode,
        'providerName': providerName,
        'providerAccountNumber': providerAccountNumber,
        'type': type,
      },
      options: Options(contentType: Headers.jsonContentType),
    );

    return response.statusCode == 200 && response.data['success'] == true;
  }

  Map<String, dynamic> _normalizePaymentAccount(Map<String, dynamic> json) {
    return {
      ...json,
      'countryIso2Code': json['countryIso2Code'] ?? json['countryCode'],
      'bankName': json['bankName'] ?? json['accountProviderName'],
      'bankCode': json['bankCode'] ?? json['accountProviderCode'],
      'mobileMoneyAccount':
          json['mobileMoneyAccount'] ?? json['accountNumber'],
    };
  }
}
