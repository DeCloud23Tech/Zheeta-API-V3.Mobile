import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:zheeta/app/api/api_manager.dart';
import 'package:zheeta/app/api/api_manager_refactored.dart';
import 'package:zheeta/app/api/errors/exception.dart';
import 'package:zheeta/app/common/storage/local_storage_impl.dart';
import 'package:zheeta/app/common/storage/storage_keys.dart';
import 'package:zheeta/authentication/domain/entity/types.dart';
import 'package:zheeta/discover/data/datasource/match_criteria_datasource.dart';
import 'package:zheeta/discover/data/model/match_criteria_model.dart';
import 'package:zheeta/discover/data/model/match_model.dart';
import 'package:zheeta/discover/data/request/match_criteria_request.dart';

@prod
@Singleton(as: MatchCriteriaDataSource)
class MatchCriteriaDataSourceImpl implements MatchCriteriaDataSource {
  final ApiManager _apiManager;
  final Api _api;
  late final String? _authToken;

  MatchCriteriaDataSourceImpl(this._apiManager, this._api) {
    _getAuthToken();
  }

  _getAuthToken() async {
    _authToken = (await sessionManager.get(SessionManagerKeys.authTokenString))
        as String?;
  }

  @override
  Future<Either<ErrorResponse, MappedResponse>> getMatchCriteria() async {
    final response = await _apiManager.getHttp('/friends/get-match-criteria',
        token: _authToken);
    if (response.success) {
      return Right(response.data);
    } else {
      return Left(
        ErrorResponse(message: response.message, data: response.data),
      );
    }
  }

  @override
  Future<Either<ErrorResponse, MappedResponse>> getMatches(
      {required String userId}) async {
    final response = await _apiManager
        .getHttp('/friend/get-matches?userId=$userId', token: _authToken);
    if (response.success) {
      return Right(response.data);
    } else {
      return Left(
        ErrorResponse(message: response.message, data: response.data),
      );
    }
  }

  @override
  Future<Either<ErrorResponse, MappedResponse>> updateMatchCriteria(
      MatchCriteriaRequest matchCreteriaRequest) async {
    final response = await _apiManager.postHttp(
        '/friends/match-criteria', matchCreteriaRequest.toJson(),
        token: _authToken);
    if (response.success) {
      return Right(response.data);
    } else {
      return Left(
        ErrorResponse(message: response.message, data: response.data),
      );
    }
  }

  @override
  Future<Either<ErrorResponse, MappedResponse>> populateMatches() async {
    final response = await _apiManager.getHttp('/friends/matches/populate',
        token: _authToken);
    if (response.success) {
      return Right(response.data);
    } else {
      return Left(
        ErrorResponse(message: response.message, data: response.data),
      );
    }
  }

  @override
  Future<MatchCriteriaModel> getMatchCriteriaNew() async {
    var response = await _api.dio.get(
      '/friends/get-match-criteria',
      options: Options(
        contentType: Headers.jsonContentType,
      ),
    );
    if (response.statusCode == 200) {
      return MatchCriteriaModel.fromJson(response.data['data']);
    } else {
      throw ApiException(
          message: response.statusMessage!, statusCode: response.statusCode!);
    }
  }

  @override
  Future<MatchListModel> getMatchesNew({required String userId}) async {
    var response = await _api.dio.get(
      '/friend/get-matches?userId=$userId',
      options: Options(
        contentType: Headers.jsonContentType,
      ),
    );
    if (response.statusCode == 200) {
      return MatchListModel.fromJson(response.data['data']);
    } else {
      throw ApiException(
          message: response.statusMessage!, statusCode: response.statusCode!);
    }
  }

  @override
  Future<void> populateMatchesNew() async {
    var response = await _api.dio.get(
      '/friends/matches/populate',
      options: Options(
        contentType: Headers.jsonContentType,
      ),
    );
    if (response.statusCode == 200) {
    } else {
      throw ApiException(
          message: response.statusMessage!, statusCode: response.statusCode!);
    }
  }

  @override
  Future<void> updateMatchCriteriaNew(
      MatchCriteriaRequest matchCreteriaRequest) async {
    var response = await _api.dio.post('/friends/match-criteria',
        options: Options(
          contentType: Headers.jsonContentType,
        ),
        data: jsonEncode(matchCreteriaRequest.toJson()));
    if (response.statusCode == 200) {
    } else {
      throw ApiException(
          message: response.statusMessage!, statusCode: response.statusCode!);
    }
  }
}
