import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:zheeta/features/discover/data/model/match_criteria_model.dart';
import 'package:zheeta/features/discover/data/request/match_criteria_request.dart';
import 'package:zheeta/features/discover/domain/usecase/ref/match_criteria_usecases.dart';
import 'package:zheeta/features/discover/presentation/bloc/matches_bloc/matches_cubit.dart';



part 'match_criteria_state.dart';

@prod
@LazySingleton()
class MatchCriteriaCubit extends Cubit<MatchCriteriaState> {
  final GetMatchCriteria getMatchCriteria;
  final UpdateMatchCriteria updateMatchCriteria;

  MatchCriteriaCubit({
    required this.getMatchCriteria,
    required this.updateMatchCriteria,
  }) : super(MatchCriteriaInitial());


  Future<MatchCriteriaModel?> getMatchCriteriaCubit(
      {required String userId}) async {
    emit(MatchCriteriaLoadingState());
    var result = await getMatchCriteria(userId);
    MatchCriteriaModel? data;
    result.fold(
          (fail) {
        emit(MatchCriteriaErrorState(fail.message));
      },
          (success) {
        emit(MatchCriteriaLoadedState(success));
        data = success;
      },
    );
    return data;
  }

  Future<void> updateMatchCriteriaCubit(
      {required MatchCriteriaRequest request}) async {
    emit(MatchCriteriaLoadingState());
    var result = await updateMatchCriteria(request);
    result.fold(
          (fail) {
        emit(MatchCriteriaErrorState(fail.message));
      },
          (success) {
        emit(MatchCriteriaUpdatedState());
      },
    );
  }
}
