import 'package:zheeta/authentication/data/model/country_detail_model.dart';
import 'package:zheeta/authentication/data/model/country_model.dart';

abstract class CountryRepository {
  Future<CountryListModel> getAllCountriesRepo();
  Future<CountryDetailModel> getCountryDetailsRepo(String countryCode);
}
