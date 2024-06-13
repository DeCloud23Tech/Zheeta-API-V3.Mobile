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
  final AddressFromLocationModel data;

  ProfileGotAddressLocationState(this.data);

  @override
  List<Object?> get props => [data];
}

class ProfileGotLocationCoordinateState extends ProfileState {}

class ProfileCreatedBankAccountState extends ProfileState {}

class ProfileGotBankAccountState extends ProfileState {
  final BankAccountDetailModel data;

  ProfileGotBankAccountState(this.data);

  @override
  List<Object?> get props => [data];
}

class ProfileGotUserInterests extends ProfileState {
  final UserInterestListModel data;

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
  final BoostedProfileByAdminListModel data;

  ProfileGotBoostedProfileAdminUsersState(this.data);

  @override
  List<Object?> get props => [data];
}


class ProfileCreatedState extends ProfileState {}

class ProfileGotAllUserState extends ProfileState {
  final AllUserProfileListModel data;

  ProfileGotAllUserState(this.data);

  @override
  List<Object?> get props => [data];
}

class ProfileGotSingleUserState extends ProfileState {
  final UserProfileModel data;

  ProfileGotSingleUserState(this.data);

  @override
  List<Object?> get props => [data];
}

class ProfileUserActivityState extends ProfileState {
  final ActivityListModel data;

  ProfileUserActivityState(this.data);

  @override
  List<Object?> get props => [data];
}

class ProfilePictureUploadedState extends ProfileState {}

class ProfileUpdatedState extends ProfileState {}

class ProfileVisitedState extends ProfileState {
  final ViewProfileModel data;

  ProfileVisitedState(this.data);

  @override
  List<Object?> get props => [data];
}

class ProfileSearchedUserByAdminEmailState extends ProfileState {
  final SearchUserByAdminListModel data;

  ProfileSearchedUserByAdminEmailState(this.data);

  @override
  List<Object?> get props => [data];
}

class ProfileSearchedUserByAdminUsernameState extends ProfileState {
  final SearchUserByAdminListModel data;

  ProfileSearchedUserByAdminUsernameState(this.data);

  @override
  List<Object?> get props => [data];
}

class ProfileSearchedUserByCustomerState extends ProfileState {
  final SearchUserByCustomerListModel data;

  ProfileSearchedUserByCustomerState(this.data);

  @override
  List<Object?> get props => [data];
}

class ProfileGotUserTransactionsState extends ProfileState {
  final UserTransactionListModel data;

  ProfileGotUserTransactionsState(this.data);

  @override
  List<Object?> get props => [data];
}

class ProfileErrorState extends ProfileState {
  final String errorMessage;

  ProfileErrorState(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}
