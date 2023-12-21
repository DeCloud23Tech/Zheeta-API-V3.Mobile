import 'package:zheeta/authentication/data/request/user_roles_request.dart';

abstract class IdentityRoleRepository {
  upgradeUserRoleRepo(UserRoleRequest request);
  downgradeUserRoleRepo(UserRoleRequest request);
}
