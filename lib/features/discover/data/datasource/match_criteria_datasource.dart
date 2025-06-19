import 'package:zheeta/features/discover/data/model/match_criteria_model.dart';
import 'package:zheeta/features/discover/data/model/match_model.dart';
import 'package:zheeta/features/discover/data/request/match_criteria_request.dart';

abstract class MatchCriteriaDataSource {
  Future<MatchCriteriaModel> getMatchCriteriaNew({required String userId});

  Future<MatchListModel> getMatchesNew({required String userId});

  Future<void> populateMatchesNew();

  Future<void> updateMatchCriteriaNew(
      MatchCriteriaRequest matchCriteriaRequest);

  Future<void> ignoreBulkMatches({
    required List<String> ignoreUsersList,
  });
}
