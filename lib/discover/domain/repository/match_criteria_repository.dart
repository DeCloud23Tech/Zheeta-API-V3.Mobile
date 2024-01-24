import 'package:zheeta/discover/data/model/match_criteria_model.dart';
import 'package:zheeta/discover/data/model/match_model.dart';
import 'package:zheeta/discover/data/request/match_criteria_request.dart';

abstract class MatchCriteriaRepository {
  updateMatchCriteriaRepo(MatchCriteriaRequest matchCreteriaRequest);
  Future<MatchCriteriaModel> getMatchCriteriaRepo();
  Future<MatchListModel> getMatchesRepo({required String userId});
}
