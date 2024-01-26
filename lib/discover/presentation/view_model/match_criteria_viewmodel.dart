import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';
import 'package:zheeta/app/common/exceptions/custom_exception.dart';
import 'package:zheeta/app/common/storage/local_storage_impl.dart';
import 'package:zheeta/app/common/storage/storage_keys.dart';
import 'package:zheeta/app/injection/di.dart';
import 'package:zheeta/authentication/presentation/state/state.dart';
import 'package:zheeta/discover/data/model/match_criteria_model.dart';
import 'package:zheeta/discover/data/model/match_model.dart';
import 'package:zheeta/discover/data/request/match_criteria_request.dart';
import 'package:zheeta/discover/domain/usecase/match_criteria_usecase.dart';
import 'package:zheeta/discover/presentation/state/match_criteria_state.dart';
import 'package:zheeta/profile/presentation/view_model/user_profile_viewmodel.dart';

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
          ),
        );

  setGender(String value) {
    int? _gender;
    switch (value.toLowerCase()) {
      case 'male':
        _gender = 1;
        break;
      case 'female':
        _gender = 2;
        break;
    }
    state = state.updateMatchCriteriaProperty(
      state.matchCriteriaState.data!.copyWith(gender: _gender),
    );
  }

  setMinAge(int value) {
    state = state.updateMatchCriteriaProperty(
      state.matchCriteriaState.data!.copyWith(minAge: value),
    );
  }

  setMaxAge(int value) {
    state = state.updateMatchCriteriaProperty(
      state.matchCriteriaState.data!.copyWith(maxAge: value),
    );
  }

  setDistance(int value) {
    state = state.updateMatchCriteriaProperty(
      state.matchCriteriaState.data!.copyWith(distance: value),
    );
  }

  setCountry(String value) {
    state = state.updateMatchCriteriaProperty(
      state.matchCriteriaState.data!.copyWith(country: value),
    );
  }

  setCity(String value) {
    state = state.updateMatchCriteriaProperty(
      state.matchCriteriaState.data!.copyWith(city: value),
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
        state = state.setUpdateMatchCriteriaState(State.success(result));

        await getMatches(isLoading: false);

        return true;
      } else {
        state = state.setUpdateMatchCriteriaState(
          State.error(NoCriteriaException('Match criteria is not present')),
        );
        return false;
      }
    } on Exception catch (e) {
      state = state.setUpdateMatchCriteriaState(State.error(e));
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
    } on NoCriteriaException {
      final userId = (await sessionManager.get(SessionManagerKeys.authUserIdString)) as String;
      log("UserID: ${userId}");
      final userProfile = ref.watch(userProfileViewModelProvider).getSingleUserProfileState.data?.data;
      state = state.setMatchCriteriaState(
        State.success(
          MatchCriteriaModel(
            userId: userId,
            // Defaults to the opposite gender of the current user profile.
            gender: userProfile?.profile?.gender == 1 ? 'Female' : 'Male',
            minAge: 18,
            maxAge: 100,
            distance: 100,
            country: userProfile?.residentialAddress?.country ?? userProfile?.originAddress?.country ?? null,
            city: userProfile?.residentialAddress?.city ?? userProfile?.originAddress?.city ?? null,
          ),
        ),
      );
      return true;
    } on Exception catch (e) {
      state = state.setMatchCriteriaState(State.error(e));
      return false;
    }
  }

  Future<bool> getMatches({bool isLoading = true}) async {
    if (isLoading) state = state.setGetMatchesState(State.loading());
    try {
      final userId = (await sessionManager.get(SessionManagerKeys.authUserIdString)) as String;
      final result = await _matchCriteriaUseCase.getMatchesUseCase(userId: userId);
      state = state.setGetMatchesState(State.success(result));
      return true;
    } on NoMatchException {
      state = state.setGetMatchesState(
        State.success(MatchListModel(data: [])),
      );
      return true;
    } on Exception catch (e) {
      state = state.setGetMatchesState(State.error(e));
      return false;
    }
  }
}
