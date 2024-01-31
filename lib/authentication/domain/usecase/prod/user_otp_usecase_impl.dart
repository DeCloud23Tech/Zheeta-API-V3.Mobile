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
  sendEmailVerifyOtpUsecase(String email) {
    _repository.sendEmailVerifyOtpRepo(email);
  }

  @override
  sendPhoneVerifyOtpUsecase(String phoneNumber) {
    _repository.sendPhoneVerifyOtpRepo(phoneNumber);
  }

  @override
  sendPasswordResetOtpUsecase(String email) {
    _repository.sendPasswordResetOtpRepo(email);
  }

  @override
  verifyEmailOtpUsecase(VerifyEmailOtpRequest request) {
    _repository.verifyEmailOtpRepo(request);
  }

  @override
  verifyPhoneOtpUsecase(VerifyPhoneOtpRequest request) {
    _repository.verifyPhoneOtpRepo(request);
  }
}
