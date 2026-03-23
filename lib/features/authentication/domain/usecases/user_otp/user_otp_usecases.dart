import 'package:injectable/injectable.dart';
import 'package:zheeta/core/common/usecase/usecases.dart';
import 'package:zheeta/core/constants/type_def.dart';
import 'package:zheeta/features/authentication/data/requests/verify_email_otp_request.dart';
import 'package:zheeta/features/authentication/data/requests/verify_otp_request.dart';
import 'package:zheeta/features/authentication/data/requests/verify_phone_otp_request.dart';
import 'package:zheeta/features/authentication/domain/repositories/user_otp_repository.dart';

@prod
@LazySingleton()
class SendEmailVerifyOtp extends UsecaseWithParams<void, String> {
  const SendEmailVerifyOtp(this._repo);

  final IUserOtpRepository _repo;

  @override
  ResultVoid call(String params) async =>
      await _repo.sendEmailVerifyOtpRepo(params);
}

@prod
@LazySingleton()
class SendPhoneVerifyOtp extends UsecaseWithParams<void, String> {
  const SendPhoneVerifyOtp(this._repo);

  final IUserOtpRepository _repo;

  @override
  ResultVoid call(String params) async =>
      await _repo.sendPhoneVerifyOtpRepo(params);
}

@prod
@LazySingleton()
class SendPasswordResetOtp extends UsecaseWithParams<void, String> {
  const SendPasswordResetOtp(this._repo);

  final IUserOtpRepository _repo;

  @override
  ResultVoid call(String params) async =>
      await _repo.sendPasswordResetOtpRepo(params);
}

@prod
@LazySingleton()
class VerifyPhoneOtp extends UsecaseWithParams<void, VerifyOtpRequest> {
  const VerifyPhoneOtp(this._repo);

  final IUserOtpRepository _repo;

  @override
  ResultVoid call(VerifyOtpRequest params) async =>
      await _repo.verifyPhoneOtpRepo(params);
}

@prod
@LazySingleton()
class VerifyEmailOtp extends UsecaseWithParams<void, VerifyOtpRequest> {
  const VerifyEmailOtp(this._repo);

  final IUserOtpRepository _repo;

  @override
  ResultVoid call(VerifyOtpRequest params) async =>
      await _repo.verifyEmailOtpRepo(params);
}
