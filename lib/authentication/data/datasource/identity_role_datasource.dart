import 'package:dartz/dartz.dart';
import 'package:zheeta/authentication/data/request/user_roles_request.dart';
import 'package:zheeta/authentication/domain/entity/types.dart';

abstract class IdentityRoleDataSource {
  Future<Either<ErrorResponse, MappedResponse>> upgradeUserRole(
      UserRoleRequest request);
  Future<Either<ErrorResponse, MappedResponse>> downgradeUserRole(
      UserRoleRequest request);

  Future<void> upgradeUserRoleNew(UserRoleRequest request);
  Future<void> downgradeUserRoleNew(UserRoleRequest request);
}
