part of 'matches_cubit.dart';

abstract class MatchesState extends Equatable {
  MatchesState();
  @override
  List<String> get props => [];
}

class MatchesInitialState extends MatchesState {}

class MatchesLoadingState extends MatchesState {}

class MatchesErrorState extends MatchesState {
  String errorMessage;
  MatchesErrorState(this.errorMessage);

  @override
  List<String> get props => [errorMessage];
}
