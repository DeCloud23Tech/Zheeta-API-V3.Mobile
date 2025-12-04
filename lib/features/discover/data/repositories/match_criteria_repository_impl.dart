import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:zheeta/core/constants/type_def.dart';
import 'package:zheeta/core/error/error.dart';
import 'package:zheeta/core/error/exception.dart';
import 'package:zheeta/features/discover/data/datasources/i_match_criteria_datasource.dart';
import 'package:zheeta/features/discover/data/models/match_criteria_model.dart';
import 'package:zheeta/features/discover/data/models/match_model.dart';
import 'package:zheeta/features/discover/data/requests/match_criteria_request.dart';
import 'package:zheeta/features/discover/domain/repositories/match_criteria_repository.dart';

@prod
@LazySingleton(as: IMatchCriteriaRepository)
class MatchCriteriaRepositoryImpl implements IMatchCriteriaRepository {
  final IMatchCriteriaDataSource _datasource;

  MatchCriteriaRepositoryImpl(this._datasource);

  @override
  ResultFuture<MatchCriteriaModel> getMatchCriteria(
      {required String userId}) async {
    try {
      final result = await _datasource.getMatchCriteriaNew(userId: userId);
      return right(result);
    } on ApiException catch (ex) {
      return left(ApiError(message: ex.message, statusCode: ex.statusCode));
    } on DioException catch (ex) {
      return left(ApiError(
          message: ex.response?.data['message'],
          statusCode: ex.response!.statusCode!));
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
      return left(ApiError(
          message: ex.response?.data['message'],
          statusCode: ex.response!.statusCode!));
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
      return left(ApiError(
          message: ex.response?.data['message'],
          statusCode: ex.response!.statusCode!));
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
      return left(ApiError(
          message: ex.response?.data['message'],
          statusCode: ex.response!.statusCode!));
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
      return left(ApiError(
          message: ex.response?.data['message'],
          statusCode: ex.response!.statusCode!));
    }
  }
}
