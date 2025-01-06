import 'package:injectable/injectable.dart';
import 'package:zheeta/app/common/type_def.dart';
import 'package:zheeta/app/common/usecase/usecases.dart';
import 'package:zheeta/authentication/data/model/country_detail_model.dart';
import 'package:zheeta/authentication/data/model/country_model.dart';
import 'package:zheeta/authentication/data/request/user_roles_request.dart';
import 'package:zheeta/authentication/domain/repository/country_repository.dart';
import 'package:zheeta/authentication/domain/repository/identity_role_repository.dart';

@prod
@LazySingleton()
class UpgradeUserRole extends UsecaseWithParams<void, UserRoleRequest> {
  const UpgradeUserRole(this._repo);

  final IdentityRoleRepository _repo;

  @override
  ResultVoid call(UserRoleRequest params) async =>
      await _repo.upgradeUserRoleRepo(params);
}

@prod
@LazySingleton()
class DowngradeUserRole extends UsecaseWithParams<void, UserRoleRequest> {
  const DowngradeUserRole(this._repo);

  final IdentityRoleRepository _repo;

  @override
  ResultVoid call(UserRoleRequest params) async =>
      await _repo.downgradeUserRoleRepo(params);
}
