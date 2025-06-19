import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:zheeta/common/constants/type_def.dart';
import 'package:zheeta/common/errors/error.dart';
import 'package:zheeta/common/errors/exception.dart';
import 'package:zheeta/features/payment_and_subscriptions/data/datasource/subscription_datasource.dart';
import 'package:zheeta/features/payment_and_subscriptions/data/model/charges_model.dart';
import 'package:zheeta/features/payment_and_subscriptions/data/model/subscription_model.dart';
import 'package:zheeta/features/payment_and_subscriptions/domain/repository/subscription_repository.dart';



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
          ApiError(message: ex.response?.data['message'], statusCode: ex.response!.statusCode!));
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
      return left(
          ApiError(message: ex.response?.data['message'], statusCode: ex.response!.statusCode!));
    }
  }
}
