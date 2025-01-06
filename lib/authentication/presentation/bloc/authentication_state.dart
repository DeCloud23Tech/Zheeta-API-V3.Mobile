part of 'authentication_cubit.dart';

abstract class AuthenticationState extends Equatable {
  AuthenticationState();

  @override
  List<Object> get props => [];
}

class AuthenticationInitialState extends AuthenticationState {}

class AuthenticationLoadingState extends AuthenticationState {}

class AuthenticationErrorState extends AuthenticationState {
  final String errorMessage;

  AuthenticationErrorState(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}

class AuthenticationGotAllCountriesState extends AuthenticationState {
  final List<CountryModel> data;

  AuthenticationGotAllCountriesState(this.data);

  @override
  List<Object> get props => [data];
}

class AuthenticationGotCountryDetailsState extends AuthenticationState {
  final CountryDetailModel data;

  AuthenticationGotCountryDetailsState(this.data);

  @override
  List<Object> get props => [data];
}

class AuthenticationUpgradedUserRoleState extends AuthenticationState {}

class AuthenticationDowngradedUserRoleState extends AuthenticationState {}

class AuthenticationRegisteredState extends AuthenticationState {
  final RegisterUserModel data;

  AuthenticationRegisteredState(this.data);

  @override
  List<Object> get props => [data];
}

class AuthenticationLoggedInState extends AuthenticationState {
  final LoginUserModel data;

  AuthenticationLoggedInState(this.data);

  @override
  List<Object> get props => [data];
}

class AuthenticationRegisteredStaffState extends AuthenticationState {}

class AuthenticationChangePasswordState extends AuthenticationState {}

class AuthenticationResetPasswordState extends AuthenticationState {}

class AuthenticationLoggedInOAuthState extends AuthenticationState {}

class AuthenticationSentResetPasswordState extends AuthenticationState {}

class AuthenticationSentEmailOtpState extends AuthenticationState {}

class AuthenticationSentPhoneOtpState extends AuthenticationState {}

class AuthenticationVerifiedPhoneOtpState extends AuthenticationState {}

class AuthenticationVerifiedEmailOtpState extends AuthenticationState {}
