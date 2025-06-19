part of 'profile_interest_cubit.dart';

abstract class ProfileInterestState extends Equatable {
  const ProfileInterestState();

  @override
  List<Object> get props => [];
}

class ProfileInterestInitial extends ProfileInterestState {}

class ProfileInterestLoading extends ProfileInterestState {}

class ProfileInterestLoaded extends ProfileInterestState {
  final UserInterestListModel userInterests;

  const ProfileInterestLoaded({required this.userInterests});

  @override
  List<Object> get props => [userInterests];

  List<UserInterestModel> get userInterestsList => userInterests.data;
}

class ProfileInterestError extends ProfileInterestState {
  final String errorMessage;

  const ProfileInterestError({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}

class ProfileInterestUpdating extends ProfileInterestState {}

class ProfileInterestUpdated extends ProfileInterestState {}

class ProfileInterestUpdateError extends ProfileInterestState {
  final String errorMessage;

  const ProfileInterestUpdateError(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}
