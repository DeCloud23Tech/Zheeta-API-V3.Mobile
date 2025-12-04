import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:zheeta/core/network/api.dart';
import 'package:zheeta/features/wallet_and_transactions/data/datasources/i_withdrawal_datasource.dart';
import 'package:zheeta/features/wallet_and_transactions/data/models/pay_out_model.dart';

@prod
@Singleton(as: IWithdrawalDataSource)
class WithdrawalDataSourceImpl implements IWithdrawalDataSource {
  final Api _api;

  WithdrawalDataSourceImpl(this._api);

  @override
  Future<double> getRateByCountry({required String countryName}) async {
    var response = await _api.dio.get(
      '/payment/get-rate-by-country',
      queryParameters: {'countryName': countryName},
      options: Options(
        contentType: Headers.jsonContentType,
      ),
    );
    if (response.statusCode == 200) {
      return (response.data['data'] as num).toDouble();
    } else {
      throw DioException.badResponse(
          statusCode: response.data?['statusCode'] ?? 400,
          requestOptions: response.requestOptions,
          response: response);
    }
  }

  @override
  Future<PayoutData> processPayOut(
      {required double coinAmount, required String payOutAccountId}) async {
    final response = await _api.dio.post(
      '/payment/process-pay-out',
      data: {
        'coinAmount': coinAmount,
        'payOutAccountId': payOutAccountId,
      },
      options: Options(
        contentType: Headers.jsonContentType,
      ),
    );

    if (response.statusCode == 200) {
      return PayoutData.fromJson(response.data['data']);
    } else {
      throw DioException.badResponse(
        statusCode: response.statusCode ?? 400,
        requestOptions: response.requestOptions,
        response: response,
      );
    }
  }
}
