import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:zheeta/core/network/api.dart';
import 'package:zheeta/features/payment_and_subscriptions/data/datasources/i_payment_datasource.dart';
import 'package:zheeta/features/payment_and_subscriptions/data/models/generate_payment_link_model.dart';
import 'package:zheeta/features/payment_and_subscriptions/data/models/payment_types_model.dart';

@prod
@Singleton(as: IPaymentDataSource)
class PaymentDataSourceImpl implements IPaymentDataSource {
  final Api _api;

  PaymentDataSourceImpl(this._api) {}

  @override
  @override
  Future<GeneratePaymentLinkData> generatePaymentLink({
    required String userId,
    required int payInType,
    required double amount,
    required String currency,
  }) async {
    final response = await _api.dio.post(
      '/payment/generate-payment-link',
      data: {
        'userId': userId,
        'payInType': payInType,
        'amount': amount,
        'currency': currency,
      },
      options: Options(contentType: Headers.jsonContentType),
    );

    if (response.statusCode == 200 && response.data?['statusCode'] == 201) {
      return GeneratePaymentLinkData.fromJson(response.data['data']);
    } else {
      throw DioException.badResponse(
        statusCode: response.data?['statusCode'] ?? 400,
        requestOptions: response.requestOptions,
        response: response,
      );
    }
  }

  @override
  Future<List<PaymentType>> getPaymentTypes() async {
    var response = await _api.dio.get(
      '/payment/payment-types',
      options: Options(
        contentType: Headers.jsonContentType,
      ),
    );
    if (response.statusCode == 200) {
      List<dynamic> data = response.data['data'] ?? [];
      return data.map((json) => PaymentType.fromJson(json)).toList();
    } else {
      throw DioException.badResponse(
          statusCode: response.data?['statusCode'] ?? 400,
          requestOptions: response.requestOptions,
          response: response);
    }
  }
}
