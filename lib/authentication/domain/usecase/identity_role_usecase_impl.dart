import 'package:injectable/injectable.dart';
import 'package:zheeta/authentication/data/request/user_roles_request.dart';
import 'package:zheeta/authentication/domain/repository/identity_role_repository.dart';
import 'package:zheeta/authentication/domain/usecase/identity_role_usecase.dart';

@prod
@LazySingleton(as: IdentityRoleUsecase)
class IdentityRoleUsecaseImpl implements IdentityRoleUsecase {
  final IdentityRoleRepository _repository;
  IdentityRoleUsecaseImpl(this._repository);

  @override
  downgradeUserRoleUsecase(UserRoleRequest request) {
    return _repository.downgradeUserRoleRepo(request);
  }

  @override
  upgradeUserRoleUsecase(UserRoleRequest request) {
    return _repository.upgradeUserRoleRepo(request);
  }
}
