import 'package:dartz/dartz.dart';
import 'package:zheeta/authentication/data/model/country_detail_model.dart';
import 'package:zheeta/authentication/data/model/country_model.dart';
import 'package:zheeta/authentication/domain/entity/types.dart';

abstract class CountryDataSource {
  Future<Either<ErrorResponse, MappedResponse>> getAllCountries();
  Future<Either<ErrorResponse, MappedResponse>> getCountryDetails(
      String countryCode);

  Future<CountryListModel> getAllCountriesNew();
  Future<CountryDetailModel> getCountryDetailsNew(String countryCode);
}
