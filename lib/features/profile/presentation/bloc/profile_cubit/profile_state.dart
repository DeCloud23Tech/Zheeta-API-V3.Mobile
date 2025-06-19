part of 'profile_cubit.dart';

abstract class ProfileState extends Equatable {
  final UserProfileModel? profile;
  final BlockedUsersResponse? allBlockedUsers;

  const ProfileState({this.profile, this.allBlockedUsers});

  @override
  List<Object?> get props => [profile ?? '', allBlockedUsers ?? ''];
}

class ProfileInitialState extends ProfileState {}

class ProfileLoadingState extends ProfileState {
  const ProfileLoadingState({
    super.profile,
    super.allBlockedUsers,
  });
}

class ProfileBlockLoadingState extends ProfileState {
  const ProfileBlockLoadingState({
    super.profile,
    super.allBlockedUsers,
  });
}

class ProfileLoadedState extends ProfileState {
  const ProfileLoadedState({
    super.profile,
    super.allBlockedUsers,
  });

  ProfileLoadedState copyWith({
    UserProfileModel? profile,
    BlockedUsersResponse? allBlockedUsers,
  }) {
    return ProfileLoadedState(
      profile: profile ?? this.profile,
      allBlockedUsers: allBlockedUsers ?? this.allBlockedUsers,
    );
  }

  List<BlockedUser> get blockedUsersList => allBlockedUsers?.data ?? [];
}

class ProfileErrorState extends ProfileState {
  final String errorMessage;

  const ProfileErrorState(
    this.errorMessage, {
    super.profile,
    super.allBlockedUsers,
  });
}
