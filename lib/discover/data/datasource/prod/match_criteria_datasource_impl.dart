import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:zheeta/app/api/api_manager_refactored.dart';
import 'package:zheeta/app/api/errors/exception.dart';
import 'package:zheeta/discover/data/datasource/match_criteria_datasource.dart';
import 'package:zheeta/discover/data/model/match_criteria_model.dart';
import 'package:zheeta/discover/data/model/match_model.dart';
import 'package:zheeta/discover/data/request/match_criteria_request.dart';

@prod
@Singleton(as: MatchCriteriaDataSource)
class MatchCriteriaDataSourceImpl implements MatchCriteriaDataSource {
  final Api _api;
  MatchCriteriaDataSourceImpl(this._api);

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
      '/matches/get-matches?userId=$userId',
      options: Options(
        contentType: Headers.jsonContentType,
      ),
    );
    if (response.statusCode == 200) {
      return MatchListModel.fromJson(response.data);
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
      MatchCriteriaRequest matchCriteriaRequest) async {
    var response = await _api.dio.post('/friends/match-criteria',
        options: Options(
          contentType: Headers.jsonContentType,
        ),
        data: jsonEncode(matchCriteriaRequest.toJson()));
    if (response.statusCode == 200) {
    } else {
      throw ApiException(
          message: response.statusMessage!, statusCode: response.statusCode!);
    }
  }
}
