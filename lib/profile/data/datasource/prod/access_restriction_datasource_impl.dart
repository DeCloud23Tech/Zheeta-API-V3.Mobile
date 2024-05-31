import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:zheeta/app/api/api_manager.dart';
import 'package:zheeta/app/api/api_manager_refactored.dart';
import 'package:zheeta/app/api/errors/exception.dart';
import 'package:zheeta/app/common/storage/local_storage_impl.dart';
import 'package:zheeta/app/common/storage/storage_keys.dart';
import 'package:zheeta/authentication/domain/entity/types.dart';
import 'package:zheeta/profile/data/datasource/access_restriction_datasource.dart';

@prod
@Singleton(as: AccessRestrictionDataSource)
class AccessRestrictionDataSourceImpl implements AccessRestrictionDataSource {
  final ApiManager _apiManager;
  late final String? _authToken;
  final Api _api;

  AccessRestrictionDataSourceImpl(this._apiManager, this._api) {
    _getAuthToken();
  }

  _getAuthToken() async {
    _authToken = (await sessionManager.get(SessionManagerKeys.authTokenString))
        as String?;
  }

  @override
  Future<Either<ErrorResponse, MappedResponse>> disableAccount(
      {required String userId}) async {
    final response = await _apiManager
        .putHttp('/user/disable-user-account/$userId', {}, token: _authToken);
    if (response.success) {
      return Right(response.data);
    } else {
      return Left(
        ErrorResponse(message: response.message, data: response.data),
      );
    }
  }

  @override
  Future<Either<ErrorResponse, MappedResponse>> enableAccount(
      {required String userId}) async {
    final response = await _apiManager
        .putHttp('/user/enable-user-account/$userId', {}, token: _authToken);
    if (response.success) {
      return Right(response.data);
    } else {
      return Left(
        ErrorResponse(message: response.message, data: response.data),
      );
    }
  }

  @override
  Future<void> disableAccountNew({required String userId}) async {
    var response = await _api.dio.put('/user/disable-user-account/$userId',
        options: Options(
          contentType: Headers.jsonContentType,
        ),
        data: {});
    if (response.statusCode == 200) {
    } else {
      throw ApiException(
          message: response.statusMessage!, statusCode: response.statusCode!);
    }
  }

  @override
  Future<void> enableAccountNew({required String userId}) async {
    var response = await _api.dio.put('/user/enable-user-account/$userId',
        options: Options(
          contentType: Headers.jsonContentType,
        ),
        data: {});
    if (response.statusCode == 200) {
    } else {
      throw ApiException(
          message: response.statusMessage!, statusCode: response.statusCode!);
    }
  }
}
