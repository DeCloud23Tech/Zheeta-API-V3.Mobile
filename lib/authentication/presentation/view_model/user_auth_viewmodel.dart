import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl_phone_field/countries.dart';
import 'package:intl_phone_field/phone_number.dart';
import 'package:jwt_decode/jwt_decode.dart';
import 'package:zheeta/app/common/mixins/validation_helper.dart';
import 'package:zheeta/app/common/notify/notify_user.dart';
import 'package:zheeta/app/common/storage/local_storage_impl.dart';
import 'package:zheeta/app/common/storage/storage_keys.dart';
import 'package:zheeta/app/injection/di.dart';
import 'package:zheeta/app/router/app_router.dart';
import 'package:zheeta/app/router/app_router.gr.dart';
import 'package:zheeta/authentication/data/request/login_request.dart';
import 'package:zheeta/authentication/data/request/register_user_request.dart';
import 'package:zheeta/authentication/domain/usecase/user_auth_usecase.dart';
import 'package:zheeta/authentication/presentation/state/state.dart';
import 'package:zheeta/authentication/presentation/state/user_auth_state.dart';
import 'package:zheeta/authentication/presentation/view_model/user_otp_viewmodel.dart';

final userAuthViewModelProvider = StateNotifierProvider.autoDispose<UserAuthViewModel, UserAuthState>((ref) {
  final authUsecase = locator<UserAuthUseCase>();
  return UserAuthViewModel(authUsecase, ref);
});

class UserAuthViewModel extends StateNotifier<UserAuthState> with ValidationHelperMixin {
  final UserAuthUseCase _authUsecase;
  final Ref ref;
  UserAuthViewModel(this._authUsecase, this.ref)
      : super(
          UserAuthState(
            registerUserState: State.init(),
            loginUserState: State.init(),
            registerStaffState: State.init(),
            changePasswordState: State.init(),
            resetPasswordState: State.init(),
            loginOAuthState: State.init(),
          ),
        );

  String _username = '';
  String _password = '';
  String _retypePassword = '';
  String _email = '';
  PhoneNumber _phoneNumber = PhoneNumber(countryISOCode: '+234', countryCode: 'NG', number: '');
  String _referral = '';
  bool _agree = false;
  String _userDeviceToken = '0123456789abcdef0123456789abcdef0123456789abcdef0123456789abcdef';
  String _otp = '';
  String _newPassword = '';

  setUsername(String value) => _username = value;
  setPassword(String value) => _password = value;
  setRetypePassword(String value) => _retypePassword = value;
  setEmail(String value) => _email = value;
  setPhoneNumber(PhoneNumber value) => _phoneNumber = value;
  setCountryCode(Country value) => _phoneNumber.countryCode = '+${value.dialCode}';
  setReferral(String value) => _referral = value;
  setAgree(bool value) => _agree = value;
  setUserDeviceToken(String value) => _userDeviceToken = value;
  setOtp(String value) => _otp = value;
  setNewPassword(String value) => _newPassword = value;

  PhoneNumber get getPhoneNumber => _phoneNumber;
  String get getEmail => _email;

  String? validateUsername() => this.isValidInput(_username);
  String? validatePassword() => this.isValidPassword(_password);
  String? validateRetypePassword() => _password == _retypePassword ? null : 'Password does not match';
  String? validateEmail() => this.isValidEmail(_email);
  String? validatePhoneNumber() => this.isValidPhoneNumber(_phoneNumber.completeNumber);
  String? validOtp() => this.isValidNumber(_otp, minLength: 6);
  String? validateNewPassword() => this.isValidPassword(_newPassword);

  Future<bool> registerUser() async {
    setLocalState = localState?.setRegisterUserState(State.loading());

    await sessionManager.set(SessionManagerKeys.userEmail, _email);
    await sessionManager.set(SessionManagerKeys.userPassword, _password);
    await sessionManager.set(SessionManagerKeys.userPhoneNumber, _phoneNumber.completeNumber);

    if (_agree) {
      try {
        final data = RegisterUserRequest(
          userName: _username,
          password: _password,
          email: _email,
          phoneNumber: _phoneNumber.number,
          phoneCountryCode: _phoneNumber.countryCode,
          referralCode: _referral,
        );
        final result = await _authUsecase.registerUserUsecase(data);
        setLocalState = localState?.setRegisterUserState(State.success(result));

        // Navigate to verification screen
        router.popAndPush(VerificationRoute(identifier: _phoneNumber.number, isPhoneNumber: true));
        return true;
      } on Exception catch (e) {
        setLocalState = localState?.setRegisterUserState(State.error(e));
        return false;
      }
    } else {
      NotifyUser.showSnackbar('Please agree to the terms and conditions');
      setLocalState = localState?.setRegisterUserState(State.init());
      return false;
    }
  }

  Future<bool> loginUser() async {
    setLocalState = localState?.setLoginUserState(State.loading());
    await sessionManager.set(SessionManagerKeys.userEmail, _email);
    await sessionManager.set(SessionManagerKeys.userPassword, _password);
    try {
      final data = LoginRequest(email: _email, password: _password, userDeviceToken: _userDeviceToken, platform: 'APNS');
      final result = await _authUsecase.loginUsecase(data);
      setLocalState = localState?.setLoginUserState(State.success(result));

      final Map<String, dynamic> jwtToken = Jwt.parseJwt(result.token);

      await sessionManager.set(SessionManagerKeys.isLoggedIn, true);
      await sessionManager.set(SessionManagerKeys.authToken, result.token);

      await sessionManager.set(SessionManagerKeys.authUserId, jwtToken['nameid']);
      await sessionManager.set(SessionManagerKeys.authUserEmail, jwtToken['email']);

      // Navigate to dashboard screen
      router.pushAndPopUntil(WelcomeRoute(), predicate: (route) => false);
      return true;
    } on Exception catch (e) {
      setLocalState = localState?.setLoginUserState(State.error(e));
      if (e.toString().contains('Email is not verified')) {
        final _userOtpViewModel = ref.read(userOtpViewModelProvider.notifier);
        _userOtpViewModel.setPhoneNumberOrEmail(false, _email);
        await _userOtpViewModel.sendEmailVerifyOtp();

        router.push(VerificationRoute(isPhoneNumber: false, identifier: _email));
      }
      return false;
    }
  }

  UserAuthState? get localState => mounted ? state : null;
  void set setLocalState(UserAuthState? value) => mounted
      ? value != null
          ? state = value
          : null
      : null;

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
    _otp = '';
    _newPassword = '';
    super.dispose();
  }
}
