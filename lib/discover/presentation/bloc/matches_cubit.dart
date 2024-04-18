import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:zheeta/app/common/enums/type_of_request.dart';
import 'package:zheeta/discover/data/model/match_criteria_model.dart';
import 'package:zheeta/discover/data/model/match_model.dart';
import 'package:zheeta/discover/data/request/match_criteria_request.dart';
import 'package:zheeta/discover/domain/usecase/ref/friend_usecases.dart';
import 'package:zheeta/discover/domain/usecase/ref/match_criteria_usecases.dart';

part 'matches_state.dart';

@prod
@LazySingleton()
class MatchesCubit extends Cubit<MatchesState> {
  final SendFriendRequest sendFriendRequest;
  final GetMatchCriteria getMatchCriteria;
  final GetMatches getMatches;
  final PopulateMatches populateMatches;
  final UpdateMatchCriteria updateMatchCriteria;
  MatchesCubit({
    required this.sendFriendRequest,
    required this.getMatchCriteria,
    required this.getMatches,
    required this.populateMatches,
    required this.updateMatchCriteria,
  }) : super(MatchesInitialState());

  Future<void> sendFriendRequestCubit(
      {required String receiverId, required TypeOfRequest type}) async {
    emit(MatchesLoadingState());
    var result = await sendFriendRequest(
        SendRequestParams(recieverId: receiverId, typeOfRequest: type));

    result.fold(
      (fail) {
        emit(MatchesErrorState(fail.message));
      },
      (success) {
        emit(MatchesFriendRequestSentState());
      },
    );
  }

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

  Future<MatchListModel?> getMatchCubit({required String userId}) async {
    emit(MatchesLoadingState());
    var result = await getMatches(userId);
    MatchListModel? data;
    result.fold(
      (fail) {
        emit(MatchesErrorState(fail.message));
      },
      (success) {
        emit(MatchesGottenState(success));
        data = success;
      },
    );
    return data;
  }

  Future<void> populateMatchesCubit() async {
    emit(MatchesLoadingState());
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
