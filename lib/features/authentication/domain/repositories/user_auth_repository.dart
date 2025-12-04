import 'package:zheeta/core/common/model/login_user_model.dart';
import 'package:zheeta/core/common/model/register_user_model.dart';
import 'package:zheeta/core/constants/type_def.dart';
import 'package:zheeta/features/authentication/data/requests/change_password_request.dart';
import 'package:zheeta/features/authentication/data/requests/login_oauth_request.dart';
import 'package:zheeta/features/authentication/data/requests/login_request.dart';
import 'package:zheeta/features/authentication/data/requests/refresh_token_request.dart';
import 'package:zheeta/features/authentication/data/requests/register_staff_request.dart';
import 'package:zheeta/features/authentication/data/requests/register_user_request.dart';
import 'package:zheeta/features/authentication/data/requests/reset_password_request.dart';

abstract class IUserAuthRepository {
  ResultFuture<RegisterUserModel> registerUserRepo(RegisterUserRequest data);
  ResultFuture<LoginUserModel> loginRepo(LoginRequest data);
  ResultVoid registerStaffRepo(RegisterStaffRequest data);
  ResultVoid changePasswordRepo(ChangePasswordRequest data);
  ResultVoid resetPasswordRepo(ResetPasswordRequest data);
  ResultVoid loginOAuthRepo(LoginOAuthRequest data);
  ResultFuture<LoginUserModel> refreshToken(RefreshTokenRequest data);
}
