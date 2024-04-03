import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:zheeta/app/api/errors/error.dart';
import 'package:zheeta/app/api/errors/exception.dart';
import 'package:zheeta/app/common/type_def.dart';
import 'package:zheeta/authentication/data/datasource/identity_role_datasource.dart';
import 'package:zheeta/authentication/data/request/user_roles_request.dart';
import 'package:zheeta/authentication/domain/repository/identity_role_repository.dart';

@prod
@LazySingleton(as: IdentityRoleRepository)
class IdentityRoleRepositoryImpl implements IdentityRoleRepository {
  final IdentityRoleDataSource _datasource;
  IdentityRoleRepositoryImpl(this._datasource);

  ResultVoid upgradeUserRoleRepo(UserRoleRequest request) async {
    try {
      final result = await _datasource.upgradeUserRoleNew(request);
      return right(result);
    } on ApiException catch (ex) {
      return left(ApiError(message: ex.message, statusCode: ex.statusCode));
    } on DioException catch (ex) {
      return left(
          ApiError(message: ex.message!, statusCode: ex.response!.statusCode!));
    }
  }

  ResultVoid downgradeUserRoleRepo(UserRoleRequest request) async {
    try {
      final result = await _datasource.downgradeUserRoleNew(request);
      return right(result);
    } on ApiException catch (ex) {
      return left(ApiError(message: ex.message, statusCode: ex.statusCode));
    } on DioException catch (ex) {
      return left(
          ApiError(message: ex.message!, statusCode: ex.response!.statusCode!));
    }
  }
}
