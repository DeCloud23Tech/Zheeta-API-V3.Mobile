import 'package:dartz/dartz.dart';
import 'package:zheeta/authentication/domain/entity/types.dart';
import 'package:zheeta/discover/data/request/match_criteria_request.dart';

abstract class MatchCriteriaDataSource {
  Future<Either<ErrorResponse, MappedResponse>> updateMatchCriteria(MatchCriteriaRequest matchCreteriaRequest);
  Future<Either<ErrorResponse, MappedResponse>> getMatchCriteria();
  Future<Either<ErrorResponse, MappedResponse>> getMatches({required String userId});
}
