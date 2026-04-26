import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:zheeta/core/common/model/login_user_model.dart';
import 'package:zheeta/core/common/model/register_user_model.dart';
import 'package:zheeta/core/error/error.dart';
import 'package:zheeta/features/authentication/data/requests/change_password_request.dart';
import 'package:zheeta/features/authentication/data/requests/login_request.dart';
import 'package:zheeta/features/authentication/data/requests/register_user_request.dart';
import 'package:zheeta/features/authentication/data/requests/reset_password_request.dart';
import 'package:zheeta/features/authentication/data/requests/verify_otp_request.dart';
import 'package:zheeta/features/authentication/domain/usecases/user_auth/user_auth_usecases.dart';
import 'package:zheeta/features/authentication/domain/usecases/user_otp/user_otp_usecases.dart';
import 'package:zheeta/router/app_router.dart';
import 'package:zheeta/router/app_router.gr.dart';

part 'authentication_state.dart';

@prod
@LazySingleton()
class AuthenticationCubit extends Cubit<AuthenticationState> {
  final RegisterUser registerUser;
  final LoginUser loginUser;
  final ChangePassword changePassword;
  final ResetPassword resetPassword;
  // final LoginOAuth loginOAuth;
  final SendPasswordResetOtp sendPasswordResetOtp;
  final SendEmailVerifyOtp sendEmailVerifyOtp;
  final SendPhoneVerifyOtp sendPhoneVerifyOtp;
  final VerifyPhoneOtp verifyPhoneOtp;
  final VerifyEmailOtp verifyEmailOtp;

  AuthenticationCubit({
    required this.registerUser,
    required this.loginUser,
    required this.changePassword,
    required this.resetPassword,
    // required this.loginOAuth,
    required this.sendPasswordResetOtp,
    required this.sendEmailVerifyOtp,
    required this.sendPhoneVerifyOtp,
    required this.verifyPhoneOtp,
    required this.verifyEmailOtp,
  }) : super(AuthenticationInitialState());

  Future<void> loginUserCubit({required LoginRequest request}) async {
    emit(AuthenticationLoadingState());
    var result = await loginUser(request);

    result.fold(
      (fail) {
        emit(AuthenticationErrorState(fail.message));
        if (fail is EmailVeirifedError) {
          router.popAndPush(VerificationRoute(
            isPhoneNumber: false,
            phoneNumber: fail.phoneNumber ?? '',
            email: fail.email ?? '',
          ));
        }
      },
      (success) {
        emit(AuthenticationLoggedInState(success));
      },
    );
  }

  Future<void> registerUserCubit({required RegisterUserRequest request}) async {
    emit(AuthenticationLoadingState());
    var result = await registerUser(request);
    result.fold(
      (fail) => emit(AuthenticationErrorState(fail.message)),
      (success) async {
        emit(AuthenticationRegisteredState(success));
      },
    );
  }

  Future<bool> verifyPhoneOtpCubit({required VerifyOtpRequest request}) async {
    emit(AuthenticationLoadingState());
    var result = await verifyPhoneOtp(request);
    bool sendResult = false;
    result.fold(
      (fail) {
        emit(AuthenticationErrorState(fail.message));
        sendResult = false;
      },
      (success) {
        emit(AuthenticationVerifiedPhoneOtpState());
        sendResult = true;
      },
    );

    return sendResult;
  }

  Future<bool> verifyEmailOtpCubit({required VerifyOtpRequest request}) async {
    emit(AuthenticationLoadingState());
    var result = await verifyEmailOtp(request);
    bool sendResult = false;
    result.fold(
      (fail) {
        emit(AuthenticationErrorState(fail.message));
        sendResult = false;
      },
      (success) {
        emit(AuthenticationVerifiedEmailOtpState());
        sendResult = true;
      },
    );

    return sendResult;
  }

  Future<bool> sendPhoneVerifyOtpCubit({required String phone}) async {
    // emit(AuthenticationLoadingState());
    var result = await sendPhoneVerifyOtp(phone);
    bool sendResult = false;
    result.fold(
      (fail) {
        emit(AuthenticationErrorState(fail.message));
        sendResult = false;
      },
      (success) {
        emit(AuthenticationSentPhoneOtpState());
        sendResult = true;
      },
    );

    return sendResult;
  }

  Future<void> changePasswordCubit(
      {required ChangePasswordRequest request}) async {
    emit(AuthenticationLoadingState());
    var result = await changePassword(request);
    result.fold(
      (fail) => emit(AuthenticationErrorState(fail.message)),
      (success) => emit(AuthenticationChangePasswordState()),
    );
  }

  Future<bool> resetPasswordCubit(
      {required ResetPasswordRequest request}) async {
    emit(AuthenticationLoadingState());
    var result = await resetPassword(request);
    bool sendResult = false;
    result.fold(
      (fail) {
        emit(AuthenticationErrorState(fail.message));
        sendResult = false;
      },
      (success) {
        emit(AuthenticationResetPasswordState());
        sendResult = true;
      },
    );
    return sendResult;
  }

  Future<void> sendResetPasswordCubit({required String email}) async {
    emit(AuthenticationLoadingState());
    var result = await sendPasswordResetOtp(email);
    result.fold(
      (fail) => emit(AuthenticationErrorState(fail.message)),
      (success) => emit(AuthenticationSentResetPasswordState()),
    );
  }

  Future<bool> sendEmailVerifyOtpCubit({required String email}) async {
    // emit(AuthenticationLoadingState());
    var result = await sendEmailVerifyOtp(email);
    bool sendResult = false;
    result.fold(
      (fail) {
        emit(AuthenticationErrorState(fail.message));
        sendResult = false;
      },
      (success) {
        emit(AuthenticationSentEmailOtpState());
        sendResult = true;
      },
    );
    return sendResult;
  }
}
