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
    required State populateMatchesState,
    required State<List<String>> countryState,
    required State<List<String>> cityState,
  }) = _MatchCriteriaState;

  MatchCriteriaState._();

  MatchCriteriaState setUpdateMatchCriteriaState(State state) =>
      copyWith(updateMatchCriteriaState: state);
  MatchCriteriaState setMatchCriteriaState(State<MatchCriteriaModel> state) =>
      copyWith(matchCriteriaState: state);
  MatchCriteriaState setGetMatchesState(State<MatchListModel> state) =>
      copyWith(getMatchesState: state);
  MatchCriteriaState setPopulateMatchesState(State state) =>
      copyWith(populateMatchesState: state);

  MatchCriteriaState updateMatchCriteriaGenderState(String value) {
    return copyWith(
        matchCriteriaState: State.success(
      matchCriteriaState.data!.copyWith(gender: value),
    ));
  }

  MatchCriteriaState updateMatchCriteriaMinAgeState(int value) {
    return copyWith(
        matchCriteriaState: State.success(
      matchCriteriaState.data!.copyWith(minAge: value),
    ));
  }

  MatchCriteriaState updateMatchCriteriaMaxAgeState(int value) {
    return copyWith(
        matchCriteriaState: State.success(
      matchCriteriaState.data!.copyWith(maxAge: value),
    ));
  }

  MatchCriteriaState updateMatchCriteriaDistanceState(int value) {
    return copyWith(
        matchCriteriaState: State.success(
      matchCriteriaState.data!.copyWith(distance: value),
    ));
  }

  MatchCriteriaState updateMatchCriteriaCountryState(String value) {
    return copyWith(
        matchCriteriaState: State.success(
      matchCriteriaState.data!.copyWith(country: value),
    ));
  }

  MatchCriteriaState updateMatchCriteriaCityState(String? value) {
    return copyWith(
        matchCriteriaState: State.success(
      matchCriteriaState.data!.copyWith(city: value),
    ));
  }

  MatchCriteriaState setCountryState(State<List<String>> state) =>
      copyWith(countryState: state);
  MatchCriteriaState setCityState(State<List<String>> state) =>
      copyWith(cityState: state);
}
