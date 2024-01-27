import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:zheeta/app/api/api_manager.dart';
import 'package:zheeta/app/common/enums/notification_filter.dart';
import 'package:zheeta/app/common/storage/local_storage_impl.dart';
import 'package:zheeta/app/common/storage/storage_keys.dart';
import 'package:zheeta/authentication/domain/entity/types.dart';
import 'package:zheeta/notification/data/datasource/notification_datasource.dart';

@prod
@Singleton(as: NotificationDataSource)
class NotificationDataSourceImpl implements NotificationDataSource {
  ApiManager _apiManager;
  late final String? _authToken;

  NotificationDataSourceImpl(this._apiManager) {
    _getAuthToken();
  }

  _getAuthToken() async {
    _authToken = (await sessionManager.get(SessionManagerKeys.authTokenString)) as String?;
  }

  @override
  Future<Either<ErrorResponse, MappedResponse>> getNotifications({
    int? pageNumber,
    int? pageSize,
    required NotificationType notificationType,
    required NotificationDate notificationDurationInDays,
  }) async {
    final response = await _apiManager.getHttp(
      '/notification/get-notifications?${pageNumber != null ? 'PageNumber=$pageNumber&' : ''}${pageSize != null ? 'PageSize=$pageSize&' : ''}${notificationType != NotificationType.all ? 'NotificationType=${notificationType.value}&' : ''}${notificationDurationInDays != NotificationDate.all ? 'NotificationDurationInDays=${notificationDurationInDays.value}&' : ''}',
      token: _authToken,
    );
    if (response.success) {
      return Right(response.data);
    } else {
      return Left(
        ErrorResponse(message: response.message, data: response.data),
      );
    }
  }

  @override
  Future<Either<ErrorResponse, MappedResponse>> markNotification({required List<String> notificationIds}) async {
    final payload = {
      'notificationIds': notificationIds,
    };
    final repsonse = await _apiManager.putHttp('/notification/mark-notification', payload, token: _authToken);

    if (repsonse.success) {
      return Right(repsonse.data);
    } else {
      return Left(
        ErrorResponse(message: repsonse.message, data: repsonse.data),
      );
    }
  }

  @override
  Future<Either<ErrorResponse, MappedResponse>> markAllNotificationsRead() async {
    final response = await _apiManager.putHttp('/notification/mark-all-notifications-read', null, token: _authToken);

    if (response.success) {
      return Right(response.data);
    } else {
      return Left(
        ErrorResponse(message: response.message, data: response.data),
      );
    }
  }
}
