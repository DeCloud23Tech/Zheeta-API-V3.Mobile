// Mocks generated by Mockito 5.4.4 from annotations
// in zheeta/test/mock/authentication/domain/repository/identity_role_repository.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:mockito/mockito.dart' as _i1;
import 'package:zheeta/authentication/data/request/user_roles_request.dart'
    as _i3;
import 'package:zheeta/authentication/domain/repository/identity_role_repository.dart'
    as _i2;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

/// A class which mocks [IdentityRoleRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockIdentityRoleRepository extends _i1.Mock
    implements _i2.IdentityRoleRepository {
  MockIdentityRoleRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  dynamic upgradeUserRoleRepo(_i3.UserRoleRequest? request) =>
      super.noSuchMethod(Invocation.method(
        #upgradeUserRoleRepo,
        [request],
      ));

  @override
  dynamic downgradeUserRoleRepo(_i3.UserRoleRequest? request) =>
      super.noSuchMethod(Invocation.method(
        #downgradeUserRoleRepo,
        [request],
      ));
}
