import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:zheeta/core/constants/type_def.dart';
import 'package:zheeta/core/error/error.dart';
import 'package:zheeta/core/error/exception.dart';
import 'package:zheeta/features/payment_and_subscriptions/data/datasources/i_subscription_datasource.dart';
import 'package:zheeta/features/payment_and_subscriptions/data/models/charges_model.dart';
import 'package:zheeta/features/payment_and_subscriptions/data/models/subscription_model.dart';
import 'package:zheeta/features/payment_and_subscriptions/domain/repositories/subscription_repository.dart';

@prod
@LazySingleton(as: ISubscriptionRepository)
class SubscriptionRepositoryImpl implements ISubscriptionRepository {
  final ISubscriptionDataSource _datasource;

  SubscriptionRepositoryImpl(this._datasource);

  @override
  ResultFuture<SubscriptionListModel> getAllSubscriptions() async {
    try {
      final result = await _datasource.getAllSubscriptions();
      return right(result);
    } on ApiException catch (ex) {
      return left(ApiError(message: ex.message, statusCode: ex.statusCode));
    } on DioException catch (ex) {
      return left(ApiError(
          message: ex.response?.data['message'],
          statusCode: ex.response!.statusCode!));
    }
  }

  @override
  ResultFuture<ChargesListModel> getAllCharges() async {
    try {
      final result = await _datasource.getAllCharges();
      return right(result);
    } on ApiException catch (ex) {
      return left(ApiError(message: ex.message, statusCode: ex.statusCode));
    } on DioException catch (ex) {
      return left(ApiError(
          message: ex.response?.data['message'],
          statusCode: ex.response!.statusCode!));
    }
  }
}
