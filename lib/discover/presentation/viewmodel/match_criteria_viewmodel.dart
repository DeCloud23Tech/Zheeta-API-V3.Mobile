import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
import 'package:zheeta/discover/presentation/bloc/matches_cubit.dart';
import 'package:zheeta/discover/presentation/state/match_criteria_state.dart';

// final matchCriteriaViewModelProvider =
//     StateNotifierProvider<MatchCriteriaViewModel, MatchCriteriaState>(
//   (ref) {
//     final _matchCriteriaUseCase = locator<MatchCriteriaUseCase>();
//     return MatchCriteriaViewModel(_matchCriteriaUseCase, ref);
//   },
// );

class MatchCriteriaViewModel {
  MatchCriteriaViewModel();
  List<String> countryList = [];
  List<String> statesList = [];

  String _userId = "";
  String _gender = "";
  int _minAge = 18;
  int _maxAge = 25;
  int _distance = 20;
  String _selectedCountry = "Nigeria";
  String _selectedState = "Lagos";

  MatchCriteriaModel? _matchCriteriaModel;

  setGender(String value) {
    //state = state.updateMatchCriteriaGenderState(value);
  }

  setMinAge(int value) {
    //state = state.updateMatchCriteriaMinAgeState(value);
  }

  setMaxAge(int value) {
    //state = state.updateMatchCriteriaMaxAgeState(value);
  }

  setDistance(int value) {
    //state = state.updateMatchCriteriaDistanceState(value);
  }

  setCountry(String value) {
    //state = state.updateMatchCriteriaCountryState(value);
  }

  setCity(String? value) {
    //state = state.updateMatchCriteriaCityState(value);
  }

  loadCountry() async {
    // state = state.setCountryState(State.success([]));
    // state = state.setCityState(State.success([]));
    countryList = [];
    statesList = [];
    final data = await rootBundle.loadString('assets/json/countries.json');
    final jsonData = jsonDecode(data) as Map<String, dynamic>;
    countryList = jsonData.keys.toSet().toList();
    // state = state.setCountryState(
    //   State.success(),
    // );
  }

  loadCity(String country, {bool clearCity = true}) async {
    if (clearCity) setCity(null);
    //state = state.setCityState(State.success([]));
    statesList = [];
    final data = await rootBundle.loadString('assets/json/countries.json');
    final jsonData = jsonDecode(data) as Map<String, dynamic>;
    List<dynamic> city = jsonData.entries
        .firstWhere(
          (element) => element.key.toLowerCase() == country.toLowerCase(),
        )
        .value;
    // state = state.setCityState(
    //   State.success(
    //     city.map((e) => e.toString()).toSet().toList(),
    //   ),
    // );
    statesList = city.map((e) => e.toString()).toSet().toList();
  }

  Future<bool> updateMatchCriteria(BuildContext context) async {
    //state = state.setUpdateMatchCriteriaState(State.loading());
    //try {
    //final matchCriteria = state.matchCriteriaState.data;

    //if (matchCriteria != null) {
    final requestData = MatchCriteriaRequest(
      id: Uuid().v4(),
      userId: _userId,
      gender: _gender,
      minAge: _minAge,
      maxAge: _maxAge,
      distance: _distance,
      country: _selectedCountry,
      city: _selectedState,
    );

    final result = await context
        .read<MatchesCubit>()
        .updateMatchCriteriaCubit(request: requestData);

    await getMatches(loadState: false);

    //state = state.setUpdateMatchCriteriaState(State.success(result));

    return true;
    // } else {
    //   state = state.setUpdateMatchCriteriaState(
    //     State.error(NoDataException('Match criteria is not present')),
    //   );
    //   return false;
    // }
    // } on Exception catch (e) {
    //   state = state.setUpdateMatchCriteriaState(State.error(e));
    //   NotifyUser.showSnackbar(e.toString());
    //   return false;
    // }
  }

  Future<void> getMatchCriteria(BuildContext context) async {
    //state = state.setMatchCriteriaState(State.loading());
    //try {
    // Fetch matches while getting criteria.
    getMatches();
    final result = await context.read<MatchesCubit>().getMatchCriteriaCubit();
    if (result != null) {
      _matchCriteriaModel = result;
    } else {
      _matchCriteriaModel = MatchCriteriaModel(
        userId: _userId,
        // Defaults to the opposite gender of the current user profile.
        gender: 'Female',
        minAge: 10,
        maxAge: 100,
        distance: 100,
        country: 'Nigeria',

        city: null,
      );
    }

    //state = state.setMatchCriteriaState(State.success(result));
    //return true;

    // } on Exception catch (e) {
    //   state = state.setMatchCriteriaState(State.error(e));
    //   NotifyUser.showSnackbar(e.toString());
    //   return false;
    // }
  }

  Future<bool> getMatches({bool loadState = true}) async {
    //if (loadState) state = state.setGetMatchesState(State.loading());
    //try {
    final userId = (await sessionManager
        .get(SessionManagerKeys.authUserIdString)) as String;
    final result =
        await _matchCriteriaUseCase.getMatchesUseCase(userId: userId);
    state = state.setGetMatchesState(State.success(result));
    return true;
    // } on NoDataException {
    //   await populateMatches(getMatches: true);
    //   return true;
    // } on Exception catch (e) {
    //   state = state.setGetMatchesState(State.error(e));
    //   NotifyUser.showSnackbar(e.toString());
    //   return false;
    // }
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
