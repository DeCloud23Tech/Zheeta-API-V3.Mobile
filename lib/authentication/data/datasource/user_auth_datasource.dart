import 'package:dartz/dartz.dart';
import 'package:zheeta/authentication/data/request/change_password_request.dart';
import 'package:zheeta/authentication/data/request/login_oauth_request.dart';
import 'package:zheeta/authentication/data/request/login_request.dart';
import 'package:zheeta/authentication/data/request/register_staff_request.dart';
import 'package:zheeta/authentication/data/request/register_user_request.dart';
import 'package:zheeta/authentication/data/request/reset_password_request.dart';
import 'package:zheeta/authentication/domain/entity/types.dart';

abstract class UserAuthDataSource {
  Future<Either<ErrorResponse, MappedResponse>> registerUser(RegisterUserRequest request);
  Future<Either<ErrorResponse, MappedResponse>> login(LoginRequest request);
  Future<Either<ErrorResponse, MappedResponse>> registerStaff(RegisterStaffRequest request);
  Future<Either<ErrorResponse, MappedResponse>> changePassword(ChangePasswordRequest request);
  Future<Either<ErrorResponse, MappedResponse>> resetPassword(ResetPasswordRequest request);
  Future<Either<ErrorResponse, MappedResponse>> loginOAuth(LoginOAuthRequest request);
}
