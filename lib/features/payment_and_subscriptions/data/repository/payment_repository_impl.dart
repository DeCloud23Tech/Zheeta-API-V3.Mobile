import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:zheeta/common/constants/type_def.dart';
import 'package:zheeta/common/errors/error.dart';
import 'package:zheeta/common/errors/exception.dart';
import 'package:zheeta/features/payment_and_subscriptions/data/datasource/payment_datasource.dart';
import 'package:zheeta/features/payment_and_subscriptions/data/model/generate_payment_link_model.dart';
import 'package:zheeta/features/payment_and_subscriptions/data/model/payment_types_model.dart';
import 'package:zheeta/features/payment_and_subscriptions/domain/repository/payment_repository.dart';

@prod
@LazySingleton(as: PaymentRepository)
class PaymentRepositoryImpl implements PaymentRepository {
  final PaymentDataSource _datasource;

  PaymentRepositoryImpl(this._datasource);

  @override
  ResultFuture<GeneratePaymentLinkData> generatePaymentLink({
    required String userId,
    required int payInType,
    required double amount,
    required String currency,
  }) async {
    try {
      final result = await _datasource.generatePaymentLink(
          userId: userId,
          payInType: payInType,
          amount: amount,
          currency: currency);
      return right(result);
    } on ApiException catch (ex) {
      return left(ApiError(message: ex.message, statusCode: ex.statusCode));
    } on DioException catch (ex) {
      return left(
          ApiError(message: ex.response?.data['message'], statusCode: ex.response!.statusCode!));
    }
  }

  @override
  ResultFuture<List<PaymentType>> getPaymentTypes() async {
    try {
      final result = await _datasource.getPaymentTypes();
      return right(result);
    } on ApiException catch (ex) {
      return left(ApiError(message: ex.message, statusCode: ex.statusCode));
    } on DioException catch (ex) {
      return left(
          ApiError(message: ex.response?.data['message'], statusCode: ex.response!.statusCode!));
    }
  }
}
