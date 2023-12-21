import 'package:injectable/injectable.dart';
import 'package:zheeta/authentication/data/request/verify_email_otp_request.dart';
import 'package:zheeta/authentication/data/request/verify_phone_otp_request.dart';
import 'package:zheeta/authentication/domain/repository/user_otp_repository.dart';
import 'package:zheeta/authentication/domain/usecase/user_otp_usecase.dart';

@prod
@LazySingleton(as: UserOtpUsecase)
class UserOtpUsecaseImpl implements UserOtpUsecase {
  final UserOtpRepository _repository;
  UserOtpUsecaseImpl(this._repository);

  @override
  resetPasswordUsecase(String phoneNumber) async {
    return await _repository.resetPasswordRepo(phoneNumber);
  }

  @override
  sendEmailVerifyOtpUsecase(String email) async {
    return await _repository.sendEmailVerifyOtpRepo(email);
  }

  @override
  sendPhoneVerifyOtpUsecase(String phoneNumber) async {
    return await _repository.sendPhoneVerifyOtpRepo(phoneNumber);
  }

  @override
  sendResetPasswordOtpUsecase(String phoneNumber) async {
    return await _repository.sendResetPasswordOtpRepo(phoneNumber);
  }

  @override
  verifyEmailOtpUsecase(VerifyEmailOtpRequest request) async {
    return await _repository.verifyEmailOtpRepo(request);
  }

  @override
  verifyPhoneOtpUsecase(VerifyPhoneOtpRequest request) async {
    return await _repository.verifyPhoneOtpRepo(request);
  }
}
