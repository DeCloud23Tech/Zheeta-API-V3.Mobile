import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:zheeta/app/api/api_manager.dart';
import 'package:zheeta/app/api/api_manager_refactored.dart';
import 'package:zheeta/app/api/errors/exception.dart';
import 'package:zheeta/app/common/storage/local_storage_impl.dart';
import 'package:zheeta/app/common/storage/storage_keys.dart';
import 'package:zheeta/authentication/domain/entity/types.dart';
import 'package:zheeta/profile/data/datasource/user_profile_access_datasource.dart';

import '../../model/blocked_user_model.dart';

@prod
@Singleton(as: UserProfileAccessDataSource)
class UserProfileAccessDataSourceImpl implements UserProfileAccessDataSource {
  final ApiManager _apiManager;
  late final String? _authToken;
  final Api _api;

  UserProfileAccessDataSourceImpl(this._apiManager, this._api) {
    _getAuthToken();
  }

  _getAuthToken() async {
    _authToken = (await sessionManager.get(SessionManagerKeys.authTokenString))
        as String?;
  }

  @override
  Future<Either<ErrorResponse, MappedResponse>> blockAccount({
    required String userId,
    required String blockOrUnblockUserId,
  }) async {
    Map<String, String> payload = {
      'userId': userId,
      'blockOrUnblockUserId': blockOrUnblockUserId
    };
    final response = await _apiManager.postHttp('/user/block-user', payload,
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
  Future<Either<ErrorResponse, MappedResponse>> getBlockedUsers({
    required int pageNumber,
    required int pageSize,
  }) async {
    final response = await _apiManager.getHttp(
        '/user/get-blocked-users?PageNumber=$pageNumber&PageSize=$pageSize',
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
  Future<Either<ErrorResponse, MappedResponse>> unblockAccount({
    required String userId,
    required String blockOrUnblockUserId,
  }) async {
    Map<String, String> payload = {
      'userId': userId,
      'blockOrUnblockUserId': blockOrUnblockUserId
    };
    final response = await _apiManager.deleteHttp('/user/block-user', payload,
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
  Future<bool> blockAccountNew(
      {required String userId, required String blockOrUnblockUserId}) async {
    Map<String, String> payload = {
      'userId': userId,
      'blockOrUnblockUserId': blockOrUnblockUserId
    };
    var response = await _api.dio.post('/user/block-user',
        options: Options(
          contentType: Headers.jsonContentType,
        ),
        data: payload);
    if (response.statusCode == 200) {
      return true;
    } else {
      throw ApiException(
          message: response.statusMessage!, statusCode: response.statusCode!);
    }
  }

  @override
  Future<BlockedUsersResponse> getBlockedUsersNew(
      {required int pageNumber, required int pageSize}) async {
    var response = await _api.dio.get(
      '/user/get-blocked-users?PageNumber=$pageNumber&PageSize=$pageSize',
      options: Options(
        contentType: Headers.jsonContentType,
      ),
    );
    if (response.statusCode == 200) {
      if (response.data['data'] == null) {
        // If null, return an empty list
        return BlockedUsersResponse(data: []);
      } else {
        return BlockedUsersResponse.fromJson(response.data);
      }
    } else {
      throw ApiException(
          message: response.statusMessage!, statusCode: response.statusCode!);
    }
  }

  @override
  Future<bool> unblockAccountNew(
      {required String userId, required String blockOrUnblockUserId}) async {
    Map<String, String> payload = {
      'userId': userId,
      'blockOrUnblockUserId': blockOrUnblockUserId
    };
    var response = await _api.dio.delete('/user/unblock-user',
        options: Options(
          contentType: Headers.jsonContentType,
        ),
        data: payload);
    if (response.statusCode == 200) {
      return true;
    } else {
      throw ApiException(
          message: response.statusMessage!, statusCode: response.statusCode!);
    }
  }
}
