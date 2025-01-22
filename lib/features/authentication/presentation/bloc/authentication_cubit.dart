import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:zheeta/common/model/login_user_model.dart';
import 'package:zheeta/features/authentication/data/request/login_request.dart';
import 'package:zheeta/features/authentication/domain/usecase/user_auth/user_auth_usecases.dart';
part 'authentication_state.dart';

@prod
@LazySingleton()
class AuthenticationCubit extends Cubit<AuthenticationState> {
  // final GetAllCountries getAllCountries;
  // final GetCountryDetails getCountryDetails;
  // // final UpgradeUserRole upgradeUserRole;
  // // final DowngradeUserRole downgradeUserRole;
  // final RegisterUser registerUser;
  final LoginUser loginUser;
  // final RegisterStaff registerStaff;
  // final ChangePassword changePassword;
  // final ResetPassword resetPassword;
  // final LoginOAuth loginOAuth;
  // final SendPasswordResetOtp sendPasswordResetOtp;
  // final SendEmailVerifyOtp sendEmailVerifyOtp;
  // final SendPhoneVerifyOtp sendPhoneVerifyOtp;
  // final VerifyPhoneOtp verifyPhoneOtp;
  // final VerifyEmailOtp verifyEmailOtp;

  AuthenticationCubit(
      {
    // required this.getAllCountries,
    // required this.getCountryDetails,
    // // required this.upgradeUserRole,
    // // required this.downgradeUserRole,
    // required this.registerUser,
    required this.loginUser,
    // required this.registerStaff,
    // required this.changePassword,
    // required this.resetPassword,
    // required this.loginOAuth,
    // required this.sendPasswordResetOtp,
    // required this.sendEmailVerifyOtp,
    // required this.sendPhoneVerifyOtp,
    // required this.verifyPhoneOtp,
    // required this.verifyEmailOtp,
  }) : super(AuthenticationInitialState());

  Future<void> loginUserCubit({required LoginRequest request}) async {
    emit(AuthenticationLoadingState());
    var result = await loginUser(request);
    result.fold(
          (fail) => emit(AuthenticationErrorState(fail.message)),
          (success) {
        emit(AuthenticationLoggedInState(success));
      },
    );
  }
}
