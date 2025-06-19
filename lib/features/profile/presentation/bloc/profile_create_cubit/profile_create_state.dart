part of 'profile_create_cubit.dart';

abstract class ProfileCreateState extends Equatable {
  const ProfileCreateState();

  @override
  List<Object> get props => [];
}

class ProfileCreateInitial extends ProfileCreateState {}

class ProfileCreateLoading extends ProfileCreateState {}

class ProfileCreateUpdated extends ProfileCreateState {
  final Map<String, dynamic> profileData;

  const ProfileCreateUpdated(this.profileData);

  @override
  List<Object> get props => [profileData];
}

class ProfileCreateError extends ProfileCreateState {
  final String errorMessage;

  const ProfileCreateError(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}

class ProfileCreateSuccess extends ProfileCreateState {}

class ProfilePictureCreateSuccess extends ProfileCreateState {}

class ProfileCarouselsCreateSuccess extends ProfileCreateState {}
