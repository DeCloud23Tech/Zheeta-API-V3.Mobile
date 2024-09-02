import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:zheeta/notification/data/datasource/notification_datasource.dart';
import 'package:zheeta/notification/data/model/notification_model.dart';
import '../../../../app/api/api_manager_refactored.dart';
import '../../../../app/api/errors/exception.dart';

@prod
@Singleton(as: NotificationDataSource)
class NotificationDataSourceImpl implements NotificationDataSource {
  final Api _api;

  NotificationDataSourceImpl(this._api) {}

  @override
  Future<List<NotificationModel>> getNotifications(
      {required int pageNumber, required int pageSize}) async {
    var response = await _api.dio.get(
      '/notification/get-notifications?PageNumber=$pageNumber&PageSize=$pageSize',
      options: Options(
        contentType: Headers.jsonContentType,
      ),
    );
    if (response.statusCode == 200) {
      List<dynamic> data = response.data['data'];
      return data.map((json) => NotificationModel.fromJson(json)).toList();
    } else {
      throw ApiException(
          message: response.statusMessage!, statusCode: response.statusCode!);
    }
  }
}
