import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';
import 'package:zheeta/app/common/exceptions/custom_exception.dart';
import 'package:zheeta/app/common/notify/notify_user.dart';
import 'package:zheeta/app/common/storage/local_storage_impl.dart';
import 'package:zheeta/app/common/storage/storage_keys.dart';
import 'package:zheeta/app/injection/di.dart';
import 'package:zheeta/authentication/presentation/state/state.dart';
import 'package:zheeta/discover/data/model/match_criteria_model.dart';
import 'package:zheeta/discover/data/request/match_criteria_request.dart';
import 'package:zheeta/discover/domain/usecase/match_criteria_usecase.dart';
import 'package:zheeta/discover/presentation/state/match_criteria_state.dart';
import 'package:zheeta/profile/presentation/viewmodel/user_profile_viewmodel.dart';

final matchCriteriaViewModelProvider = StateNotifierProvider<MatchCriteriaViewModel, MatchCriteriaState>(
  (ref) {
    final _matchCriteriaUseCase = locator<MatchCriteriaUseCase>();
    return MatchCriteriaViewModel(_matchCriteriaUseCase, ref);
  },
);

class MatchCriteriaViewModel extends StateNotifier<MatchCriteriaState> {
  final MatchCriteriaUseCase _matchCriteriaUseCase;
  Ref ref;
  MatchCriteriaViewModel(this._matchCriteriaUseCase, this.ref)
      : super(
          MatchCriteriaState(
            updateMatchCriteriaState: State.init(),
            matchCriteriaState: State.init(),
            getMatchesState: State.init(),
            populateMatchesState: State.init(),
            countryState: State.init(),
            cityState: State.init(),
          ),
        );

  setGender(String value) {
    state = state.updateMatchCriteriaGenderState(value);
  }

  setMinAge(int value) {
    state = state.updateMatchCriteriaMinAgeState(value);
  }

  setMaxAge(int value) {
    state = state.updateMatchCriteriaMaxAgeState(value);
  }

  setDistance(int value) {
    state = state.updateMatchCriteriaDistanceState(value);
  }

  setCountry(String value) {
    state = state.updateMatchCriteriaCountryState(value);
  }

  setCity(String? value) {
    state = state.updateMatchCriteriaCityState(value);
  }

  loadCountry() async {
    state = state.setCountryState(State.success([]));
    state = state.setCityState(State.success([]));
    final data = await rootBundle.loadString('assets/json/countries.json');
    final jsonData = jsonDecode(data) as Map<String, dynamic>;
    state = state.setCountryState(
      State.success(jsonData.keys.toSet().toList()),
    );
  }

  loadCity(String country, {bool clearCity = true}) async {
    if (clearCity) setCity(null);
    state = state.setCityState(State.success([]));
    final data = await rootBundle.loadString('assets/json/countries.json');
    final jsonData = jsonDecode(data) as Map<String, dynamic>;
    List<dynamic> city = jsonData.entries
        .firstWhere(
          (element) => element.key.toLowerCase() == country.toLowerCase(),
        )
        .value;
    state = state.setCityState(
      State.success(
        city.map((e) => e.toString()).toSet().toList(),
      ),
    );
  }

  Future<bool> updateMatchCriteria() async {
    state = state.setUpdateMatchCriteriaState(State.loading());
    try {
      final matchCriteria = state.matchCriteriaState.data;

      if (matchCriteria != null) {
        final requestData = MatchCriteriaRequest(
          id: Uuid().v4(),
          userId: matchCriteria.userId,
          gender: matchCriteria.gender,
          minAge: matchCriteria.minAge,
          maxAge: matchCriteria.maxAge,
          distance: matchCriteria.distance,
          country: matchCriteria.country,
          city: matchCriteria.city,
        );

        final result = await _matchCriteriaUseCase.updateMatchCriteriaUseCase(requestData);

        await getMatches(loadState: false);
        state = state.setUpdateMatchCriteriaState(State.success(result));

        return true;
      } else {
        state = state.setUpdateMatchCriteriaState(
          State.error(NoDataException('Match criteria is not present')),
        );
        return false;
      }
    } on Exception catch (e) {
      state = state.setUpdateMatchCriteriaState(State.error(e));
      NotifyUser.showSnackbar(e.toString());
      return false;
    }
  }

  Future<bool> getMatchCriteria() async {
    state = state.setMatchCriteriaState(State.loading());
    try {
      // Fetch matches while getting criteria.
      getMatches();
      final result = await _matchCriteriaUseCase.getMatchCriteriaUseCase();
      state = state.setMatchCriteriaState(State.success(result));
      return true;
    } on NoDataException {
      final userId = (await sessionManager.get(SessionManagerKeys.authUserIdString)) as String;
      final userProfile = ref.watch(userProfileViewModelProvider).getSingleUserProfileState.data?.data;
      state = state.setMatchCriteriaState(
        State.success(
          MatchCriteriaModel(
            userId: userId,
            // Defaults to the opposite gender of the current user profile.
            gender: userProfile?.profile?.gender == 1 ? 'Female' : 'Male',
            minAge: 10,
            maxAge: 100,
            distance: 100,
            country: userProfile?.residentialAddress?.country ?? userProfile?.originAddress?.country ?? null,
            city: null,
          ),
        ),
      );
      return true;
    } on Exception catch (e) {
      state = state.setMatchCriteriaState(State.error(e));
      NotifyUser.showSnackbar(e.toString());
      return false;
    }
  }

  Future<bool> getMatches({bool loadState = true}) async {
    if (loadState) state = state.setGetMatchesState(State.loading());
    try {
      final userId = (await sessionManager.get(SessionManagerKeys.authUserIdString)) as String;
      final result = await _matchCriteriaUseCase.getMatchesUseCase(userId: userId);
      state = state.setGetMatchesState(State.success(result));
      return true;
    } on NoDataException {
      await populateMatches(getMatches: true);
      return true;
    } on Exception catch (e) {
      state = state.setGetMatchesState(State.error(e));
      NotifyUser.showSnackbar(e.toString());
      return false;
    }
  }

  Future<bool> populateMatches({bool getMatches = false}) async {
    state = state.setPopulateMatchesState(State.loading());
    try {
      final result = await _matchCriteriaUseCase.populateMatchesUseCase();
      state = state.setPopulateMatchesState(State.success(result));
      if (getMatches) this.getMatches();
      return true;
    } on Exception catch (e) {
      state = state.setPopulateMatchesState(State.error(e));
      NotifyUser.showSnackbar(e.toString());
      return false;
    }
  }
}
