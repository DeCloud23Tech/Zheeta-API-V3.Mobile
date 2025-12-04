import 'package:zheeta/core/constants/type_def.dart';
import 'package:zheeta/features/discover/data/models/match_criteria_model.dart';
import 'package:zheeta/features/discover/data/models/match_model.dart';
import 'package:zheeta/features/discover/data/requests/match_criteria_request.dart';

abstract class IMatchCriteriaRepository {
  ResultVoid updateMatchCriteria(MatchCriteriaRequest matchCriteriaRequest);

  ResultFuture<MatchCriteriaModel> getMatchCriteria({required String userId});

  ResultFuture<MatchListModel> getMatches({required String userId});

  ResultVoid populateMatches();

  ResultVoid ignoreBulkMatches({required List<String> ignoreUsersList});
}
