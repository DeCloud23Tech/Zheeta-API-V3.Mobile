import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:zheeta/app/api/api_manager.dart';
import 'package:zheeta/authentication/data/datasource/country_datasource.dart';
import 'package:zheeta/authentication/domain/entity/types.dart';

@prod
@LazySingleton(as: CountryDataSource)
class CountryDatasourceImpl implements CountryDataSource {
  final ApiManager _apiManager;

  CountryDatasourceImpl(this._apiManager);

  @override
  Future<Either<Error, MappedResponse>> getAllCountries() async {
    final response = await _apiManager.getHttp('/userauth/get-all-countries');
    if (response.success) {
      return Right(response.data);
    } else {
      return Left(response.message);
    }
  }

  @override
  Future<Either<Error, MappedResponse>> getCountryDetails(String countryCode) async {
    final response = await _apiManager.getHttp('/userauth/get-all-country-details/$countryCode');
    if (response.success) {
      return Right(response.data);
    } else {
      return Left(response.message);
    }
  }
}
