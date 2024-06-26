// Mocks generated by Mockito 5.4.4 from annotations
// in zheeta/test/mock/authentication/data/datasource/identity_role_datasource.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:dartz/dartz.dart' as _i2;
import 'package:mockito/mockito.dart' as _i1;
import 'package:zheeta/app/api/formatted_response.dart' as _i5;
import 'package:zheeta/authentication/data/datasource/identity_role_datasource.dart'
    as _i3;
import 'package:zheeta/authentication/data/request/user_roles_request.dart'
    as _i6;

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

class _FakeEither_0<L, R> extends _i1.SmartFake implements _i2.Either<L, R> {
  _FakeEither_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [IdentityRoleDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockIdentityRoleDataSource extends _i1.Mock
    implements _i3.IdentityRoleDataSource {
  MockIdentityRoleDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<
      _i2.Either<_i5.InvalidResponse, Map<String, dynamic>>> upgradeUserRole(
          _i6.UserRoleRequest? request) =>
      (super.noSuchMethod(
        Invocation.method(
          #upgradeUserRole,
          [request],
        ),
        returnValue: _i4.Future<
                _i2.Either<_i5.InvalidResponse, Map<String, dynamic>>>.value(
            _FakeEither_0<_i5.InvalidResponse, Map<String, dynamic>>(
          this,
          Invocation.method(
            #upgradeUserRole,
            [request],
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.InvalidResponse, Map<String, dynamic>>>);

  @override
  _i4.Future<
      _i2.Either<_i5.InvalidResponse, Map<String, dynamic>>> downgradeUserRole(
          _i6.UserRoleRequest? request) =>
      (super.noSuchMethod(
        Invocation.method(
          #downgradeUserRole,
          [request],
        ),
        returnValue: _i4.Future<
                _i2.Either<_i5.InvalidResponse, Map<String, dynamic>>>.value(
            _FakeEither_0<_i5.InvalidResponse, Map<String, dynamic>>(
          this,
          Invocation.method(
            #downgradeUserRole,
            [request],
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.InvalidResponse, Map<String, dynamic>>>);

  @override
  _i4.Future<void> upgradeUserRoleNew(_i6.UserRoleRequest? request) =>
      (super.noSuchMethod(
        Invocation.method(
          #upgradeUserRoleNew,
          [request],
        ),
        returnValue: _i4.Future<void>.value(),
        returnValueForMissingStub: _i4.Future<void>.value(),
      ) as _i4.Future<void>);

  @override
  _i4.Future<void> downgradeUserRoleNew(_i6.UserRoleRequest? request) =>
      (super.noSuchMethod(
        Invocation.method(
          #downgradeUserRoleNew,
          [request],
        ),
        returnValue: _i4.Future<void>.value(),
        returnValueForMissingStub: _i4.Future<void>.value(),
      ) as _i4.Future<void>);
}
