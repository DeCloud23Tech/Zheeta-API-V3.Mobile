import 'package:zheeta/authentication/data/model/login_user_model.dart';
import 'package:zheeta/authentication/data/model/register_user_model.dart';
import 'package:zheeta/authentication/data/request/change_password_request.dart';
import 'package:zheeta/authentication/data/request/login_oauth_request.dart';
import 'package:zheeta/authentication/data/request/login_request.dart';
import 'package:zheeta/authentication/data/request/register_staff_request.dart';
import 'package:zheeta/authentication/data/request/register_user_request.dart';
import 'package:zheeta/authentication/data/request/reset_password_request.dart';

abstract class UserAuthUseCase {
  Future<RegisterUserModel> registerUserUsecase(RegisterUserRequest data);
  Future<LoginUserModel> loginUsecase(LoginRequest data);
  registerStaffUsecase(RegisterStaffRequest data);
  changePasswordUsecase(ChangePasswordRequest data);
  resetPasswordUsecase(ResetPasswordRequest data);
  loginOAuthUsecase(LoginOAuthRequest data);
}
