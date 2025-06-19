import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:zheeta/common/errors/exception.dart';
import 'package:zheeta/common/services/api/api_manager.dart';
import 'package:zheeta/features/profile/data/datasource/user_profile_datasource.dart';
import 'package:zheeta/features/profile/data/datasource/user_search_datasource.dart';
import 'package:zheeta/features/profile/data/model/search_user_by_customer_model.dart';
import 'package:zheeta/features/profile/data/model/user_profile_model.dart';
import 'package:zheeta/features/profile/data/model/view_profile_model.dart';
import 'package:zheeta/features/profile/data/request/create_user_profile_request.dart';
import 'package:zheeta/features/profile/data/request/update_user_profile_request.dart';

@prod
@Singleton(as: UserSearchDataSource)
class UserSearchDataSourceImpl implements UserSearchDataSource {
  final Api _api;

  UserSearchDataSourceImpl(this._api);

  @override
  Future<SearchUserByCustomerListModel> searchUserByCustomerNew(
      {required String username,
      required int pageNumber,
      required int pageSize}) async {
    var response = await _api.dio.get(
      '/user/search/$username?&PageNumber=$pageNumber&PageSize=$pageSize',
      options: Options(
        contentType: Headers.jsonContentType,
      ),
    );
    if (response.statusCode == 200) {
      return SearchUserByCustomerListModel.fromJson(response.data);
    } else {
      throw DioException.badResponse(
          statusCode: response.data?['statusCode'] ?? 400,
          requestOptions: response.requestOptions,
          response: response);
    }
  }
}
