part of 'profile_view_cubit.dart';

abstract class ProfileViewState extends Equatable {
  final ViewProfileModel? profileData;

  const ProfileViewState({this.profileData});

  @override
  List<Object?> get props => [];
}

class ProfileViewInitial extends ProfileViewState {}

class ProfileViewLoading extends ProfileViewState {
  const ProfileViewLoading({
    super.profileData,
  });
}

class ProfileViewLoadedState extends ProfileViewState {
  const ProfileViewLoadedState({
    super.profileData,
  });

  ProfileViewLoadedState copyWith({
    ViewProfileModel? profileData,
  }) {
    return ProfileViewLoadedState(
      profileData: profileData ?? this.profileData,
    );
  }
}

class ProfileViewErrorState extends ProfileViewState{
  final String errorMessage;

  const ProfileViewErrorState(
      this.errorMessage, {
        super.profileData,
      });
}