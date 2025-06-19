import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:zheeta/common/services/api/api_manager.dart';
import 'package:zheeta/features/payment_and_subscriptions/data/datasource/subscription_datasource.dart';
import 'package:zheeta/features/payment_and_subscriptions/data/model/charges_model.dart';
import 'package:zheeta/features/payment_and_subscriptions/data/model/subscription_model.dart';


@prod
@Singleton(as: SubscriptionDataSource)
class SubscriptionDatasourceImpl implements SubscriptionDataSource {
  final Api _api;

  SubscriptionDatasourceImpl(this._api) {}

  @override
  Future<SubscriptionListModel> getAllSubscriptions() async {
    var response = await _api.dio.get(
      '/subscriptions/all',
      options: Options(
        contentType: Headers.jsonContentType,
      ),
    );
    if (response.statusCode == 200) {
      return SubscriptionListModel.fromJson(response.data);
    } else {
      throw DioException.badResponse(
          statusCode: response.data?['statusCode'] ?? 400,
          requestOptions: response.requestOptions,
          response: response);
    }
  }

  @override
  Future<ChargesListModel> getAllCharges() async {
    var response = await _api.dio.get(
      '/charges',
      options: Options(
        contentType: Headers.jsonContentType,
      ),
    );
    if (response.statusCode == 200) {
      return ChargesListModel.fromJson(response.data);
    } else {
      throw DioException.badResponse(
          statusCode: response.data?['statusCode'] ?? 400,
          requestOptions: response.requestOptions,
          response: response);
    }
  }
}
