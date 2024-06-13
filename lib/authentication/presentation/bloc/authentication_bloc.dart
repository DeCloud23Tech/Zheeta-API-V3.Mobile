import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:zheeta/authentication/data/model/country_detail_model.dart';
import 'package:zheeta/authentication/data/model/country_model.dart';
import 'package:zheeta/authentication/data/model/login_user_model.dart';
import 'package:zheeta/authentication/data/model/register_user_model.dart';
import 'package:zheeta/authentication/data/request/change_password_request.dart';
import 'package:zheeta/authentication/data/request/login_oauth_request.dart';
import 'package:zheeta/authentication/data/request/login_request.dart';
import 'package:zheeta/authentication/data/request/register_staff_request.dart';
import 'package:zheeta/authentication/data/request/register_user_request.dart';
import 'package:zheeta/authentication/data/request/reset_password_request.dart';
import 'package:zheeta/authentication/data/request/user_roles_request.dart';
import 'package:zheeta/authentication/data/request/verify_email_otp_request.dart';
import 'package:zheeta/authentication/data/request/verify_phone_otp_request.dart';
import 'package:zheeta/authentication/domain/usecase/ref_usecase/country/country_usecases.dart';
import 'package:zheeta/authentication/domain/usecase/ref_usecase/identity/identity_usecases.dart';
import 'package:zheeta/authentication/domain/usecase/ref_usecase/user_auth/user_auth_usecases.dart';
import 'package:zheeta/authentication/domain/usecase/ref_usecase/user_otp/user_otp_usecases.dart';

part 'authentication_state.dart';

@prod
@LazySingleton()
class AuthenticationCubit extends Cubit<AuthentcationState> {
  final GetAllCountries getAllCountries;
  final GetCountryDetails getCountryDetails;
  final UpgradeUserRole upgradeUserRole;
  final DowngradeUserRole downgradeUserRole;
  final RegisterUser registerUser;
  final LoginUser loginUser;
  final RegisterStaff registerStaff;
  final ChangePassword changePassword;
  final ResetPassword resetPassword;
  final LoginOAuth loginOAuth;
  final SendPasswordResetOtp sendPasswordResetOtp;
  final SendEmailVerifyOtp sendEmailVerifyOtp;
  final SendPhoneVerifyOtp sendPhoneVerifyOtp;
  final VerifyPhoneOtp verifyPhoneOtp;
  final VerifyEmailOtp verifyEmailOtp;

  AuthenticationCubit({
    required this.getAllCountries,
    required this.getCountryDetails,
    required this.upgradeUserRole,
    required this.downgradeUserRole,
    required this.registerUser,
    required this.loginUser,
    required this.registerStaff,
    required this.changePassword,
    required this.resetPassword,
    required this.loginOAuth,
    required this.sendPasswordResetOtp,
    required this.sendEmailVerifyOtp,
    required this.sendPhoneVerifyOtp,
    required this.verifyPhoneOtp,
    required this.verifyEmailOtp,
  }) : super(AuthenticationInitialState());

  Future<void> getAllCountriesCubit() async {
    emit(AuthenticationLoadingState());
    var result = await getAllCountries();
    result.fold(
      (fail) => emit(AuthenticationErrorState(fail.message)),
      (success) => emit(AuthenticationGotAllCountriesState(success)),
    );
  }

  Future<void> getAllCountryDetailsCubit({required String countryCode}) async {
    emit(AuthenticationLoadingState());
    var result = await getCountryDetails(countryCode);
    result.fold(
      (fail) => emit(AuthenticationErrorState(fail.message)),
      (success) => emit(AuthenticationGotCountryDetailsState(success)),
    );
  }

  Future<void> upgradeUserRoleCubit({required UserRoleRequest request}) async {
    emit(AuthenticationLoadingState());
    var result = await upgradeUserRole(request);
    result.fold(
      (fail) => emit(AuthenticationErrorState(fail.message)),
      (success) => emit(AuthenticationUpgradedUserRoleState()),
    );
  }

  Future<void> downUserRoleCubit({required UserRoleRequest request}) async {
    emit(AuthenticationLoadingState());
    var result = await downgradeUserRole(request);
    result.fold(
      (fail) => emit(AuthenticationErrorState(fail.message)),
      (success) => emit(AuthenticationDowngradedUserRoleState()),
    );
  }

  Future<void> registerUserCubit({required RegisterUserRequest request}) async {
    emit(AuthenticationLoadingState());
    var result = await registerUser(request);
    result.fold(
      (fail) => emit(AuthenticationErrorState(fail.message)),
      (success) => emit(AuthenticationRegisteredState(success)),
    );
  }

  Future<void> loginUserCubit({required LoginRequest request}) async {
    emit(AuthenticationLoadingState());
    var result = await loginUser(request);
    print(result);
    result.fold(
      (fail) => emit(AuthenticationErrorState(fail.message)),
      (success) {
        emit(AuthenticationLoggedInState(success));
      },
    );
  }

  Future<void> registerStaffCubit(
      {required RegisterStaffRequest request}) async {
    emit(AuthenticationLoadingState());
    var result = await registerStaff(request);
    result.fold(
      (fail) => emit(AuthenticationErrorState(fail.message)),
      (success) => emit(AuthenticationRegisteredStaffState()),
    );
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

  Future<void> resetPasswordCubit(
      {required ResetPasswordRequest request}) async {
    emit(AuthenticationLoadingState());
    var result = await resetPassword(request);
    result.fold(
      (fail) => emit(AuthenticationErrorState(fail.message)),
      (success) => emit(AuthenticationResetPasswordState()),
    );
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
    emit(AuthenticationLoadingState());
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

  Future<bool> sendPhoneVerifyOtpCubit({required String phone}) async {
    emit(AuthenticationLoadingState());
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

  Future<bool> verifyPhoneOtpCubit(
      {required VerifyPhoneOtpRequest request}) async {
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

  Future<bool> verifyEmailOtpCubit(
      {required VerifyEmailOtpRequest request}) async {
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

  Future<void> loginOAuthCubit({required LoginOAuthRequest request}) async {
    emit(AuthenticationLoadingState());
    var result = await loginOAuth(request);
    result.fold(
      (fail) => emit(AuthenticationErrorState(fail.message)),
      (success) => emit(AuthenticationLoggedInOAuthState()),
    );
  }
}
