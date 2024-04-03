// import 'package:injectable/injectable.dart';
// import 'package:zheeta/authentication/data/model/country_detail_model.dart';
// import 'package:zheeta/authentication/data/model/country_model.dart';
// import 'package:zheeta/authentication/domain/repository/country_repository.dart';
// import 'package:zheeta/authentication/domain/usecase/country_usecase.dart';

// @prod
// @LazySingleton(as: CountryUseCase)
// class CountryUseCaseImpl implements CountryUseCase {
//   final CountryRepository _repository;
//   CountryUseCaseImpl(this._repository);

//   @override
//   Future<CountryListModel> getAllCountriesUseCase() {
//     return _repository.getAllCountriesRepo();
//   }

//   @override
//   Future<CountryDetailModel> getCountryDetailsUseCase(String countryCode) {
//     return _repository.getCountryDetailsRepo(countryCode);
//   }
// }
