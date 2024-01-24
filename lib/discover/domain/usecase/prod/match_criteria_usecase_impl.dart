import 'package:injectable/injectable.dart';
import 'package:zheeta/discover/data/model/match_criteria_model.dart';
import 'package:zheeta/discover/data/model/match_model.dart';
import 'package:zheeta/discover/data/request/match_criteria_request.dart';
import 'package:zheeta/discover/domain/repository/match_criteria_repository.dart';
import 'package:zheeta/discover/domain/usecase/match_criteria_usecase.dart';

@prod
@LazySingleton(as: MatchCriteriaUseCase)
class MatchCriteriaUseCaseImpl implements MatchCriteriaUseCase {
  final MatchCriteriaRepository _repository;
  MatchCriteriaUseCaseImpl(this._repository);

  @override
  Future<MatchCriteriaModel> getMatchCriteriaUseCase() {
    return _repository.getMatchCriteriaRepo();
  }

  @override
  Future<MatchListModel> getMatchesUseCase({required String userId}) {
    return _repository.getMatchesRepo(userId: userId);
  }

  @override
  updateMatchCriteriaUseCase(MatchCriteriaRequest matchCreteriaRequest) {
    return _repository.updateMatchCriteriaRepo(matchCreteriaRequest);
  }
}
