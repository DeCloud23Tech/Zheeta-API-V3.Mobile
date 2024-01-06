import 'package:zheeta/authentication/data/model/login_user_model.dart';
import 'package:zheeta/authentication/data/model/register_user_model.dart';
import 'package:zheeta/authentication/data/request/change_password_request.dart';
import 'package:zheeta/authentication/data/request/login_oauth_request.dart';
import 'package:zheeta/authentication/data/request/login_request.dart';
import 'package:zheeta/authentication/data/request/register_staff_request.dart';
import 'package:zheeta/authentication/data/request/register_user_request.dart';
import 'package:zheeta/authentication/data/request/reset_password_request.dart';

abstract class UserAuthRepository {
  Future<RegisterUserModel> registerUserRepo(RegisterUserRequest data);
  Future<LoginUserModel> loginRepo(LoginRequest data);
  registerStaffRepo(RegisterStaffRequest data);
  changePasswordRepo(ChangePasswordRequest data);
  resetPasswordRepo(ResetPasswordRequest data);
  loginOAuthRepo(LoginOAuthRequest data);
}
