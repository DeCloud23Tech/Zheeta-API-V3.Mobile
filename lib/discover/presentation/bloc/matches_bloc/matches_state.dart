part of 'matches_cubit.dart';

abstract class MatchesState extends Equatable {
  MatchesState();
  @override
  List<Object> get props => [];
}

class MatchesInitialState extends MatchesState {}

class MatchesFriendRequestSentState extends MatchesState {}

class MatchesCriteriaGottenState extends MatchesState {
  final MatchCriteriaModel data;
  MatchesCriteriaGottenState(this.data);

  @override
  List<Object> get props => [data];
}

class MatchesGottenState extends MatchesState {
  final MatchListModel data;
  MatchesGottenState(this.data);

  @override
  List<Object> get props => [data];
}

class MatchesPopulatedState extends MatchesState {}

class MatchesUpdatedState extends MatchesState {}

class MatchesLoadingState extends MatchesState {}

class MatchesEmptyState extends MatchesState {}

class MatchesErrorState extends MatchesState {
  final String errorMessage;
  MatchesErrorState(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}
