import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:zheeta/app/common/type_def.dart';
import 'package:zheeta/payment_and_subscriptions/data/model/subscription_model.dart';
import 'package:zheeta/payment_and_subscriptions/domain/repository/subscription_repository.dart';

import '../../../../app/api/errors/error.dart';
import '../../../../app/api/errors/exception.dart';
import '../datasource/subscription_datasource.dart';

@prod
@LazySingleton(as: SubscriptionRepository)
class SubscriptionRepositoryImpl implements SubscriptionRepository {
  final SubscriptionDataSource _datasource;

  SubscriptionRepositoryImpl(this._datasource);

  @override
  ResultFuture<SubscriptionListModel> getAllSubscriptions() async {
    try {
      final result = await _datasource.getAllSubscriptions();
      return right(result);
    } on ApiException catch (ex) {
      return left(ApiError(message: ex.message, statusCode: ex.statusCode));
    } on DioException catch (ex) {
      return left(
          ApiError(message: ex.message!, statusCode: ex.response!.statusCode!));
    }
  }
}
