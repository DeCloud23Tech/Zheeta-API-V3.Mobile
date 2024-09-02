import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:zheeta/notification/data/datasource/notification_datasource.dart';
import 'package:zheeta/notification/data/model/notification_model.dart';
import 'package:zheeta/notification/domain/repository/notification_repository.dart';

import '../../../../app/api/errors/error.dart';
import '../../../../app/api/errors/exception.dart';
import '../../../../app/common/type_def.dart';

@prod
@LazySingleton(as: NotificationRepository)
class NotificationRepositoryImpl implements NotificationRepository {
  final NotificationDataSource _datasource;

  NotificationRepositoryImpl(this._datasource);

  @override
  ResultFuture<List<NotificationModel>> getNotifications(
      {required int pageNumber, required int pageSize}) async {
    try {
      final result = await _datasource.getNotifications(
          pageNumber: pageNumber, pageSize: pageSize);
      return right(result);
    } on ApiException catch (ex) {
      return left(ApiError(message: ex.message, statusCode: ex.statusCode));
    } on DioException catch (ex) {
      return left(
          ApiError(message: ex.message!, statusCode: ex.response!.statusCode!));
    }
  }
}
