import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart' show MultipartFile;
import 'package:http_parser/http_parser.dart';
import 'package:injectable/injectable.dart';
import 'package:zheeta/app/api/api_manager.dart';
import 'package:zheeta/app/common/storage/local_storage_impl.dart';
import 'package:zheeta/app/common/storage/storage_keys.dart';
import 'package:zheeta/authentication/domain/entity/types.dart';
import 'package:zheeta/profile/data/datasource/user_profile_boost_datasource.dart';
import 'package:zheeta/profile/data/request/create_profile_boost_request.dart';
import 'package:zheeta/profile/domain/entity/type.dart';

@prod
@Singleton(as: UserProfileBoostDataSource)
class UserProfileBoostDataSourceImpl implements UserProfileBoostDataSource {
  final ApiManager _apiManager;
  late final String? _authToken;

  UserProfileBoostDataSourceImpl(this._apiManager) {
    _getAuthToken();
  }

  _getAuthToken() async {
    _authToken = (await sessionManager.get(SessionManagerKeys.authTokenString)) as String?;
  }

  @override
  Future<Either<ErrorResponse, MappedResponse>> createProfileBoost(CreateProfileBoostRequest request) async {
    late Map<String, dynamic> payload;
    payload = request.toJson();
    List<MultipartFile> fileList = [];
    request.profileUrlForAds.forEach((filePath) async {
      final file = await MultipartFile.fromFile(File(filePath).path, contentType: MediaType('image', 'jpg'));
      fileList.add(file);
    });
    payload['profileUrlForAds'] = fileList;
    final response = await _apiManager.postHttp('/profile-boost/create', payload, token: _authToken, formdata: true);
    if (response.success) {
      return Right(response.data);
    } else {
      return Left(
        ErrorResponse(message: response.message, data: response.data),
      );
    }
  }

  @override
  Future<Either<ErrorResponse, MappedResponse>> getBoostedProfileByAdmin(GetBoostedProfileByAdminRequest request) async {
    final response = await _apiManager.getHttp('/profile-boost/get-all-admin', token: _authToken);
    if (response.success) {
      return Right(response.data);
    } else {
      return Left(
        ErrorResponse(message: response.message, data: response.data),
      );
    }
  }

  @override
  Future<Either<ErrorResponse, MappedResponse>> getMatchedProfileBoost() async {
    final response = await _apiManager.getHttp('/profile-boost/get-matched', token: _authToken);
    if (response.success) {
      return Right(response.data);
    } else {
      return Left(
        ErrorResponse(message: response.message, data: response.data),
      );
    }
  }
}
