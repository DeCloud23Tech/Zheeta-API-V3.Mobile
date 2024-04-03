import 'package:injectable/injectable.dart';
import 'package:zheeta/app/common/type_def.dart';
import 'package:zheeta/app/common/usecase/usecases.dart';
import 'package:zheeta/authentication/data/model/country_detail_model.dart';
import 'package:zheeta/authentication/data/model/country_model.dart';
import 'package:zheeta/authentication/domain/repository/country_repository.dart';

@prod
@LazySingleton()
class GetAllCountries extends UsecaseWithoutParams<CountryListModel> {
  const GetAllCountries(this._repo);

  final CountryRepository _repo;

  @override
  ResultFuture<CountryListModel> call() async =>
      await _repo.getAllCountriesRepo();
}

@prod
@LazySingleton()
class GetCountryDetails extends UsecaseWithParams<CountryDetailModel, String> {
  const GetCountryDetails(this._repo);

  final CountryRepository _repo;

  @override
  ResultFuture<CountryDetailModel> call(String param) async =>
      await _repo.getCountryDetailsRepo(param);
}
