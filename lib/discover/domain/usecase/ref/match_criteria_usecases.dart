import 'package:zheeta/app/common/type_def.dart';
import 'package:zheeta/app/common/usecase/usecases.dart';
import 'package:zheeta/discover/data/model/match_criteria_model.dart';
import 'package:zheeta/discover/data/model/match_model.dart';
import 'package:zheeta/discover/data/request/match_criteria_request.dart';
import 'package:zheeta/discover/domain/repository/match_criteria_repository.dart';

class GetMatchCriteria extends UsecaseWithoutParams<MatchCriteriaModel> {
  const GetMatchCriteria(this._repo);

  final MatchCriteriaRepository _repo;

  @override
  ResultFuture<MatchCriteriaModel> call() async =>
      await _repo.getMatchCriteria();
}

class PopulateMatches extends UsecaseWithoutParams<void> {
  const PopulateMatches(this._repo);

  final MatchCriteriaRepository _repo;

  @override
  ResultFuture<void> call() async => await _repo.populateMatches();
}

class GetMatches extends UsecaseWithParams<MatchListModel, String> {
  const GetMatches(this._repo);

  final MatchCriteriaRepository _repo;

  @override
  ResultFuture<MatchListModel> call(String param) async =>
      await _repo.getMatches(userId: param);
}

class UpdateMatchCriteria
    extends UsecaseWithParams<void, MatchCriteriaRequest> {
  const UpdateMatchCriteria(this._repo);

  final MatchCriteriaRepository _repo;

  @override
  ResultFuture<void> call(MatchCriteriaRequest params) async =>
      await _repo.updateMatchCriteria(params);
}
