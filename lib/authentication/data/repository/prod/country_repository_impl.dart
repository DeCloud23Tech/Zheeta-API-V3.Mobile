import 'package:injectable/injectable.dart';
import 'package:zheeta/authentication/data/datasource/country_datasource.dart';
import 'package:zheeta/authentication/data/model/country_detail_model.dart';
import 'package:zheeta/authentication/data/model/country_model.dart';
import 'package:zheeta/authentication/domain/repository/country_repository.dart';

@prod
@LazySingleton(as: CountryRepository)
class CountryRepositoryImpl implements CountryRepository {
  final CountryDataSource _datasource;
  CountryRepositoryImpl(this._datasource);

  @override
  Future<CountryListModel> getAllCountriesRepo() async {
    final result = await _datasource.getAllCountries();
    return result.fold(
      (error) => throw new Exception(error.message),
      (value) => CountryListModel.fromJson(value['data']),
    );
  }

  @override
  Future<CountryDetailModel> getCountryDetailsRepo(String countryCode) async {
    final result = await _datasource.getCountryDetails(countryCode);
    return result.fold(
      (error) => throw new Exception(error.message),
      (value) => CountryDetailModel.fromJson(value['data']),
    );
  }
}
