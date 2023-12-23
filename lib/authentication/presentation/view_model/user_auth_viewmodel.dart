import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl_phone_field/phone_number.dart';
import 'package:zheeta/app/injection/di.dart';
import 'package:zheeta/app/notify/notify_user.dart';
import 'package:zheeta/app/router/app_router.dart';
import 'package:zheeta/app/router/app_router.gr.dart';
import 'package:zheeta/app/validation_helper.dart';
import 'package:zheeta/authentication/data/request/login_request.dart';
import 'package:zheeta/authentication/data/request/register_user_request.dart';
import 'package:zheeta/authentication/domain/usecase/user_auth_usecase.dart';
import 'package:zheeta/authentication/presentation/state/state.dart';
import 'package:zheeta/authentication/presentation/state/user_auth_state.dart';

final userAuthViewModelProvider = StateNotifierProvider.autoDispose<UserAuthViewModel, UserAuthState>((ref) {
  final authUsecase = locator<UserAuthUsecase>();
  return UserAuthViewModel(authUsecase);
});

class UserAuthViewModel extends StateNotifier<UserAuthState> with ValidationHelperMixin {
  final UserAuthUsecase _authUsecase;
  UserAuthViewModel(this._authUsecase)
      : super(
          UserAuthState(
            registerUser: State.init(),
            loginUser: State.init(),
            registerStaff: State.init(),
            changePassword: State.init(),
            resetPassword: State.init(),
            loginOAuth: State.init(),
          ),
        );

  String _username = '';
  String _identity = '';
  String _password = '';
  String _retypePassword = '';
  String _email = '';
  PhoneNumber _phoneNumber = PhoneNumber(countryISOCode: '+234', countryCode: 'NG', number: '');
  String _referral = '';
  bool _agree = false;
  String _userDeviceToken = '*******';

  setUsername(String value) => _username = value;
  setIdentity(String value) => _identity = value;
  setPassword(String value) => _password = value;
  setRetypePassword(String value) => _retypePassword = value;
  setEmail(String value) => _email = value;
  setPhoneNumber(PhoneNumber value) => _phoneNumber = value;
  setReferral(String value) => _referral = value;
  setAgree(bool value) => _agree = value;
  setUserDeviceToken(String value) => _userDeviceToken = value;

  PhoneNumber get getPhoneNumber => _phoneNumber;
  String get getEmail => _email;

  String? validateUsername() => this.isValidInput(_username);
  String? validateIdentity() => this.isValidInput(_identity);
  String? validatePassword() => this.isValidPassword(_password);
  String? validateRetypePassword() => _password == _retypePassword ? null : 'Password does not match';
  String? validateEmail() => this.isValidEmail(_email);
  String? validatePhoneNumber() => this.isValidPhoneNumber(_phoneNumber.completeNumber);

  Future<bool> registerUser() async {
    state = state.setRegisterUser(State.loading());

    if (_agree) {
      try {
        final data = RegisterUserRequest(
          userName: _username,
          password: _password,
          email: _email,
          phoneNumber: _phoneNumber.completeNumber,
          phoneCountryCode: _phoneNumber.countryISOCode,
          referralCode: _referral,
        );
        final result = await _authUsecase.registerUserUsecase(data);
        state = state.setRegisterUser(State.success(result));

        // Navigate to verification screen
        router.popAndPush(VerificationRoute(identifier: _phoneNumber.completeNumber, isPhoneNumber: true));
        return true;
      } on Exception catch (e) {
        NotifyUser.showToast(e.toString(), true);
        state = state.setRegisterUser(State.error(e));
        return false;
      }
    } else {
      NotifyUser.showToast('Please agree to the terms and conditions', true);
      state = state.setRegisterUser(State.init());
      return false;
    }
  }

  Future<bool> loginUser() async {
    state = state.copyWith(loginUser: State.loading());
    try {
      final data = LoginRequest(_email, _password, _userDeviceToken, 'APNS');
      final result = await _authUsecase.loginUsecase(data);
      state = state.copyWith(loginUser: State.success(result));

      // Navigate to dashboard screen
      router.pushAndPopUntil(HomeRoute(), predicate: (route) => false);
      return true;
    } on Exception catch (e) {
      NotifyUser.showToast(e.toString(), true);
      state = state.copyWith(loginUser: State.error(e));
      return false;
    }
  }

  @override
  void dispose() {
    _username = '';
    _password = '';
    _retypePassword = '';
    _email = '';
    _phoneNumber = PhoneNumber(countryISOCode: '+234', countryCode: 'NG', number: '');
    _referral = '';
    _agree = false;
    _userDeviceToken = '';
    super.dispose();
  }
}
