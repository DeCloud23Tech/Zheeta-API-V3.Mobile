import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:zheeta/app/api/errors/error.dart';
import 'package:zheeta/app/api/errors/exception.dart';
import 'package:zheeta/app/common/exceptions/custom_exception.dart';
import 'package:zheeta/app/common/type_def.dart';
import 'package:zheeta/discover/data/datasource/match_criteria_datasource.dart';
import 'package:zheeta/discover/data/model/match_criteria_model.dart';
import 'package:zheeta/discover/data/model/match_model.dart';
import 'package:zheeta/discover/data/request/match_criteria_request.dart';
import 'package:zheeta/discover/domain/repository/match_criteria_repository.dart';

@prod
@LazySingleton(as: MatchCriteriaRepository)
class MatchCriteriaRepositoryImpl implements MatchCriteriaRepository {
  final MatchCriteriaDataSource _datasource;
  MatchCriteriaRepositoryImpl(this._datasource);

  @override
  Future<MatchCriteriaModel> getMatchCriteriaRepo() async {
    final result = await _datasource.getMatchCriteria();
    return result.fold(
      (error) {
        if (error.data == null) {
          throw new NoDataException('No Criteria Found');
        } else {
          throw new Exception(error.message);
        }
      },
      (value) => MatchCriteriaModel.fromJson(value['data']),
    );
  }

  @override
  Future<MatchListModel> getMatchesRepo({required String userId}) async {
    final result = await _datasource.getMatches(userId: userId);
    return result.fold(
      (error) {
        if (error.data == null) {
          throw new NoDataException('No Match Found');
        } else {
          throw new Exception(error.message);
        }
      },
      (value) => MatchListModel.fromJson(value),
    );
  }

  @override
  updateMatchCriteriaRepo(MatchCriteriaRequest matchCreteriaRequest) async {
    final result = await _datasource.updateMatchCriteria(matchCreteriaRequest);
    return result.fold(
      (error) => throw new Exception(error.message),
      (value) => value,
    );
  }

  @override
  populateMatchesRepo() async {
    final result = await _datasource.populateMatches();
    return result.fold(
      (error) => throw new Exception(error.message),
      (value) => value,
    );
  }

  @override
  ResultFuture<MatchCriteriaModel> getMatchCriteria() async {
    try {
      final result = await _datasource.getMatchCriteriaNew();
      return right(result);
    } on ApiException catch (ex) {
      return left(ApiError(message: ex.message, statusCode: ex.statusCode));
    } on DioException catch (ex) {
      return left(
          ApiError(message: ex.message!, statusCode: ex.response!.statusCode!));
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
          ApiError(message: ex.message!, statusCode: ex.response!.statusCode!));
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
          ApiError(message: ex.message!, statusCode: ex.response!.statusCode!));
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
          ApiError(message: ex.message!, statusCode: ex.response!.statusCode!));
    }
  }
}
