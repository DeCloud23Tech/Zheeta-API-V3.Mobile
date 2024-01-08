import 'package:injectable/injectable.dart';
import 'package:zheeta/authentication/data/request/verify_email_otp_request.dart';
import 'package:zheeta/authentication/data/request/verify_phone_otp_request.dart';
import 'package:zheeta/authentication/domain/repository/user_otp_repository.dart';
import 'package:zheeta/authentication/domain/usecase/user_otp_usecase.dart';

@prod
@LazySingleton(as: UserOtpUseCase)
class UserOtpUseCaseImpl implements UserOtpUseCase {
  final UserOtpRepository _repository;
  UserOtpUseCaseImpl(this._repository);

  @override
  resetPasswordUsecase(String phoneNumber) {
    return _repository.resetPasswordRepo(phoneNumber);
  }

  @override
  sendEmailVerifyOtpUsecase(String email) {
    return _repository.sendEmailVerifyOtpRepo(email);
  }

  @override
  sendPhoneVerifyOtpUsecase(String phoneNumber) {
    return _repository.sendPhoneVerifyOtpRepo(phoneNumber);
  }

  @override
  sendResetPasswordOtpUsecase(String phoneNumber) {
    return _repository.sendResetPasswordOtpRepo(phoneNumber);
  }

  @override
  verifyEmailOtpUsecase(VerifyEmailOtpRequest request) {
    return _repository.verifyEmailOtpRepo(request);
  }

  @override
  verifyPhoneOtpUsecase(VerifyPhoneOtpRequest request) {
    return _repository.verifyPhoneOtpRepo(request);
  }
}
