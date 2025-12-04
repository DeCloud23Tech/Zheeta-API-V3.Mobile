part of 'match_criteria_cubit.dart';

abstract class MatchCriteriaState extends Equatable {
  const MatchCriteriaState();

  @override
  List<Object?> get props => [];
}

class MatchCriteriaInitial extends MatchCriteriaState {}

class MatchCriteriaLoadingState extends MatchCriteriaState {}

class MatchCriteriaErrorState extends MatchCriteriaState {
  final String message;

  const MatchCriteriaErrorState(this.message);

  @override
  List<Object> get props => [message];
}

class MatchCriteriaLoadedState extends MatchCriteriaState {
  final MatchCriteriaModel matchCriteria;

  const MatchCriteriaLoadedState(this.matchCriteria);

  @override
  List<Object> get props => [matchCriteria];
}

class MatchCriteriaUpdatedState extends MatchCriteriaState {}
