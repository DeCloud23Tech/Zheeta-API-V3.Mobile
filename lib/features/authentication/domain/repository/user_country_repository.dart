import 'package:zheeta/common/constants/type_def.dart';
import 'package:zheeta/features/authentication/data/model/country_detail_model.dart';
import 'package:zheeta/features/authentication/data/model/country_model.dart';


abstract class UserCountryRepository {
  ResultFuture<List<CountryModel>> getAllCountriesRepo();
  ResultFuture<CountryDetailModel> getCountryDetailsRepo(String countryCode);
}
