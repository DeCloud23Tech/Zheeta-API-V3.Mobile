import 'package:zheeta/authentication/data/model/country_detail_model.dart';
import 'package:zheeta/authentication/data/model/country_model.dart';

abstract class CountryUseCase {
  Future<CountryListModel> getAllCountriesUseCase();
  Future<CountryDetailModel> getCountryDetailsUseCase(String countryCode);
}
