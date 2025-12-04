import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:zheeta/core/network/api.dart';
import 'package:zheeta/features/profile/data/datasources/i_user_profile_boost_datasource.dart';
import 'package:zheeta/features/profile/data/models/boost_insight_model.dart';
import 'package:zheeta/features/profile/data/models/matched_profile_boost_model.dart';
import 'package:zheeta/features/profile/data/requests/create_profile_boost_request.dart';

@prod
@Singleton(as: IUserProfileBoostDataSource)
class UserProfileBoostDataSourceImpl implements IUserProfileBoostDataSource {
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
