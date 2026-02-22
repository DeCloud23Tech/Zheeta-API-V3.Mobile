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
  Future<List<PaymentType>> getPaymentTypes(String currency) async {
    var response = await _api.dio.get(
      '/payment/payin-types?currency=$currency',
      options: Options(
        contentType: Headers.jsonContentType,
      ),
    );
    if (response.statusCode == 200) {
      List<dynamic> data = response.data['data'] ?? [];
      return data.map((raw) {
        if (raw is String) {
          return PaymentType(
            id: _mapPayInTypeId(raw),
            name: raw,
          );
        }
        final json = raw as Map<String, dynamic>;
        final name = (json['name'] ??
                json['typeName'] ??
                json['paymentType'] ??
                json['type'] ??
                '')
            .toString();
        final dynamic idValue =
            json['id'] ?? json['type'] ?? json['payInType'];
        final id = idValue is int
            ? idValue
            : int.tryParse(idValue?.toString() ?? '') ??
                _mapPayInTypeId(name);
        return PaymentType(id: id, name: name);
      }).where((type) => type.id != 0 && type.name.isNotEmpty).toList();
    } else {
      throw DioException.badResponse(
          statusCode: response.data?['statusCode'] ?? 400,
          requestOptions: response.requestOptions,
          response: response);
    }
  }

  int _mapPayInTypeId(String name) {
    switch (name.trim().toLowerCase()) {
      case 'cardorbanktransfer':
        return 1;
      case 'crypto':
        return 2;
      case 'bank-transfer':
      case 'bank transfer':
      case 'bank-account':
      case 'bank account':
        return 1;
      case 'mobile-money':
      case 'mobile money':
        return 2;
      default:
        return 0;
    }
  }
}
