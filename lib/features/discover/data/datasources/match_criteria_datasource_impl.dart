import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:zheeta/core/network/api.dart';
import 'package:zheeta/features/discover/data/datasources/i_match_criteria_datasource.dart';
import 'package:zheeta/features/discover/data/models/match_criteria_model.dart';
import 'package:zheeta/features/discover/data/models/match_model.dart';
import 'package:zheeta/features/discover/data/requests/match_criteria_request.dart';

@prod
@Singleton(as: IMatchCriteriaDataSource)
class MatchCriteriaDataSourceImpl implements IMatchCriteriaDataSource {
  final Api _api;

  MatchCriteriaDataSourceImpl(this._api);

  @override
  Future<MatchCriteriaModel> getMatchCriteriaNew(
      {required String userId}) async {
    var response = await _api.dio.get(
      '/matches/criteria/$userId',
      options: Options(
        contentType: Headers.jsonContentType,
      ),
    );
    if (response.statusCode == 200) {
      return MatchCriteriaModel.fromJson(response.data['data']);
    } else {
      throw DioException.badResponse(
          statusCode: response.data?['statusCode'] ?? 400,
          requestOptions: response.requestOptions,
          response: response);
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
      throw DioException.badResponse(
          statusCode: response.data?['statusCode'] ?? 400,
          requestOptions: response.requestOptions,
          response: response);
    }
  }

  @override
  Future<void> populateMatchesNew() async {
    var response = await _api.dio.get(
      '/matches/populate',
      options: Options(
        contentType: Headers.jsonContentType,
      ),
    );
    if (response.statusCode == 200) {
    } else {
      throw DioException.badResponse(
          statusCode: response.data?['statusCode'] ?? 400,
          requestOptions: response.requestOptions,
          response: response);
    }
  }

  @override
  Future<void> updateMatchCriteriaNew(
      MatchCriteriaRequest matchCriteriaRequest) async {
    var response = await _api.dio.post('/matches/criteria',
        options: Options(
          contentType: Headers.jsonContentType,
        ),
        data: matchCriteriaRequest.toJson());
    if (response.statusCode == 200) {
    } else {
      throw DioException.badResponse(
          statusCode: response.data?['statusCode'] ?? 400,
          requestOptions: response.requestOptions,
          response: response);
    }
  }

  @override
  Future<void> ignoreBulkMatches(
      {required List<String> ignoreUsersList}) async {
    var response = await _api.dio.post(
      '/matches/ignore-bulk-matches',
      options: Options(
        contentType: Headers.jsonContentType,
      ),
      data: {
        'ignoreUsersList': ignoreUsersList,
      },
    );

    if (response.statusCode == 200) {
      print(response.data['message']);
    } else {
      throw DioException.badResponse(
        statusCode: response.data?['statusCode'] ?? response.statusCode ?? 400,
        requestOptions: response.requestOptions,
        response: response,
      );
    }
  }
}
