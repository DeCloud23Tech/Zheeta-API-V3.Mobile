import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:uuid/uuid.dart';
import 'package:zheeta/app/injection/di.dart';
import 'package:zheeta/discover/data/model/match_criteria_model.dart';
import 'package:zheeta/discover/data/model/match_model.dart';
import 'package:zheeta/discover/data/request/match_criteria_request.dart';
import 'package:zheeta/discover/presentation/bloc/matches_cubit.dart';
import 'package:zheeta/profile/presentation/viewmodel/user_profile_viewmodel.dart';

@prod
@LazySingleton()
class MatchCriteriaViewModel {
  MatchCriteriaViewModel();
  List<String> countryList = [];
  List<String> statesList = [];

  String _userId = "";
  String gender = "";
  int minAge = 18;
  int maxAge = 25;
  int distance = 20;
  String selectedCountry = "Nigeria";
  String selectedState = "Lagos";

  MatchCriteriaModel? matchCriteriaModel;
  MatchListModel? matchListModel;

  setGender(String value) {
    gender = value;
  }

  setMinAge(int value) {
    minAge = value;
  }

  setMaxAge(int value) {
    maxAge = value;
  }

  setDistance(int value) {
    distance = value;
  }

  setCountry(String value) {
    selectedCountry = value;
  }

  setCity(String? value) {
    selectedState = value ?? '';
  }

  loadCountry() async {
    countryList = [];
    statesList = [];
    final data = await rootBundle.loadString('assets/json/countries.json');
    final jsonData = jsonDecode(data) as Map<String, dynamic>;
    countryList = jsonData.keys.toSet().toList();
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
    statesList = city.map((e) => e.toString()).toSet().toList();
  }

  Future<void> updateMatchCriteria(BuildContext context) async {
    final requestData = MatchCriteriaRequest(
      id: Uuid().v4(),
      userId: _userId,
      gender: gender,
      minAge: minAge,
      maxAge: maxAge,
      distance: distance,
      country: selectedCountry,
      city: selectedState,
    );

    await context
        .read<MatchesCubit>()
        .updateMatchCriteriaCubit(request: requestData);

    await getMatches(context, loadState: false);
  }

  Future<void> getMatchCriteria(BuildContext context) async {
    getMatches(context);
    final result = await context.read<MatchesCubit>().getMatchCriteriaCubit();
    if (result != null) {
      matchCriteriaModel = result;
    } else {
      matchCriteriaModel = MatchCriteriaModel(
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
  }

  Future<void> getMatches(BuildContext context, {bool loadState = true}) async {
    var userViewModel = locator<UserProfileViewModel>();
    final result = await context.read<MatchesCubit>().getMatchCubit(
        userId: userViewModel.userProfileModel?.data.user?.userId);
    matchListModel = result;
  }

  Future<void> populateMatches(BuildContext context,
      {bool getMatches = false}) async {
    await context.read<MatchesCubit>().populateMatchesCubit();
  }
}
