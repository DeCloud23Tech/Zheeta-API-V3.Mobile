import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:zheeta/core/network/api.dart';
import 'package:zheeta/features/payment_and_subscriptions/data/datasources/i_payment_datasource.dart';
import 'package:zheeta/features/payment_and_subscriptions/data/datasources/i_subscription_datasource.dart';
import 'package:zheeta/features/payment_and_subscriptions/data/models/charges_model.dart';
import 'package:zheeta/features/payment_and_subscriptions/data/models/generate_payment_link_model.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:zheeta/core/network/api.dart';
import 'package:zheeta/features/payment_and_subscriptions/data/datasources/i_payment_datasource.dart';
import 'package:zheeta/features/payment_and_subscriptions/data/models/generate_payment_link_model.dart';
import 'package:zheeta/features/payment_and_subscriptions/data/models/subscription_model.dart';

@prod
@Singleton(as: ISubscriptionDataSource)
class SubscriptionDatasourceImpl implements ISubscriptionDataSource {
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
