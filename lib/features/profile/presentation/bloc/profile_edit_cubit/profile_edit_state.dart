part of 'profile_edit_cubit.dart';

abstract class ProfileEditState extends Equatable {
  const ProfileEditState();

  @override
  List<Object> get props => [];
}

final class ProfileEditInitial extends ProfileEditState {}

class ProfileUpdateLoading extends ProfileEditState {}

class ProfileUpdateError extends ProfileEditState {
  final String errorMessage;

  const ProfileUpdateError(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}

class ProfilePictureUpdateSuccess extends ProfileEditState {}

class ProfileCarouselsUpdateSuccess extends ProfileEditState {}

class ProfileUpdateSuccess extends ProfileEditState {}
