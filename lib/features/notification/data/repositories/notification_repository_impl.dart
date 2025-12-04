import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:zheeta/core/constants/type_def.dart';
import 'package:zheeta/core/error/error.dart';
import 'package:zheeta/core/error/exception.dart';
import 'package:zheeta/features/notification/data/datasources/i_notification_datasource.dart';
import 'package:zheeta/features/notification/data/models/notification_model.dart';
import 'package:zheeta/features/notification/domain/repositories/notification_repository.dart';

@prod
@LazySingleton(as: INotificationRepository)
class NotificationRepositoryImpl implements INotificationRepository {
  final INotificationDataSource _datasource;

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
      return left(ApiError(
          message: ex.response?.data['message'],
          statusCode: ex.response!.statusCode!));
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
      return left(ApiError(
          message: ex.response?.data['message'],
          statusCode: ex.response!.statusCode!));
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
      return left(ApiError(
          message: ex.response?.data['message'],
          statusCode: ex.response!.statusCode!));
    }
  }
}
