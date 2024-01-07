import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:zheeta/app/api/api_manager.dart';
import 'package:zheeta/authentication/data/datasource/identity_role_datasource.dart';
import 'package:zheeta/authentication/data/request/user_roles_request.dart';
import 'package:zheeta/authentication/domain/entity/types.dart';

@prod
@LazySingleton(as: IdentityRoleDataSource)
class IdentityRoleDataSourceImpl implements IdentityRoleDataSource {
  final ApiManager _apiManager;

  IdentityRoleDataSourceImpl(this._apiManager);

  @override
  Future<Either<Error, MappedResponse>> downgradeUserRole(UserRoleRequest request) async {
    final response = await _apiManager.deleteHttp('/userauth/roles', request.toJson());
    if (response.success) {
      return Right(response.data);
    } else {
      return Left(response.message);
    }
  }

  @override
  Future<Either<Error, MappedResponse>> upgradeUserRole(UserRoleRequest request) async {
    final response = await _apiManager.putHttp('/userauth/roles', request.toJson());
    if (response.success) {
      return Right(response.data);
    } else {
      return Left(response.message);
    }
  }
}
