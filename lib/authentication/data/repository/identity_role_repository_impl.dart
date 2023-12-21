import 'package:injectable/injectable.dart';
import 'package:zheeta/authentication/data/datasource/identity_role_datasource.dart';
import 'package:zheeta/authentication/data/request/user_roles_request.dart';
import 'package:zheeta/authentication/domain/repository/identity_role_repository.dart';

@prod
@LazySingleton(as: IdentityRoleRepository)
class IdentityRoleRepositoryImpl implements IdentityRoleRepository {
  final IdentityRoleDatasource _datasource;
  IdentityRoleRepositoryImpl(this._datasource);

  upgradeUserRoleRepo(UserRoleRequest request) async {
    final result = await _datasource.upgradeUserRole(request);
    result.fold(
      (error) => throw Exception(error),
      (value) => value,
    );
  }

  downgradeUserRoleRepo(UserRoleRequest request) async {
    final result = await _datasource.downgradeUserRole(request);
    result.fold(
      (error) => throw Exception(error),
      (value) => value,
    );
  }
}
