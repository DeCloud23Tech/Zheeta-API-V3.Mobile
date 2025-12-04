import 'package:zheeta/core/constants/type_def.dart';
import 'package:zheeta/features/authentication/data/models/country_detail_model.dart';
import 'package:zheeta/features/authentication/data/models/country_model.dart';

abstract class IUserCountryRepository {
  ResultFuture<List<CountryModel>> getAllCountriesRepo();
  ResultFuture<CountryDetailModel> getCountryDetailsRepo(String countryCode);
}
