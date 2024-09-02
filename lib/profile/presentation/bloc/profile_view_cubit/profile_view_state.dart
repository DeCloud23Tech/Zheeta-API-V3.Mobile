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

class ProfileViewError extends ProfileViewState {
  final String error;

  ProfileViewError(this.error);

  @override
  List<Object?> get props => [error];
}

class ProfileViewedState extends ProfileViewState {
  final ViewProfileModel profileData;

  ProfileViewedState(this.profileData);

  @override
  List<Object?> get props => [profileData];
}

class ProfileViewCompositeState extends ProfileViewState {
  final ActivityListModel recentActivities;
  final int currentPage;
  final bool isFetching;
  final bool hasReachedMax;

  ProfileViewCompositeState({
    required this.recentActivities,
    required this.currentPage,
    this.isFetching = false,
    this.hasReachedMax = false,
  });

  ProfileViewCompositeState copyWith({
    ActivityListModel? recentActivities,
    int? currentPage,
    bool? isFetching,
    bool? hasReachedMax,
  }) {
    return ProfileViewCompositeState(
      recentActivities: recentActivities ?? this.recentActivities,
      currentPage: currentPage ?? this.currentPage,
      isFetching: isFetching ?? this.isFetching,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }

  @override
  List<Object?> get props => [recentActivities, currentPage, isFetching, hasReachedMax];
}
