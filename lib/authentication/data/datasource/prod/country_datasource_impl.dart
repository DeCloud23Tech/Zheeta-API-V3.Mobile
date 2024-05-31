import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:zheeta/app/api/api_manager.dart';
import 'package:zheeta/app/api/api_manager_refactored.dart';
import 'package:zheeta/app/api/errors/exception.dart';
import 'package:zheeta/app/api/formatted_response.dart';
import 'package:zheeta/authentication/data/datasource/country_datasource.dart';
import 'package:zheeta/authentication/data/model/country_detail_model.dart';
import 'package:zheeta/authentication/data/model/country_model.dart';
import 'package:zheeta/authentication/domain/entity/types.dart';

@prod
@LazySingleton(as: CountryDataSource)
class CountryDataSourceImpl implements CountryDataSource {
  final ApiManager _apiManager;
  final Api _api;

  CountryDataSourceImpl(this._apiManager, this._api);

  @override
  Future<Either<ErrorResponse, MappedResponse>> getAllCountries() async {
    final response = await _apiManager.getHttp('/userauth/get-all-countries');
    if (response.success) {
      return Right(response.data);
    } else {
      return Left(
        ErrorResponse(message: response.message, data: response.data),
      );
    }
  }

  @override
  Future<Either<InvalidResponse, MappedResponse>> getCountryDetails(
      String countryCode) async {
    final response = await _apiManager
        .getHttp('/userauth/get-all-country-details/$countryCode');
    if (response.success) {
      return Right(response.data);
    } else {
      return Left(
        ErrorResponse(message: response.message, data: response.data),
      );
    }
  }

  @override
  Future<CountryListModel> getAllCountriesNew() async {
    try {
      var response = await _api.dio.get(
        '/userauth/get-all-countries',
        options: Options(
          contentType: Headers.jsonContentType,
        ),
      );
      if (response.statusCode == 200) {
        return CountryListModel.fromJson(response.data['data']);
      } else {
        throw ApiException(
            message: response.statusMessage!, statusCode: response.statusCode!);
      }
    } on DioException catch (ex) {
      throw ApiException(
          message: ex.response!.statusMessage!,
          statusCode: ex.response!.statusCode!);
    }
  }

  @override
  Future<CountryDetailModel> getCountryDetailsNew(String countryCode) async {
    try {
      var response = await _api.dio.get(
        '/userauth/get-all-country-details/$countryCode',
        options: Options(
          contentType: Headers.jsonContentType,
        ),
      );
      if (response.statusCode == 200) {
        return CountryDetailModel.fromJson(response.data['data']);
      } else {
        throw ApiException(
            message: response.statusMessage!, statusCode: response.statusCode!);
      }
    } on DioException catch (ex) {
      throw ApiException(
          message: ex.response!.statusMessage!,
          statusCode: ex.response!.statusCode!);
    }
  }
}
