import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:zheeta/common/services/api/api_manager.dart';
import 'package:zheeta/features/payment_and_subscriptions/data/datasource/payment_datasource.dart';
import 'package:zheeta/features/payment_and_subscriptions/data/model/generate_payment_link_model.dart';
import 'package:zheeta/features/payment_and_subscriptions/data/model/payment_types_model.dart';

@prod
@Singleton(as: PaymentDataSource)
class PaymentDataSourceImpl implements PaymentDataSource {
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
