import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:zheeta/app/api/api_manager_refactored.dart';
import 'package:zheeta/app/api/errors/exception.dart';
import 'package:zheeta/notification/data/datasource/notification_datasource.dart';
import 'package:zheeta/notification/data/model/notification_model.dart';

@prod
@Singleton(as: NotificationDataSource)
class NotificationDataSourceImpl implements NotificationDataSource {
  final Api _api;

  NotificationDataSourceImpl(this._api);

  @override
  Future<List<NotificationModel>> getNotifications({
    required int pageNumber,
    required int pageSize,
    int? notificationType, // Optional parameter
    int? notificationDurationInDays, // Optional parameter
  }) async {
    // Create a map for query parameters
    final Map<String, dynamic> queryParameters = {
      'PageNumber': pageNumber,
      'PageSize': pageSize,
    };

    // Add optional parameters to the map if they are not null
    if (notificationType != null) {
      queryParameters['NotificationType'] = notificationType;
    }

    if (notificationDurationInDays != null) {
      queryParameters['NotificationDurationInDays'] =
          notificationDurationInDays;
    }

    var response = await _api.dio.get(
      '/notification/get-notifications',
      queryParameters: queryParameters, // Pass query parameters
      options: Options(
        contentType: Headers.jsonContentType,
      ),
    );
    if (response.statusCode == 200) {
      List<dynamic> data = response.data['data'] ?? [];
      return data.map((json) => NotificationModel.fromJson(json)).toList();
    } else {
      throw ApiException(
        message: response.statusMessage!,
        statusCode: response.statusCode!,
      );
    }
  }

  @override
  Future<void> deleteNotification({
    required String notificationId,
    required int notificationType,
  }) async {
    var response = await _api.dio.delete(
      'notification/delete-notification?notificationId=$notificationId&notificationType=$notificationType',
      options: Options(
        contentType: Headers.jsonContentType,
      ),
    );

    if (response.statusCode != 200) {
      throw ApiException(
        message: response.statusMessage!,
        statusCode: response.statusCode!,
      );
    }
  }

  @override
  Future<void> markAllNotificationsRead() async {
    var response = await _api.dio.put(
      '/notification/mark-all-notifications-read',
      options: Options(
        contentType: Headers.jsonContentType,
      ),
    );

    if (response.statusCode != 200) {
      throw ApiException(
        message: response.statusMessage!,
        statusCode: response.statusCode!,
      );
    }
  }

  @override
  Future<void> markNotificationRead({
    required List<String> notificationIds,
  }) async {
    var response = await _api.dio.put(
      '/notification/mark-notification',
      options: Options(
        contentType: Headers.jsonContentType,
      ),
      data: {
        'notificationIds': notificationIds,
      },
    );
    if (response.statusCode != 200) {
      throw ApiException(
        message: response.statusMessage!,
        statusCode: response.statusCode!,
      );
    }
  }
}
