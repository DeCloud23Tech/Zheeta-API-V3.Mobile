import 'package:zheeta/authentication/data/request/user_roles_request.dart';

abstract class IdentityRoleUseCase {
  upgradeUserRoleUsecase(UserRoleRequest request);
  downgradeUserRoleUsecase(UserRoleRequest request);
}
