part of 'authentication_bloc.dart';

abstract class AuthentcationState extends Equatable {
  AuthentcationState();

  @override
  List<Object> get props => [];
}

class AuthenticationInitialState extends AuthentcationState {}

class AuthenticationLoadingState extends AuthentcationState {}

class AuthenticationErrorState extends AuthentcationState {
  String errorMessage;
  AuthenticationErrorState(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}

class AuthenticationGotAllCountriesState extends AuthentcationState {
  CountryListModel data;
  AuthenticationGotAllCountriesState(this.data);

  @override
  List<Object> get props => [data];
}

class AuthenticationGotCountryDetailsState extends AuthentcationState {
  CountryDetailModel data;
  AuthenticationGotCountryDetailsState(this.data);

  @override
  List<Object> get props => [data];
}

class AuthenticationUpgradedUserRoleState extends AuthentcationState {}

class AuthenticationDowngradedUserRoleState extends AuthentcationState {}

class AuthenticationRegisteredState extends AuthentcationState {
  RegisterUserModel data;
  AuthenticationRegisteredState(this.data);

  @override
  List<Object> get props => [data];
}

class AuthenticationLoggedInState extends AuthentcationState {
  LoginUserModel data;
  AuthenticationLoggedInState(this.data);
  @override
  List<Object> get props => [data];
}

class AuthenticationRegisteredStaffState extends AuthentcationState {}

class AuthenticationChangePasswordState extends AuthentcationState {}

class AuthenticationResetPasswordState extends AuthentcationState {}

class AuthenticationLoggedInOAuthState extends AuthentcationState {}

class AuthenticationSentResetPasswordState extends AuthentcationState {}
