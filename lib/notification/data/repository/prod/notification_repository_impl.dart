import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:zheeta/app/api/errors/error.dart';
import 'package:zheeta/app/api/errors/exception.dart';
import 'package:zheeta/app/common/type_def.dart';
import 'package:zheeta/notification/data/datasource/notification_datasource.dart';
import 'package:zheeta/notification/data/model/notification_model.dart';
import 'package:zheeta/notification/domain/repository/notification_repository.dart';


@prod
@LazySingleton(as: NotificationRepository)
class NotificationRepositoryImpl implements NotificationRepository {
  final NotificationDataSource _datasource;

  NotificationRepositoryImpl(this._datasource);

  @override
  ResultFuture<List<NotificationModel>> getNotifications({
    required int pageNumber,
    required int pageSize,
    int? notificationType,
    int? notificationDurationInDays,
  }) async {
    try {
      final result = await _datasource.getNotifications(
        pageNumber: pageNumber,
        pageSize: pageSize,
        notificationType: notificationType,
        notificationDurationInDays: notificationDurationInDays,
      );
      return right(result);
    } on ApiException catch (ex) {
      return left(ApiError(message: ex.message, statusCode: ex.statusCode));
    } on DioException catch (ex) {
      return left(
          ApiError(message: ex.message!, statusCode: ex.response!.statusCode!));
    }
  }

  @override
  ResultVoid deleteNotification({
    required String notificationId,
    required int notificationType,
  }) async {
    try {
      await _datasource.deleteNotification(
        notificationId: notificationId,
        notificationType: notificationType,
      );
      return right(null);
    } on ApiException catch (ex) {
      return left(ApiError(message: ex.message, statusCode: ex.statusCode));
    } on DioException catch (ex) {
      return left(
          ApiError(message: ex.message!, statusCode: ex.response!.statusCode!));
    }
  }

  @override
  ResultVoid markAllNotificationRead() async {
    try {
      await _datasource.markAllNotificationsRead();
      return right(null);
    } on ApiException catch (ex) {
      return left(ApiError(message: ex.message, statusCode: ex.statusCode));
    } on DioException catch (ex) {
      return left(
          ApiError(message: ex.message!, statusCode: ex.response!.statusCode!));
    }
  }

  @override
  ResultVoid markNotificationRead({
    required List<String> notificationIds,
  }) async {
    try {
      await _datasource.markNotificationRead(notificationIds: notificationIds);
      return right(null);
    } on ApiException catch (ex) {
      return left(ApiError(message: ex.message, statusCode: ex.statusCode));
    } on DioException catch (ex) {
      return left(
          ApiError(message: ex.message!, statusCode: ex.response!.statusCode!));
    }
  }
}
