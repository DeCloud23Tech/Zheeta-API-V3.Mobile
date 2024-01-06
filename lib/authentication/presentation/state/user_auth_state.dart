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

  UserAuthState setRegisterUser(State<RegisterUserModel> state) => copyWith(registerUserState: state);
  UserAuthState setLoginUser(State<LoginUserModel> state) => copyWith(loginUserState: state);
  UserAuthState setRegisterStaff(State state) => copyWith(registerStaffState: state);
  UserAuthState setChangePassword(State state) => copyWith(changePasswordState: state);
  UserAuthState setResetPassword(State state) => copyWith(resetPasswordState: state);
  UserAuthState setLoginOAuth(State state) => copyWith(loginOAuthState: state);
}
