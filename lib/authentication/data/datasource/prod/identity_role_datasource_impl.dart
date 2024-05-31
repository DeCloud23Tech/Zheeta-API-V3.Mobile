import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:zheeta/app/api/api_manager.dart';
import 'package:zheeta/app/api/api_manager_refactored.dart';
import 'package:zheeta/app/api/errors/exception.dart';
import 'package:zheeta/authentication/data/datasource/identity_role_datasource.dart';
import 'package:zheeta/authentication/data/request/user_roles_request.dart';
import 'package:zheeta/authentication/domain/entity/types.dart';

@prod
@LazySingleton(as: IdentityRoleDataSource)
class IdentityRoleDataSourceImpl implements IdentityRoleDataSource {
  final ApiManager _apiManager;
  final Api _api;

  IdentityRoleDataSourceImpl(this._apiManager, this._api);

  @override
  Future<Either<ErrorResponse, MappedResponse>> downgradeUserRole(
      UserRoleRequest request) async {
    final response =
        await _apiManager.deleteHttp('/userauth/roles', request.toJson());
    if (response.success) {
      return Right(response.data);
    } else {
      return Left(
        ErrorResponse(message: response.message, data: response.data),
      );
    }
  }

  @override
  Future<Either<ErrorResponse, MappedResponse>> upgradeUserRole(
      UserRoleRequest request) async {
    final response =
        await _apiManager.putHttp('/userauth/roles', request.toJson());
    if (response.success) {
      return Right(response.data);
    } else {
      return Left(
        ErrorResponse(message: response.message, data: response.data),
      );
    }
  }

  @override
  Future<void> downgradeUserRoleNew(UserRoleRequest request) async {
    var response = await _api.dio.put('/userauth/roles',
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
  Future<void> upgradeUserRoleNew(UserRoleRequest request) async {
    var response = await _api.dio.put('/userauth/roles',
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
}
