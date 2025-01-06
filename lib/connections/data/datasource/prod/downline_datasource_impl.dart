import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:zheeta/app/api/api_manager_refactored.dart';
import 'package:zheeta/app/api/errors/exception.dart';
import 'package:zheeta/connections/data/model/user_downline_model.dart';

import '../downline_datasource.dart';

@prod
@Singleton(as: UserDownlineDataSource)
class UserDownlineDataSourceImpl implements UserDownlineDataSource {
  final Api _api;

  UserDownlineDataSourceImpl(this._api);

  @override
  Future<UserDownlineListModel> getDownlines(
      {required int pageNumber, required int pageSize}) async {
    var response = await _api.dio.get(
      '/userdownline/get?PageNumber=$pageNumber&PageSize=$pageSize',
      options: Options(
        contentType: Headers.jsonContentType,
      ),
    );
    if (response.statusCode == 200) {
      final List<dynamic> dataList = response.data['data'] ?? [];
      final List<UserDownlineModel> data = dataList
          .map((item) =>
              UserDownlineModel.fromJson(item as Map<String, dynamic>))
          .toList();
      return UserDownlineListModel(data: data);
    } else {
      throw ApiException(
          message: response.statusMessage!, statusCode: response.statusCode!);
    }
  }
}
