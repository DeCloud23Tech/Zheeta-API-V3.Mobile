import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:zheeta/app/api/api_manager_refactored.dart';
import 'package:zheeta/app/api/errors/exception.dart';
import 'package:zheeta/payment_and_subscriptions/data/datasource/subscription_datasource.dart';
import 'package:zheeta/payment_and_subscriptions/data/model/subscription_model.dart';

@prod
@Singleton(as: SubscriptionDataSource)
class SubscriptionDatasourceImpl implements SubscriptionDataSource {
  final Api _api;

  SubscriptionDatasourceImpl(this._api) {}

  @override
  Future<SubscriptionListModel> getAllSubscriptions() async {
    var response = await _api.dio.get(
      '/admin-settings/subscriptions',
      options: Options(
        contentType: Headers.jsonContentType,
      ),
    );
    if (response.statusCode == 200) {
      return SubscriptionListModel.fromJson(response.data);
    } else {
      throw ApiException(
          message: response.statusMessage!, statusCode: response.statusCode!);
    }
  }
}
