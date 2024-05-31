import 'package:zheeta/app/common/type_def.dart';
import 'package:zheeta/authentication/data/model/country_detail_model.dart';
import 'package:zheeta/authentication/data/model/country_model.dart';

abstract class CountryRepository {
  ResultFuture<CountryListModel> getAllCountriesRepo();
  ResultFuture<CountryDetailModel> getCountryDetailsRepo(String countryCode);
}
