import 'package:zheeta/discover/data/model/match_criteria_model.dart';
import 'package:zheeta/discover/data/model/match_model.dart';
import 'package:zheeta/discover/data/request/match_criteria_request.dart';

abstract class MatchCriteriaDataSource {
  Future<MatchCriteriaModel> getMatchCriteriaNew();

  Future<MatchListModel> getMatchesNew({required String userId});

  Future<void> populateMatchesNew();

  Future<void> updateMatchCriteriaNew(
      MatchCriteriaRequest matchCriteriaRequest);
}
