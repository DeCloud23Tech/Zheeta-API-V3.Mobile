import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:zheeta/authentication/data/model/login_user_model.dart';
import 'package:zheeta/authentication/data/model/register_user_model.dart';
import 'package:zheeta/authentication/presentation/state/state.dart';

part 'user_auth_state.freezed.dart';

@freezed
class UserAuthState with _$UserAuthState {
  factory UserAuthState({
    required State<RegisterUserModel> registerUserState,
    required State<LoginUserModel> loginUserState,
    required State registerStaffState,
    required State changePasswordState,
    required State resetPasswordState,
    required State loginOAuthState,
  }) = _UserAuthState;

  UserAuthState._();

  UserAuthState setRegisterUserState(State<RegisterUserModel> state) => copyWith(registerUserState: state);
  UserAuthState setLoginUserState(State<LoginUserModel> state) => copyWith(loginUserState: state);
  UserAuthState setRegisterStaffState(State state) => copyWith(registerStaffState: state);
  UserAuthState setChangePasswordState(State state) => copyWith(changePasswordState: state);
  UserAuthState setResetPasswordState(State state) => copyWith(resetPasswordState: state);
  UserAuthState setLoginOAuthState(State state) => copyWith(loginOAuthState: state);
}
