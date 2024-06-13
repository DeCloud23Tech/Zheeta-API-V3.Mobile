part of 'feeds_cubit.dart';

abstract class FeedsState extends Equatable {
  const FeedsState();
}

class FeedsInitial extends FeedsState {
  @override
  List<Object> get props => [];
}

class MatchedProfilesLoadingState extends FeedsState {
  MatchedProfilesLoadingState();

  @override
  List<Object?> get props => [];
}

class MatchedProfileBoostState extends FeedsState {
  final MatchedProfileBoostListModel data;

  MatchedProfileBoostState(this.data);

  @override
  List<Object?> get props => [data];
}

class MatchedProfilesErrorState extends FeedsState {
  final String errorMessage;

  MatchedProfilesErrorState(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}
