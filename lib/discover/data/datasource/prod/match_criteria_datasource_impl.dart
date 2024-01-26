import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:zheeta/app/api/api_manager.dart';
import 'package:zheeta/app/common/storage/local_storage_impl.dart';
import 'package:zheeta/app/common/storage/storage_keys.dart';
import 'package:zheeta/authentication/domain/entity/types.dart';
import 'package:zheeta/discover/data/datasource/match_criteria_datasource.dart';
import 'package:zheeta/discover/data/request/match_criteria_request.dart';

@prod
@Singleton(as: MatchCriteriaDataSource)
class MatchCriteriaDataSourceImpl implements MatchCriteriaDataSource {
  final ApiManager _apiManager;
  late final String? _authToken;

  MatchCriteriaDataSourceImpl(this._apiManager) {
    _getAuthToken();
  }

  _getAuthToken() async {
    _authToken = (await sessionManager.get(SessionManagerKeys.authTokenString)) as String?;
  }

  @override
  Future<Either<ErrorResponse, MappedResponse>> getMatchCriteria() async {
    final response = await _apiManager.getHttp('/friends/get-match-criteria', token: _authToken);
    if (response.success) {
      return Right(response.data);
    } else {
      return Left(
        ErrorResponse(message: response.message, data: response.data),
      );
    }
  }

  @override
  Future<Either<ErrorResponse, MappedResponse>> getMatches({required String userId}) async {
    final response = await _apiManager.getHttp('/friend/get-matches?userId=$userId', token: _authToken);
    if (response.success) {
      return Right(response.data);
    } else {
      return Left(
        ErrorResponse(message: response.message, data: response.data),
      );
    }
  }

  @override
  Future<Either<ErrorResponse, MappedResponse>> updateMatchCriteria(MatchCriteriaRequest matchCreteriaRequest) async {
    final response = await _apiManager.postHttp('/friends/match-criteria', matchCreteriaRequest.toJson(), token: _authToken);
    if (response.success) {
      return Right(response.data);
    } else {
      return Left(
        ErrorResponse(message: response.message, data: response.data),
      );
    }
  }
}
