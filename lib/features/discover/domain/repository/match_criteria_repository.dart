import 'package:zheeta/common/constants/type_def.dart';
import 'package:zheeta/features/discover/data/model/match_criteria_model.dart';
import 'package:zheeta/features/discover/data/model/match_model.dart';
import 'package:zheeta/features/discover/data/request/match_criteria_request.dart';

abstract class MatchCriteriaRepository {
  ResultVoid updateMatchCriteria(MatchCriteriaRequest matchCriteriaRequest);

  ResultFuture<MatchCriteriaModel> getMatchCriteria({required String userId});

  ResultFuture<MatchListModel> getMatches({required String userId});

  ResultVoid populateMatches();

  ResultVoid ignoreBulkMatches({required List<String> ignoreUsersList});
}
