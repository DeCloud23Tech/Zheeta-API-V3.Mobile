import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:zheeta/core/error/exception.dart';
import 'package:zheeta/core/network/api.dart';
import 'package:zheeta/features/authentication/data/datasources/i_user_country_datasource.dart';
import 'package:zheeta/features/authentication/data/models/country_detail_model.dart';
import 'package:zheeta/features/authentication/data/models/country_model.dart';

@prod
@LazySingleton(as: IUserCountryDataSource)
class CountryDataSourceImpl implements IUserCountryDataSource {
  final Api _api;

  CountryDataSourceImpl(this._api);

  @override
  Future<List<CountryModel>> getAllCountriesNew() async {
    try {
      var response = await _api.dio.get(
        '/userauth/get-all-countries',
        options: Options(
          contentType: Headers.jsonContentType,
        ),
      );
      if (response.statusCode == 200) {
        // Parsing the response correctly
        List<dynamic> countriesJson = response.data['data'];

        // Convert the list of dynamic maps to a list of CountryModel
        List<CountryModel> countries = countriesJson
            .map((country) => CountryModel.fromJson(country))
            .toList();

        return countries;
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
