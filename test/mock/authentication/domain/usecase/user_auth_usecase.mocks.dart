// Mocks generated by Mockito 5.4.4 from annotations
// in zheeta/test/mock/authentication/domain/usecase/user_auth_usecase.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i5;

import 'package:mockito/mockito.dart' as _i1;
import 'package:zheeta/authentication/data/model/login_user_model.dart' as _i3;
import 'package:zheeta/authentication/data/model/register_user_model.dart'
    as _i2;
import 'package:zheeta/authentication/data/request/change_password_request.dart'
    as _i9;
import 'package:zheeta/authentication/data/request/login_oauth_request.dart'
    as _i11;
import 'package:zheeta/authentication/data/request/login_request.dart' as _i7;
import 'package:zheeta/authentication/data/request/register_staff_request.dart'
    as _i8;
import 'package:zheeta/authentication/data/request/register_user_request.dart'
    as _i6;
import 'package:zheeta/authentication/data/request/reset_password_request.dart'
    as _i10;
import 'package:zheeta/authentication/domain/usecase/user_auth_usecase.dart'
    as _i4;

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

class _FakeRegisterUserModel_0 extends _i1.SmartFake
    implements _i2.RegisterUserModel {
  _FakeRegisterUserModel_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeLoginUserModel_1 extends _i1.SmartFake
    implements _i3.LoginUserModel {
  _FakeLoginUserModel_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [UserAuthUsecase].
///
/// See the documentation for Mockito's code generation for more information.
class MockUserAuthUsecase extends _i1.Mock implements _i4.UserAuthUsecase {
  MockUserAuthUsecase() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i5.Future<_i2.RegisterUserModel> registerUserUsecase(
          _i6.RegisterUserRequest? data) =>
      (super.noSuchMethod(
        Invocation.method(
          #registerUserUsecase,
          [data],
        ),
        returnValue:
            _i5.Future<_i2.RegisterUserModel>.value(_FakeRegisterUserModel_0(
          this,
          Invocation.method(
            #registerUserUsecase,
            [data],
          ),
        )),
      ) as _i5.Future<_i2.RegisterUserModel>);

  @override
  _i5.Future<_i3.LoginUserModel> loginUsecase(_i7.LoginRequest? data) =>
      (super.noSuchMethod(
        Invocation.method(
          #loginUsecase,
          [data],
        ),
        returnValue: _i5.Future<_i3.LoginUserModel>.value(_FakeLoginUserModel_1(
          this,
          Invocation.method(
            #loginUsecase,
            [data],
          ),
        )),
      ) as _i5.Future<_i3.LoginUserModel>);

  @override
  dynamic registerStaffUsecase(_i8.RegisterStaffRequest? data) =>
      super.noSuchMethod(Invocation.method(
        #registerStaffUsecase,
        [data],
      ));

  @override
  dynamic changePasswordUsecase(_i9.ChangePasswordRequest? data) =>
      super.noSuchMethod(Invocation.method(
        #changePasswordUsecase,
        [data],
      ));

  @override
  dynamic resetPasswordUsecase(_i10.ResetPasswordRequest? data) =>
      super.noSuchMethod(Invocation.method(
        #resetPasswordUsecase,
        [data],
      ));

  @override
  dynamic loginOAuthUsecase(_i11.LoginOAuthRequest? data) =>
      super.noSuchMethod(Invocation.method(
        #loginOAuthUsecase,
        [data],
      ));
}
