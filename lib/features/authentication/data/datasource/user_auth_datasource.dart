import 'package:zheeta/common/model/login_user_model.dart';
import 'package:zheeta/features/authentication/data/model/register_user_model.dart';
import 'package:zheeta/features/authentication/data/request/change_password_request.dart';
import 'package:zheeta/features/authentication/data/request/login_oauth_request.dart';
import 'package:zheeta/features/authentication/data/request/login_request.dart';
import 'package:zheeta/features/authentication/data/request/refresh_token_request.dart';
import 'package:zheeta/features/authentication/data/request/register_staff_request.dart';
import 'package:zheeta/features/authentication/data/request/register_user_request.dart';
import 'package:zheeta/features/authentication/data/request/reset_password_request.dart';

abstract class UserAuthDataSource {
  Future<RegisterUserModel> registerUserNew(RegisterUserRequest request);

  Future<void> changePasswordNew(ChangePasswordRequest request);

  Future<void> loginOAuthNew(LoginOAuthRequest request);

  Future<LoginUserModel> loginNew(LoginRequest request);

  Future<void> resetPasswordNew(ResetPasswordRequest request);

  Future<void> registerStaffNew(RegisterStaffRequest request);

  Future<LoginUserModel> refreshToken(RefreshTokenRequest request);
}
