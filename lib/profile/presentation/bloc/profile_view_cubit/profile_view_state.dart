part of 'profile_view_cubit.dart';

abstract class ProfileViewState extends Equatable {
  const ProfileViewState();

  @override
  List<Object?> get props => [];
}

class ProfileViewInitial extends ProfileViewState {
  @override
  List<Object> get props => [];
}

class ProfileViewLoading extends ProfileViewState {
  @override
  List<Object> get props => [];
}

// Composite state to hold ViewProfileModel and other related sub-states
class ProfileViewCompositeState extends ProfileViewState {
  final ViewProfileModel? profileData;
  final UserPostListModel? userPosts;
  final String? success;

  const ProfileViewCompositeState({
    this.profileData,
    this.userPosts,
    this.success,

  });

  ProfileViewCompositeState copyWith({
    ViewProfileModel? profileData,
    UserPostListModel? recentActivities,
    String? success,

  }) {
    return ProfileViewCompositeState(
      profileData: profileData ?? this.profileData,
      userPosts: recentActivities ?? this.userPosts,
      success: success ?? this.success,
    );
  }

  @override
  List<Object?> get props => [
    profileData,
    userPosts,
    success,
  ];

  // Getters to access specific properties for convenience
  List<UserPostModel> get userPostsList => userPosts?.data ?? [];
}

// Loading state that extends ProfileViewCompositeState
class ProfileViewLoadingCompositeState extends ProfileViewCompositeState {
  const ProfileViewLoadingCompositeState({
    ViewProfileModel? profileData,
    UserPostListModel? recentActivities,
    String? success,
  }) : super(
    profileData: profileData,
    userPosts: recentActivities,
    success: success,
  );

  @override
  List<Object?> get props => [
    ...super.props,
  ];
}


class ProfileViewError extends ProfileViewState {
  final String error;

  ProfileViewError(this.error);

  @override
  List<Object?> get props => [error];
}