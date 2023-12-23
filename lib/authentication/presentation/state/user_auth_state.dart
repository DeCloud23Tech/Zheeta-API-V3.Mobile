import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:zheeta/authentication/data/model/register_user_model.dart';
import 'package:zheeta/authentication/presentation/state/state.dart';

part 'user_auth_state.freezed.dart';

@freezed
class UserAuthState with _$UserAuthState {
  factory UserAuthState({
    required State<RegisterUserModel> registerUser,
    required State loginUser,
    required State registerStaff,
    required State changePassword,
    required State resetPassword,
    required State loginOAuth,
  }) = _UserAuthState;

  UserAuthState._();

  UserAuthState setRegisterUser(State<RegisterUserModel> state) => copyWith(registerUser: state);
  UserAuthState setLoginUser(State state) => copyWith(loginUser: state);
  UserAuthState setRegisterStaff(State state) => copyWith(registerStaff: state);
  UserAuthState setChangePassword(State state) => copyWith(changePassword: state);
  UserAuthState setResetPassword(State state) => copyWith(resetPassword: state);
  UserAuthState setLoginOAuth(State state) => copyWith(loginOAuth: state);
}
