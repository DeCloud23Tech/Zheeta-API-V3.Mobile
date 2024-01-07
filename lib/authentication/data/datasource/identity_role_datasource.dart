import 'package:dartz/dartz.dart';
import 'package:zheeta/authentication/data/request/user_roles_request.dart';
import 'package:zheeta/authentication/domain/entity/types.dart';

abstract class IdentityRoleDataSource {
  Future<Either<Error, MappedResponse>> upgradeUserRole(UserRoleRequest request);
  Future<Either<Error, MappedResponse>> downgradeUserRole(UserRoleRequest request);
}
