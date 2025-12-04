part of 'profile_cubit.dart';

abstract class ProfileState extends Equatable {
  final UserProfileModel? profile;

  const ProfileState({this.profile});

  @override
  List<Object?> get props => [profile]; // No need for ?? ''
}

class ProfileInitialState extends ProfileState {
  const ProfileInitialState(); // Add const constructor
}

class ProfileLoadingState extends ProfileState {
  const ProfileLoadingState({super.profile});

  // Add copyWith for ProfileLoadingState to maintain immutability
  ProfileLoadingState copyWith({
    UserProfileModel? profile,
  }) {
    return ProfileLoadingState(
      profile: profile ?? this.profile,
    );
  }

  @override
  List<Object?> get props => [profile]; // Re-add props for consistency
}

class ProfileBlockLoadingState extends ProfileState {
  const ProfileBlockLoadingState({
    super.profile,
  });

  // Add copyWith for ProfileBlockLoadingState to maintain immutability
  ProfileBlockLoadingState copyWith({
    UserProfileModel? profile,
    BlockedUsersResponse? allBlockedUsers,
  }) {
    return ProfileBlockLoadingState(
      profile: profile ?? this.profile,
    );
  }

  @override
  List<Object?> get props => [profile]; // Re-add props for consistency
}

class ProfileLoadedState extends ProfileState {
  const ProfileLoadedState({
    super.profile,
  });

  ProfileLoadedState copyWith({
    UserProfileModel? profile,
    BlockedUsersResponse? allBlockedUsers,
  }) {
    return ProfileLoadedState(
      profile: profile ?? this.profile,
    );
  }
}

class ProfileErrorState extends ProfileState {
  final String errorMessage;

  const ProfileErrorState(
    this.errorMessage, {
    super.profile,
  });

  // Add copyWith for ProfileErrorState to maintain immutability
  ProfileErrorState copyWith({
    String? errorMessage,
    UserProfileModel? profile,
  }) {
    return ProfileErrorState(
      errorMessage ?? this.errorMessage,
      profile: profile ?? this.profile,
    );
  }

  @override
  List<Object?> get props => [
        errorMessage,
        profile,
      ]; // Include errorMessage in props
}
