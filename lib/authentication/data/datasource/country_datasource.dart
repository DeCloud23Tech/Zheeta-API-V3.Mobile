import 'package:dartz/dartz.dart';
import 'package:zheeta/authentication/domain/entity/types.dart';

abstract class CountryDataSource {
  Future<Either<Error, MappedResponse>> getAllCountries();
  Future<Either<Error, MappedResponse>> getCountryDetails(String countryCode);
}
