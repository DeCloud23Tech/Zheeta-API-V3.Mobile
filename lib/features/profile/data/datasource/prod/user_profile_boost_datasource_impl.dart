import 'dart:convert';

import 'package:dio/dio.dart'
    show DioException, FormData, Headers, MultipartFile, Options;
import 'package:injectable/injectable.dart';
import 'package:zheeta/common/services/api/api_manager.dart';
import 'package:zheeta/features/profile/data/datasource/user_profile_boost_datasource.dart';
import 'package:zheeta/features/profile/data/model/boost_insight_model.dart';
import 'package:zheeta/features/profile/data/model/matched_profile_boost_model.dart';
import 'package:zheeta/features/profile/data/request/create_profile_boost_request.dart';

@prod
@Singleton(as: UserProfileBoostDataSource)
class UserProfileBoostDataSourceImpl implements UserProfileBoostDataSource {
  final Api _api;

  UserProfileBoostDataSourceImpl(this._api);

  @override
  Future<void> createProfileBoostNew(CreateProfileBoostRequest request) async {
    var response = await _api.dio.post(
      '/profile-boost/create',
      options: Options(
        contentType: Headers.jsonContentType,
      ),
      data: request.toJson(),
    );

    if (response.statusCode == 200) {
      if (response.data?['statusCode'] == 201) {
      } else {
        throw DioException.badResponse(
            statusCode: response.data?['statusCode'] ?? 400,
            requestOptions: response.requestOptions,
            response: response);
      }
    } else {
      throw DioException.badResponse(
          statusCode: response.data?['statusCode'] ?? 400,
          requestOptions: response.requestOptions,
          response: response);
    }
  }

  @override
  Future<ProfileBoostListModel> getProfileBoost() async {
    var response = await _api.dio.get(
      '/profile-boost/get',
      options: Options(
        contentType: Headers.jsonContentType,
      ),
    );
    if (response.statusCode == 200) {
      final List<dynamic> dataList = response.data['data'] ?? [];
      final List<ProfileBoostModel> data = dataList
          .map((item) =>
              ProfileBoostModel.fromJson(item as Map<String, dynamic>))
          .toList();
      return ProfileBoostListModel(data: data);
    } else {
      throw DioException.badResponse(
          statusCode: response.data?['statusCode'] ?? 400,
          requestOptions: response.requestOptions,
          response: response);
    }
  }

  @override
  Future<BoostInsightModel> getProfileBoostInsight(String userId) async {
    var response = await _api.dio.get(
      '/profile-boost/get/$userId',
      options: Options(
        contentType: Headers.jsonContentType,
      ),
    );
    if (response.statusCode == 200 && response.data['data'] != null) {
      return BoostInsightModel.fromJson(response.data['data']);
    } else {
      throw DioException.badResponse(
          statusCode: response.data?['statusCode'] ?? 400,
          requestOptions: response.requestOptions,
          response: response);
    }
  }
}
