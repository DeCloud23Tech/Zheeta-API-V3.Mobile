import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:zheeta/activity/data/models/activity_model.dart';
import 'package:zheeta/app/api/api_manager.dart';
import 'package:zheeta/app/api/api_manager_refactored.dart';
import 'package:zheeta/app/api/errors/exception.dart';
import 'package:zheeta/app/common/storage/local_storage_impl.dart';
import 'package:zheeta/app/common/storage/storage_keys.dart';
import 'package:zheeta/authentication/domain/entity/types.dart';
import 'package:zheeta/profile/data/datasource/user_profile_datasource.dart';
import 'package:zheeta/profile/data/model/all_user_profile_model.dart';
import 'package:zheeta/profile/data/model/user_profile_model.dart';
import 'package:zheeta/profile/data/model/view_profile_model.dart';
import 'package:zheeta/profile/data/request/create_user_profile_request.dart';
import 'package:zheeta/profile/data/request/update_user_profile_request.dart';

@prod
@Singleton(as: UserProfileDataSource)
class UserProfileDataSourceImpl implements UserProfileDataSource {
  final ApiManager _apiManager;
  final Api _api;
  late final String? _authToken;

  UserProfileDataSourceImpl(this._apiManager, this._api) {
    _getAuthToken();
  }

  _getAuthToken() async {
    _authToken = (await sessionManager.get(SessionManagerKeys.authTokenString))
        as String?;
  }

  @override
  Future<Either<ErrorResponse, MappedResponse>> createUserProfile(
      CreateUserProfileRequest request) async {
    final response = await _apiManager
        .postHttp('/user/profile', request.toJson(), token: _authToken);
    if (response.success) {
      return Right(response.data);
    } else {
      return Left(
        ErrorResponse(
            message: response.message,
            data: response.data,
            errors: response.errors),
      );
    }
  }

  @override
  Future<Either<ErrorResponse, MappedResponse>> getAllUsersProfile({
    required int roleType,
    required int pageNumber,
    required int pageSize,
  }) async {
    final response = await _apiManager.getHttp(
        '/user/get-all-users?PageNumber=$pageNumber&PageSize=$pageSize&roleType=$roleType',
        token: _authToken);
    if (response.success) {
      return Right(response.data);
    } else {
      return Left(
        ErrorResponse(message: response.message, data: response.data),
      );
    }
  }

  @override
  Future<Either<ErrorResponse, MappedResponse>> getSingleUserProfile() async {
    final response = await _apiManager.getHttp('/user/get-single-user-profile',
        token: _authToken);
    if (response.success) {
      return Right(response.data);
    } else {
      return Left(
        ErrorResponse(message: response.message, data: response.data),
      );
    }
  }

  @override
  Future<Either<ErrorResponse, MappedResponse>> updateUserProfile(
      UpdateUserProfileRequest request) async {
    final response = await _apiManager.putHttp(
        '/user/update-user-profile', request.toJson(),
        token: _authToken);
    if (response.success) {
      return Right(response.data);
    } else {
      return Left(
        ErrorResponse(message: response.message, data: response.data),
      );
    }
  }

  @override
  Future<Either<ErrorResponse, MappedResponse>> updateUserProfilePicture({
    required String userId,
    required MultipartFile file,
  }) async {
    Map<String, dynamic> payload = {'userId': userId, 'file': file};
    final response = await _apiManager.putHttp('/user/picture', payload,
        token: _authToken, formdata: true);
    if (response.success) {
      return Right(response.data);
    } else if (response.statusCode == 413) {
      return Left(ErrorResponse(message: 'File size is too large'));
    } else {
      return Left(
        ErrorResponse(message: response.message, data: response.data),
      );
    }
  }

  @override
  Future<Either<ErrorResponse, MappedResponse>> visitUserProfile(
      {required String userId}) async {
    final response = await _apiManager.getHttp('/user/view-profile/$userId',
        token: _authToken);
    if (response.success) {
      var theData = response.data['data'];
      return Right(theData);
    } else {
      return Left(
        ErrorResponse(message: response.message, data: response.data),
      );
    }
  }

  @override
  Future<Either<ErrorResponse, MappedResponse>> getUserActivity() async {
    final response = await _apiManager.getHttp(
        '/activity-post/get-posts-by-loggedin-user?PageNumber=1&PageSize=10',
        token: _authToken);
    if (response.success) {
      var theData = response.data;
      return Right(theData);
    } else {
      return Left(
        ErrorResponse(message: response.message, data: response.data),
      );
    }
  }

  @override
  Future<void> createUserProfileNew(CreateUserProfileRequest request) async {
    var response = await _api.dio.post('/user/profile',
        options: Options(
          contentType: Headers.jsonContentType,
        ),
        data: jsonEncode(request.toJson()));
    if (response.statusCode == 200) {
    } else {
      throw ApiException(
          message: response.statusMessage!, statusCode: response.statusCode!);
    }
  }

  @override
  Future<AllUserProfileListModel> getAllUsersProfileNew(
      {required int roleType,
      required int pageNumber,
      required int pageSize}) async {
    var response = await _api.dio.get(
      '/user/get-all-users?PageNumber=$pageNumber&PageSize=$pageSize&roleType=$roleType',
      options: Options(
        contentType: Headers.jsonContentType,
      ),
    );
    if (response.statusCode == 200) {
      return AllUserProfileListModel.fromJson(response.data['data']);
    } else {
      throw ApiException(
          message: response.statusMessage!, statusCode: response.statusCode!);
    }
  }

  @override
  Future<UserProfileModel> getSingleUserProfileNew() async {
    var response = await _api.dio.get(
      '/user/get-single-user-profile',
      options: Options(
        contentType: Headers.jsonContentType,
      ),
    );
    if (response.statusCode == 200) {
      if (response.data['statusCode'] == 200) {
        return UserProfileModel.fromJson(response.data);
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
  Future<ActivityListModel> getUserActivityNew() async {
    var response = await _api.dio.get(
      '/user/get-single-user-profile',
      options: Options(
        contentType: Headers.jsonContentType,
      ),
    );
    if (response.statusCode == 200) {
      return ActivityListModel.fromJson(response.data['data']);
    } else {
      throw ApiException(
          message: response.statusMessage!, statusCode: response.statusCode!);
    }
  }

  @override
  Future<void> updateUserProfileNew(UpdateUserProfileRequest request) async {
    var response = await _api.dio.put('/user/update-user-profile',
        options: Options(
          contentType: Headers.jsonContentType,
        ),
        data: jsonEncode(request.toJson()));
    if (response.statusCode == 200) {
    } else {
      throw ApiException(
          message: response.statusMessage!, statusCode: response.statusCode!);
    }
  }

  @override
  Future<void> updateUserProfilePictureNew(
      {required String userId, required MultipartFile file}) async {
    dynamic payload = {'userId': userId, 'file': file};
    payload = FormData.fromMap(payload as Map<String, dynamic>);
    var response = await _api.dio.put('/user/picture',
        options: Options(
          contentType: 'multipart/form-data',
        ),
        data: payload);
    if (response.statusCode == 200) {
    } else {
      throw ApiException(
          message: response.statusMessage!, statusCode: response.statusCode!);
    }
  }

  @override
  Future<ViewProfileModel> visitUserProfileNew({required String userId}) async {
    var response = await _api.dio.get(
      '/activity-post/get-posts-by-loggedin-user?PageNumber=1&PageSize=10',
      options: Options(
        contentType: Headers.jsonContentType,
      ),
    );
    if (response.statusCode == 200) {
      return ViewProfileModel.fromJson(response.data['data']);
    } else {
      throw ApiException(
          message: response.statusMessage!, statusCode: response.statusCode!);
    }
  }
}
