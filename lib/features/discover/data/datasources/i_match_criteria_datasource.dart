import 'package:zheeta/features/discover/data/models/match_criteria_model.dart';
import 'package:zheeta/features/discover/data/models/match_model.dart';
import 'package:zheeta/features/discover/data/requests/match_criteria_request.dart';

abstract class IMatchCriteriaDataSource {
  Future<MatchCriteriaModel> getMatchCriteriaNew({required String userId});

  Future<MatchListModel> getMatchesNew({required String userId});

  Future<void> populateMatchesNew();

  Future<void> updateMatchCriteriaNew(
      MatchCriteriaRequest matchCriteriaRequest);

  Future<void> ignoreBulkMatches({
    required List<String> ignoreUsersList,
  });
}
