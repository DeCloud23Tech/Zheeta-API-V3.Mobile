part of 'authentication_cubit.dart';

abstract class AuthenticationState extends Equatable {
  const AuthenticationState();

  @override
  List<Object> get props => [];
}

class AuthenticationInitialState extends AuthenticationState {}

class AuthenticationLoadingState extends AuthenticationState {}

class AuthenticationErrorState extends AuthenticationState {
  final String errorMessage;

  const AuthenticationErrorState(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}

class AuthenticationLoggedInState extends AuthenticationState {
  final LoginUserModel data;

  const AuthenticationLoggedInState(this.data);

  @override
  List<Object> get props => [data];
}
