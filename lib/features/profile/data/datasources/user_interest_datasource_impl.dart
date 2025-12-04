import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:zheeta/core/network/api.dart';
import 'package:zheeta/features/profile/data/datasources/i_location_datasource.dart';
import 'package:zheeta/features/profile/data/datasources/i_user_interest_datasource.dart';
import 'package:zheeta/features/profile/data/models/address_from_location_model.dart';
import 'package:zheeta/features/profile/data/models/user_interest_model.dart';
import 'package:zheeta/features/profile/data/requests/location_coordinate_from_address_request.dart';
import 'package:zheeta/features/profile/data/requests/update_user_interest_request.dart';

@prod
@Singleton(as: IUserInterestDataSource)
class UserInterestDataSourceImpl implements IUserInterestDataSource {
  final Api _api;
  UserInterestDataSourceImpl(this._api);

  @override
  Future<UserInterestListModel> getInterestsNew() async {
    var response = await _api.dio.get(
      '/interest',
      options: Options(
        contentType: Headers.jsonContentType,
      ),
    );
    if (response.statusCode == 200) {
      return UserInterestListModel.fromJson(response.data);
    } else {
      throw DioException.badResponse(
          statusCode: response.data?['statusCode'] ?? 400,
          requestOptions: response.requestOptions,
          response: response);
    }
  }

  @override
  Future<void> updateUserInterestNew(UpdateUserInterestRequest request) async {
    var response = await _api.dio.put('/user/add-update-user-interests',
        options: Options(
          contentType: Headers.jsonContentType,
        ),
        data: jsonEncode(request.toJson()));
    if (response.statusCode == 200 && response.data?['statusCode'] == 201) {
      // print(response.data);
    } else {
      throw DioException.badResponse(
          statusCode: response.data?['statusCode'] ?? 400,
          requestOptions: response.requestOptions,
          response: response);
    }
  }
}
