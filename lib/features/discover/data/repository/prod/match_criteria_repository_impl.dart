import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:zheeta/common/constants/type_def.dart';
import 'package:zheeta/common/errors/error.dart';
import 'package:zheeta/common/errors/exception.dart';
import 'package:zheeta/features/discover/data/datasource/match_criteria_datasource.dart';
import 'package:zheeta/features/discover/data/model/match_criteria_model.dart';
import 'package:zheeta/features/discover/data/model/match_model.dart';
import 'package:zheeta/features/discover/data/request/match_criteria_request.dart';
import 'package:zheeta/features/discover/domain/repository/match_criteria_repository.dart';

@prod
@LazySingleton(as: MatchCriteriaRepository)
class MatchCriteriaRepositoryImpl implements MatchCriteriaRepository {
  final MatchCriteriaDataSource _datasource;

  MatchCriteriaRepositoryImpl(this._datasource);

  @override
  ResultFuture<MatchCriteriaModel> getMatchCriteria({required String userId}) async {
    try {
      final result = await _datasource.getMatchCriteriaNew(userId: userId);
      return right(result);
    } on ApiException catch (ex) {
      return left(ApiError(message: ex.message, statusCode: ex.statusCode));
    } on DioException catch (ex) {
      return left(
          ApiError(message: ex.response?.data['message'], statusCode: ex.response!.statusCode!));
    }
  }

  @override
  ResultFuture<MatchListModel> getMatches({required String userId}) async {
    try {
      final result = await _datasource.getMatchesNew(userId: userId);
      return right(result);
    } on ApiException catch (ex) {
      return left(ApiError(message: ex.message, statusCode: ex.statusCode));
    } on DioException catch (ex) {
      return left(
          ApiError(message: ex.response?.data['message'], statusCode: ex.response!.statusCode!));
    }
  }

  @override
  ResultVoid populateMatches() async {
    try {
      final result = await _datasource.populateMatchesNew();
      return right(result);
    } on ApiException catch (ex) {
      return left(ApiError(message: ex.message, statusCode: ex.statusCode));
    } on DioException catch (ex) {
      return left(
          ApiError(message: ex.response?.data['message'], statusCode: ex.response!.statusCode!));
    }
  }

  @override
  ResultVoid updateMatchCriteria(
      MatchCriteriaRequest matchCreteriaRequest) async {
    try {
      final result =
          await _datasource.updateMatchCriteriaNew(matchCreteriaRequest);
      return right(result);
    } on ApiException catch (ex) {
      return left(ApiError(message: ex.message, statusCode: ex.statusCode));
    } on DioException catch (ex) {
      return left(
          ApiError(message: ex.response?.data['message'], statusCode: ex.response!.statusCode!));
    }
  }

  @override
  ResultVoid ignoreBulkMatches({required List<String> ignoreUsersList}) async {
    try {
      final result =
          await _datasource.ignoreBulkMatches(ignoreUsersList: ignoreUsersList);
      return right(result);
    } on ApiException catch (ex) {
      return left(ApiError(message: ex.message, statusCode: ex.statusCode));
    } on DioException catch (ex) {
      return left(
          ApiError(message: ex.response?.data['message'], statusCode: ex.response!.statusCode!));
    }
  }
}
