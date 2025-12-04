import 'package:zheeta/core/common/model/login_user_model.dart';
import 'package:zheeta/core/common/model/register_user_model.dart';
import 'package:zheeta/features/authentication/data/requests/change_password_request.dart';
import 'package:zheeta/features/authentication/data/requests/login_oauth_request.dart';
import 'package:zheeta/features/authentication/data/requests/login_request.dart';
import 'package:zheeta/features/authentication/data/requests/refresh_token_request.dart';
import 'package:zheeta/features/authentication/data/requests/register_staff_request.dart';
import 'package:zheeta/features/authentication/data/requests/register_user_request.dart';
import 'package:zheeta/features/authentication/data/requests/reset_password_request.dart';

abstract class IUserAuthDataSource {
  Future<RegisterUserModel> registerUserNew(RegisterUserRequest request);

  Future<void> changePasswordNew(ChangePasswordRequest request);

  Future<void> loginOAuthNew(LoginOAuthRequest request);

  Future<LoginUserModel> loginNew(LoginRequest request);

  Future<void> resetPasswordNew(ResetPasswordRequest request);

  Future<void> registerStaffNew(RegisterStaffRequest request);

  Future<LoginUserModel> refreshToken(RefreshTokenRequest request);
}
