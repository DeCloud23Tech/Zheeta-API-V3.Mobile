import 'package:zheeta/discover/data/model/match_criteria_model.dart';
import 'package:zheeta/discover/data/model/match_model.dart';
import 'package:zheeta/discover/data/request/match_criteria_request.dart';

abstract class MatchCriteriaUseCase {
  updateMatchCriteriaUseCase(MatchCriteriaRequest matchCreteriaRequest);
  Future<MatchCriteriaModel> getMatchCriteriaUseCase();
  Future<MatchListModel> getMatchesUseCase({required String userId});
}
