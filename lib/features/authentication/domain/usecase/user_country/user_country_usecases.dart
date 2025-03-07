import 'package:injectable/injectable.dart';
import 'package:zheeta/common/constants/type_def.dart';
import 'package:zheeta/common/usecase/usecases.dart';
import 'package:zheeta/features/authentication/data/model/country_detail_model.dart';
import 'package:zheeta/features/authentication/data/model/country_model.dart';
import 'package:zheeta/features/authentication/domain/repository/user_country_repository.dart';

@prod
@LazySingleton()
class GetAllCountries extends UsecaseWithoutParams<List<CountryModel>> {
  const GetAllCountries(this._repo);

  final UserCountryRepository _repo;

  @override
  ResultFuture<List<CountryModel>> call() async =>
      await _repo.getAllCountriesRepo();
}

@prod
@LazySingleton()
class GetCountryDetails extends UsecaseWithParams<CountryDetailModel, String> {
  const GetCountryDetails(this._repo);

  final UserCountryRepository _repo;

  @override
  ResultFuture<CountryDetailModel> call(String param) async =>
      await _repo.getCountryDetailsRepo(param);
}
