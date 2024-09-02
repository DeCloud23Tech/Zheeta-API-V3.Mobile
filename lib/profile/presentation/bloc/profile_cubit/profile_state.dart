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

  // final List<UserProfileModel>? allUsers;
  // final AddressFromLocationModel? address;
  // final List<UserInterestModel>? interests;
  final BlockedUsersResponse? allBlockedUsers;

  // final UserTransactionListModel? transactions;
  final ActivityListModel? recentActivities;

  // final String? success;
  final bool isFetching;
  final int currentPage;
  final bool hasReachedMax;

  const ProfileCompositeState({
    this.userProfile,
    // this.allUsers,
    // this.address,
    // this.interests,
    this.allBlockedUsers,
    // this.transactions,
    this.recentActivities,
    // this.success,
    this.isFetching = false,
    this.currentPage = 1,
    this.hasReachedMax = false,
  });

  ProfileCompositeState copyWith({
    UserProfileModel? userProfile,
    // List<UserProfileModel>? allUsers,
    // AddressFromLocationModel? address,
    // List<UserInterestModel>? interests,
    BlockedUsersResponse? allBlockedUsers,
    // UserTransactionListModel? transactions,
    ActivityListModel? recentActivities,
    // String? success,
    bool? isFetching,
    int? currentPage,
    bool? hasReachedMax,
  }) {
    return ProfileCompositeState(
      userProfile: userProfile ?? this.userProfile,
      // allUsers: allUsers ?? this.allUsers,
      // address: address ?? this.address,
      // interests: interests ?? this.interests,
      allBlockedUsers: allBlockedUsers ?? this.allBlockedUsers,
      // transactions: transactions ?? this.transactions,
      recentActivities: recentActivities ?? this.recentActivities,
      // success: success ?? this.success,
      isFetching: isFetching ?? this.isFetching,
      currentPage: currentPage ?? this.currentPage,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }

  @override
  List<Object?> get props => [
        userProfile,
        // allUsers,
        // address,
        // interests,
        allBlockedUsers,
        // transactions,
        recentActivities,
        // success,
        isFetching,
        currentPage,
        hasReachedMax,
      ];
}

// Loading state that extends ProfileCompositeState
class ProfileLoadingCompositeState extends ProfileCompositeState {
  const ProfileLoadingCompositeState({
    UserProfileModel? userProfile,
    // List<UserProfileModel>? allUsers,
    // AddressFromLocationModel? address,
    // List<UserInterestModel>? interests,
    BlockedUsersResponse? allBlockedUsers,
    // UserTransactionListModel? transactions,
    ActivityListModel? recentActivities,
    bool? isFetching,
    int? currentPage,
    bool? hasReachedMax,
    // String? success,
  }) : super(
          userProfile: userProfile,
          // allUsers: allUsers,
          // address: address,
          // interests: interests,
          allBlockedUsers: allBlockedUsers,
          // transactions: transactions,
          recentActivities: recentActivities,
          currentPage: currentPage ?? 1,
          isFetching: isFetching ?? false,
          hasReachedMax: hasReachedMax ?? false,
          // success: success,
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
// class ProfileGotAddressLocationState extends ProfileState {
//   final AddressFromLocationModel data;
//
//   ProfileGotAddressLocationState(this.data);
//
//   @override
//   List<Object?> get props => [data];
// }
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
// class ProfileGotUserInterests extends ProfileState {
//   final UserInterestListModel data;
//
//   ProfileGotUserInterests(this.data);
//
//   @override
//   List<Object?> get props => [data];
// }
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
// class ProfileCreatedState extends ProfileState {}
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
// class ProfilePictureUploadedState extends ProfileState {}
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
