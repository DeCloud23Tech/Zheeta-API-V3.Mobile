part of 'profile_cubit.dart';

abstract class ProfileState extends Equatable {
  ProfileState();

  @override
  List<Object?> get props => [];
}

class ProfileInitialState extends ProfileState {}

class ProfileLoadingState extends ProfileState {}

class ProfileEnabledUserState extends ProfileState {}

class ProfileDisabledUserState extends ProfileState {}

class ProfileGotAddressLocationState extends ProfileState {
  AddressFromLocationModel data;
  ProfileGotAddressLocationState(this.data);

  @override
  List<Object?> get props => [data];
}

class ProfileGotLocationCoordinateState extends ProfileState {}

class ProfileCreatedBankAccountState extends ProfileState {}

class ProfileGotBankAccountState extends ProfileState {
  BankAccountDetailModel data;
  ProfileGotBankAccountState(this.data);

  @override
  List<Object?> get props => [data];
}

class ProfileGotUserInterests extends ProfileState {
  UserInterestListModel data;
  ProfileGotUserInterests(this.data);

  @override
  List<Object?> get props => [data];
}

class ProfileUpdatedInterestState extends ProfileState {}

class ProfileBlockedUserState extends ProfileState {}

class ProfileUnBlockedUserState extends ProfileState {}

// ignore: must_be_immutable
class ProfileGotBlockedUsersState extends ProfileState {
  ProfileGotBlockedUsersState();
}

class ProfileCreatedProfileBoostState extends ProfileState {}

class ProfileGotBoostedProfileAdminUsersState extends ProfileState {
  BoostedProfileByAdminListModel data;
  ProfileGotBoostedProfileAdminUsersState(this.data);

  @override
  List<Object?> get props => [data];
}

class ProfileGotMathcedProfileBoostState extends ProfileState {
  MatchedProfileBoostListModel data;
  ProfileGotMathcedProfileBoostState(this.data);

  @override
  List<Object?> get props => [data];
}

class ProfileCreatedState extends ProfileState {}

class ProfileGotAllUserState extends ProfileState {
  AllUserProfileListModel data;
  ProfileGotAllUserState(this.data);

  @override
  List<Object?> get props => [data];
}

class ProfileGotSingleUserState extends ProfileState {
  UserProfileModel data;
  ProfileGotSingleUserState(this.data);

  @override
  List<Object?> get props => [data];
}

class ProfileUserActivityState extends ProfileState {
  ActivityListModel data;
  ProfileUserActivityState(this.data);

  @override
  List<Object?> get props => [data];
}

class ProfilePictureUploadedState extends ProfileState {}

class ProfileUpdatedState extends ProfileState {}

class ProfileVisitedState extends ProfileState {
  ViewProfileModel data;
  ProfileVisitedState(this.data);

  @override
  List<Object?> get props => [data];
}

class ProfileSearchedUserByAdminEmailState extends ProfileState {
  SearchUserByAdminListModel data;
  ProfileSearchedUserByAdminEmailState(this.data);

  @override
  List<Object?> get props => [data];
}

class ProfileSearchedUserByAdminUsernameState extends ProfileState {
  SearchUserByAdminListModel data;
  ProfileSearchedUserByAdminUsernameState(this.data);

  @override
  List<Object?> get props => [data];
}

class ProfileSearchedUserByCustomerState extends ProfileState {
  SearchUserByCustomerListModel data;
  ProfileSearchedUserByCustomerState(this.data);

  @override
  List<Object?> get props => [data];
}

class ProfileGotUserTransactionsState extends ProfileState {
  UserTransactionListModel data;
  ProfileGotUserTransactionsState(this.data);

  @override
  List<Object?> get props => [data];
}

class ProfileErrorState extends ProfileState {
  String errorMessage;
  ProfileErrorState(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}
