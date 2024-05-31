import 'package:zheeta/app/common/type_def.dart';
import 'package:zheeta/authentication/data/model/login_user_model.dart';
import 'package:zheeta/authentication/data/model/register_user_model.dart';
import 'package:zheeta/authentication/data/request/change_password_request.dart';
import 'package:zheeta/authentication/data/request/login_oauth_request.dart';
import 'package:zheeta/authentication/data/request/login_request.dart';
import 'package:zheeta/authentication/data/request/refresh_token_request.dart';
import 'package:zheeta/authentication/data/request/register_staff_request.dart';
import 'package:zheeta/authentication/data/request/register_user_request.dart';
import 'package:zheeta/authentication/data/request/reset_password_request.dart';

abstract class UserAuthRepository {
  ResultFuture<RegisterUserModel> registerUserRepo(RegisterUserRequest data);
  ResultFuture<LoginUserModel> loginRepo(LoginRequest data);
  ResultVoid registerStaffRepo(RegisterStaffRequest data);
  ResultVoid changePasswordRepo(ChangePasswordRequest data);
  ResultVoid resetPasswordRepo(ResetPasswordRequest data);
  ResultVoid loginOAuthRepo(LoginOAuthRequest data);
  ResultFuture<LoginUserModel> refreshToken(RefreshTokenRequest data);
}
