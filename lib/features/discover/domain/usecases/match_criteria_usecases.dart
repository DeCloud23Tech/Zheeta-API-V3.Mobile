import 'package:injectable/injectable.dart';
import 'package:zheeta/core/common/usecase/usecases.dart';
import 'package:zheeta/core/constants/type_def.dart';
import 'package:zheeta/features/discover/data/models/match_criteria_model.dart';
import 'package:zheeta/features/discover/data/models/match_model.dart';
import 'package:zheeta/features/discover/data/requests/match_criteria_request.dart';
import 'package:zheeta/features/discover/domain/repositories/match_criteria_repository.dart';

@prod
@LazySingleton()
class GetMatchCriteria extends UsecaseWithParams<MatchCriteriaModel, String> {
  const GetMatchCriteria(this._repo);

  final IMatchCriteriaRepository _repo;

  @override
  ResultFuture<MatchCriteriaModel> call(String params) async =>
      await _repo.getMatchCriteria(userId: params);
}

@prod
@LazySingleton()
class PopulateMatches extends UsecaseWithoutParams<void> {
  const PopulateMatches(this._repo);

  final IMatchCriteriaRepository _repo;

  @override
  ResultFuture<void> call() async => await _repo.populateMatches();
}

@prod
@LazySingleton()
class GetMatches extends UsecaseWithParams<MatchListModel, String> {
  const GetMatches(this._repo);

  final IMatchCriteriaRepository _repo;

  @override
  ResultFuture<MatchListModel> call(String params) async =>
      await _repo.getMatches(userId: params);
}

@prod
@LazySingleton()
class UpdateMatchCriteria
    extends UsecaseWithParams<void, MatchCriteriaRequest> {
  const UpdateMatchCriteria(this._repo);

  final IMatchCriteriaRepository _repo;

  @override
  ResultFuture<void> call(MatchCriteriaRequest params) async =>
      await _repo.updateMatchCriteria(params);
}

@prod
@LazySingleton()
class IgnoreBulkMatches extends UsecaseWithParams<void, List<String>> {
  const IgnoreBulkMatches(this._repo);

  final IMatchCriteriaRepository _repo;

  @override
  ResultFuture<void> call(List<String> params) async =>
      await _repo.ignoreBulkMatches(ignoreUsersList: params);
}
