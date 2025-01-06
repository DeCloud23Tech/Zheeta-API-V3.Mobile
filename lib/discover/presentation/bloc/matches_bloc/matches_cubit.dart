import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:zheeta/app/common/enums/type_of_request.dart';
import 'package:zheeta/discover/data/model/match_criteria_model.dart';
import 'package:zheeta/discover/data/model/match_model.dart';
import 'package:zheeta/discover/data/request/match_criteria_request.dart';
import 'package:zheeta/discover/domain/usecase/ref/match_criteria_usecases.dart';

part 'matches_state.dart';

@prod
@LazySingleton()
class MatchesCubit extends Cubit<MatchesState> {
  final GetMatchCriteria getMatchCriteria;
  final GetMatches getMatches;
  final PopulateMatches populateMatches;
  final UpdateMatchCriteria updateMatchCriteria;

  List<MatchModel> mutableMatches = [];
  List<MatchModel> swipedUpMatches = [];
  List<MatchModel> swipedRightMatches = [];
  List<MatchModel> swipedLeftMatches = [];

  MatchesCubit({
    required this.getMatchCriteria,
    required this.getMatches,
    required this.populateMatches,
    required this.updateMatchCriteria,
  }) : super(MatchesInitialState());

  Future<MatchCriteriaModel?> getMatchCriteriaCubit() async {
    emit(MatchesLoadingState());
    var result = await getMatchCriteria();
    MatchCriteriaModel? data;
    result.fold(
      (fail) {
        emit(MatchesErrorState(fail.message));
      },
      (success) {
        emit(MatchesCriteriaGottenState(success));
        data = success;
      },
    );
    return data;
  }

  Future<void> getMatchCubit({required String userId}) async {
    print('get new matches');
    emit(MatchesLoadingState());

    // Clear swiped lists before fetching new matches
    swipedUpMatches.clear();
    swipedRightMatches.clear();
    swipedLeftMatches.clear();

    var result = await getMatches(userId);
    result.fold(
      (fail) {
        emit(MatchesErrorState(fail.message));
      },
      (success) {
        mutableMatches = List<MatchModel>.from(success.data!);
        emit(MatchesGottenState(success));
      },
    );
  }

  void removeMatchAt(int index, AxisDirection direction) {
    if (index < mutableMatches.length) {
      final match = mutableMatches[index];

      // Add the match to the appropriate list based on the direction
      if (direction == AxisDirection.up) {
        swipedUpMatches.add(match);
      } else if (direction == AxisDirection.right) {
        swipedRightMatches.add(match);
      } else if (direction == AxisDirection.left) {
        swipedLeftMatches.add(match);
      }
    }
  }

  void onNavigate() {
    print(swipedUpMatches);
    print(swipedRightMatches);
    print(swipedLeftMatches);
    emit(MatchesFriendRequestSentState());
  }

  Future<void> populateMatchesCubit() async {
    emit(MatchesLoadingState());
    print('populateMatches');
    var result = await populateMatches();

    result.fold(
      (fail) {
        emit(MatchesErrorState(fail.message));
      },
      (success) {
        emit(MatchesPopulatedState());
      },
    );
  }

  Future<void> updateMatchCriteriaCubit(
      {required MatchCriteriaRequest request}) async {
    emit(MatchesLoadingState());
    var result = await updateMatchCriteria(request);
    result.fold(
      (fail) {
        emit(MatchesErrorState(fail.message));
      },
      (success) {
        emit(MatchesUpdatedState());
      },
    );
  }
}
