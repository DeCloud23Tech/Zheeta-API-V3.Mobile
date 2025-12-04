import 'package:zheeta/features/authentication/data/models/country_detail_model.dart';
import 'package:zheeta/features/authentication/data/models/country_model.dart';

abstract class IUserCountryDataSource {
  Future<List<CountryModel>> getAllCountriesNew();
  Future<CountryDetailModel> getCountryDetailsNew(String countryCode);
}
