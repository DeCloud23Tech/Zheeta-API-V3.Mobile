import 'package:dartz/dartz.dart';
import 'package:zheeta/authentication/data/request/change_password_request.dart';
import 'package:zheeta/authentication/data/request/login_oauth_request.dart';
import 'package:zheeta/authentication/data/request/register_staff_request.dart';
import 'package:zheeta/authentication/data/request/register_user_request.dart';
import 'package:zheeta/authentication/data/request/reset_password_request.dart';
import 'package:zheeta/authentication/domain/entity/types.dart';
import 'package:zheeta/models/login_model.dart';

abstract class UserAuthDatasource {
  Future<Either<Error, MappedResponse>> registerUser(RegisterUserRequest request);
  Future<Either<Error, MappedResponse>> login(LoginRequest request);
  Future<Either<Error, MappedResponse>> registerStaff(RegisterStaffRequest request);
  Future<Either<Error, MappedResponse>> changePassword(ChangePasswordRequest request);
  Future<Either<Error, MappedResponse>> resetPassword(ResetPasswordRequest request);
  Future<Either<Error, MappedResponse>> loginOAuth(LoginOAuthRequest request);
}
