import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:zheeta/core/network/api.dart';
import 'package:zheeta/features/notification/data/datasources/i_notification_datasource.dart';
import 'package:zheeta/features/notification/data/models/notification_model.dart';

@prod
@Singleton(as: INotificationDataSource)
class NotificationDataSourceImpl implements INotificationDataSource {
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
      throw DioException.badResponse(
          statusCode: response.data?['statusCode'] ?? 400,
          requestOptions: response.requestOptions,
          response: response);
    }
  }

  @override
  Future<void> deleteNotification({
    required String notificationId,
    required int notificationType,
  }) async {
    print('---- DELETE NOTIFICATION START ----');
    print(
        'Params: notificationId=$notificationId, notificationType=$notificationType');

    final response = await _api.dio.delete(
      '/notification/delete-notification?notificationId=$notificationId&notificationType=$notificationType',
      options: Options(contentType: Headers.jsonContentType),
    );

    print('Status code: ${response.statusCode}');
    print('Raw response data: ${response.data}');

    if (response.statusCode != 200) {
      int code = response.statusCode ?? 400;

      final data = response.data;
      if (data is Map<String, dynamic> && data['statusCode'] is int) {
        code = data['statusCode'] as int;
      }

      print('Deleting notification failed with code: $code');
      throw DioException.badResponse(
        statusCode: code,
        requestOptions: response.requestOptions,
        response: response,
      );
    }

    print('Notification deleted successfully.');
    print('---- DELETE NOTIFICATION END ----');
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
      throw DioException.badResponse(
          statusCode: response.data?['statusCode'] ?? 400,
          requestOptions: response.requestOptions,
          response: response);
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
      throw DioException.badResponse(
          statusCode: response.data?['statusCode'] ?? 400,
          requestOptions: response.requestOptions,
          response: response);
    }
  }
}
