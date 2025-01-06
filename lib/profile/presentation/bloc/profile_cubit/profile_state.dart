part of 'profile_cubit.dart';

abstract class ProfileState extends Equatable {
  const ProfileState();

  @override
  List<Object?> get props => [];
}

class ProfileInitialState extends ProfileState {}

class ProfileLoadingState extends ProfileState {}

class ProfileErrorState extends ProfileState {
  final String message;

  const ProfileErrorState(this.message);

  @override
  List<Object?> get props => [message];
}

// Composite state to hold multiple sub-states
class ProfileCompositeState extends ProfileState {
  final UserProfileModel? userProfile;
  final BlockedUsersResponse? allBlockedUsers;
  final UserPostListModel? userPosts;
  final UserInterestListModel? userInterests;
  final List<SearchUserByCustomerModel>? searchedUsers;
  final String? success;
  final String? errorMessage; // Added errorMessage field

  const ProfileCompositeState({
    this.userProfile,
    this.allBlockedUsers,
    this.userPosts,
    this.userInterests,
    this.searchedUsers,
    this.success,
    this.errorMessage,
  });

  ProfileCompositeState copyWith({
    UserProfileModel? userProfile,
    BlockedUsersResponse? allBlockedUsers,
    UserPostListModel? recentActivities,
    UserInterestListModel? userInterests,
    List<SearchUserByCustomerModel>? searchedUsers,
    String? success,
    String? errorMessage,
  }) {
    return ProfileCompositeState(
      userProfile: userProfile ?? this.userProfile,
      allBlockedUsers: allBlockedUsers ?? this.allBlockedUsers,
      userPosts: recentActivities ?? this.userPosts,
      userInterests: userInterests ?? this.userInterests,
      searchedUsers: searchedUsers ?? this.searchedUsers, // Update new field
      success: success ?? this.success,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
  List<SearchUserByCustomerModel> get searchedUsersList =>
      searchedUsers ?? [];

  @override
  List<Object?> get props => [
    userProfile,
    allBlockedUsers,
    userPosts,
    userInterests,
    searchedUsers,
    success,
    errorMessage,
  ];

  List<BlockedUser> get blockedUsersList => allBlockedUsers?.data ?? [];
  List<UserPostModel> get userPostsList => userPosts?.data ?? [];
  List<UserInterestModel> get userInterestsList => userInterests?.data ?? [];
}

// Loading state that extends ProfileCompositeState
class ProfileLoadingCompositeState extends ProfileCompositeState {
  const ProfileLoadingCompositeState({
    UserProfileModel? userProfile,
    BlockedUsersResponse? allBlockedUsers,
    UserPostListModel? recentActivities,
    UserInterestListModel? userInterests,
    String? success,
    String? errorMessage,
  }) : super(
    userProfile: userProfile,
    allBlockedUsers: allBlockedUsers,
    userPosts: recentActivities,
    userInterests: userInterests,
    success: success,
    errorMessage: errorMessage,
  );

  @override
  List<Object?> get props => [
    ...super.props,
  ];
}

// abstract class ProfileState extends Equatable {
//   ProfileState();
//
//   @override
//   List<Object?> get props => [];
// }
//
// class ProfileInitialState extends ProfileState {}
//
// class ProfileLoadingState extends ProfileState {}
//
// class ProfileEnabledUserState extends ProfileState {}
//
// class ProfileDisabledUserState extends ProfileState {}
//
class ProfileGotAddressLocationState extends ProfileState {
  final AddressFromLocationModel data;

  ProfileGotAddressLocationState(this.data);

  @override
  List<Object?> get props => [data];
}

//
// class ProfileGotLocationCoordinateState extends ProfileState {}
//
// class ProfileCreatedBankAccountState extends ProfileState {}
//
// class ProfileGotBankAccountState extends ProfileState {
//   final BankAccountDetailModel data;
//
//   ProfileGotBankAccountState(this.data);
//
//   @override
//   List<Object?> get props => [data];
// }
//

//
// class ProfileUpdatedInterestState extends ProfileState {}
//
// class ProfileBlockedUserState extends ProfileState {}
//
// class ProfileUnBlockedUserState extends ProfileState {}
//
// // ignore: must_be_immutable

//
// class ProfileCreatedProfileBoostState extends ProfileState {}
//
// class ProfileGotBoostedProfileAdminUsersState extends ProfileState {
//   final BoostedProfileByAdminListModel data;
//
//   ProfileGotBoostedProfileAdminUsersState(this.data);
//
//   @override
//   List<Object?> get props => [data];
// }
//
// class ProfileGotTotalMatchedCountState extends ProfileState {
//   final GetTotalMatchedCountResponse data;
//
//   ProfileGotTotalMatchedCountState(this.data);
//
//   @override
//   List<Object?> get props => [data];
// }
//
class ProfileCreatedState extends ProfileState {}

//
// class ProfileGotAllUserState extends ProfileState {
//   final AllUserProfileListModel data;
//
//   ProfileGotAllUserState(this.data);
//
//   @override
//   List<Object?> get props => [data];
// }
//
// class ProfileGotSingleUserState extends ProfileState {
//   final UserProfileModel data;
//
//   ProfileGotSingleUserState(this.data);
//
//   @override
//   List<Object?> get props => [data];
// }
//
// class ProfileUserActivityState extends ProfileState {
//   final ActivityListModel data;
//
//   ProfileUserActivityState(this.data);
//
//   @override
//   List<Object?> get props => [data];
// }
//
class ProfilePictureUploadedState extends ProfileState {}

class ProfileCarouselsUploadedState extends ProfileState {}
//
// class ProfileUpdatedState extends ProfileState {}
//

//
// class ProfileSearchedUserByAdminEmailState extends ProfileState {
//   final SearchUserByAdminListModel data;
//
//   ProfileSearchedUserByAdminEmailState(this.data);
//
//   @override
//   List<Object?> get props => [data];
// }
//
// class ProfileSearchedUserByAdminUsernameState extends ProfileState {
//   final SearchUserByAdminListModel data;
//
//   ProfileSearchedUserByAdminUsernameState(this.data);
//
//   @override
//   List<Object?> get props => [data];
// }
//
// class ProfileSearchedUserByCustomerState extends ProfileState {
//   final SearchUserByCustomerListModel data;
//
//   ProfileSearchedUserByCustomerState(this.data);
//
//   @override
//   List<Object?> get props => [data];
// }
//
// class ProfileGotUserTransactionsState extends ProfileState {
//   final UserTransactionListModel data;
//
//   ProfileGotUserTransactionsState(this.data);
//
//   @override
//   List<Object?> get props => [data];
// }
//
// class ProfileErrorState extends ProfileState {
//   final String errorMessage;
//
//   ProfileErrorState(this.errorMessage);
//
//   @override
//   List<Object?> get props => [errorMessage];
// }
