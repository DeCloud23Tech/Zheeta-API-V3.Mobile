part of 'profile_search_cubit.dart';

abstract class ProfileSearchState extends Equatable {
  const ProfileSearchState();

  @override
  List<Object?> get props => [];
}

class ProfileSearchInitial extends ProfileSearchState {}

class ProfileSearchLoading extends ProfileSearchState {}

class ProfileSearchSuccess extends ProfileSearchState {
  final SearchUserByCustomerListModel searchResults;

  const ProfileSearchSuccess(this.searchResults);

  @override
  List<Object?> get props => [searchResults];

}

class ProfileSearchError extends ProfileSearchState {
  final String errorMessage;

  const ProfileSearchError(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}
