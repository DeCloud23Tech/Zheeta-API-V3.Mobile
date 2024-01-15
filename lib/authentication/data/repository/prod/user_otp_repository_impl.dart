import 'package:injectable/injectable.dart';
import 'package:zheeta/authentication/data/datasource/user_otp_datasource.dart';
import 'package:zheeta/authentication/data/request/verify_email_otp_request.dart';
import 'package:zheeta/authentication/data/request/verify_phone_otp_request.dart';
import 'package:zheeta/authentication/domain/repository/user_otp_repository.dart';

@prod
@LazySingleton(as: UserOtpRepository)
class UserOtpRepositoryImpl implements UserOtpRepository {
  final UserOtpDataSource _datasource;
  UserOtpRepositoryImpl(this._datasource);

  sendEmailVerifyOtpRepo(String email) async {
    final result = await _datasource.sendEmailVerifyOtp(email);
    result.fold(
      (error) => throw Exception(error),
      (value) => value,
    );
  }

  sendPhoneVerifyOtpRepo(String phoneNumber) async {
    final result = await _datasource.sendPhoneVerifyOtp(phoneNumber);
    result.fold(
      (error) => throw Exception(error),
      (value) => value,
    );
  }

  verifyPhoneOtpRepo(VerifyPhoneOtpRequest request) async {
    final result = await _datasource.verifyPhoneOtp(request);
    result.fold(
      (error) => throw Exception(error),
      (value) => value,
    );
  }

  verifyEmailOtpRepo(VerifyEmailOtpRequest request) async {
    final result = await _datasource.verifyEmailOtp(request);
    result.fold(
      (error) => throw Exception(error),
      (value) => value,
    );
  }

  sendPasswordResetOtpRepo(String email) async {
    final result = await _datasource.sendPasswordResetOtp(email);
    result.fold(
      (error) => throw Exception(error),
      (value) => value,
    );
  }

  resetPasswordRepo(String phoneNumber) async {
    final result = await _datasource.resetPassword(phoneNumber);
    result.fold(
      (error) => throw Exception(error),
      (value) => value,
    );
  }
}
