import '../model/country_detail_model.dart';
import '../model/country_model.dart';

abstract class UserCountryDataSource {
  Future<List<CountryModel>> getAllCountriesNew();
  Future<CountryDetailModel> getCountryDetailsNew(String countryCode);
}
