import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:zheeta/authentication/presentation/state/state.dart';
import 'package:zheeta/discover/data/model/match_criteria_model.dart';
import 'package:zheeta/discover/data/model/match_model.dart';

part 'match_criteria_state.freezed.dart';

@freezed
class MatchCriteriaState with _$MatchCriteriaState {
  factory MatchCriteriaState({
    required State updateMatchCriteriaState,
    required State<MatchCriteriaModel> matchCriteriaState,
    required State<MatchListModel> getMatchesState,
  }) = _MatchCriteriaState;

  MatchCriteriaState._();

  MatchCriteriaState setUpdateMatchCriteriaState(State state) => copyWith(updateMatchCriteriaState: state);
  MatchCriteriaState setMatchCriteriaState(State<MatchCriteriaModel> state) => copyWith(matchCriteriaState: state);
  MatchCriteriaState setGetMatchesState(State<MatchListModel> state) => copyWith(getMatchesState: state);

  MatchCriteriaState updateMatchCriteriaProperty(MatchCriteriaModel model) => copyWith(matchCriteriaState: State.success(model));
}
