import 'package:dartz/dartz.dart';
import 'package:zheeta/authentication/domain/entity/types.dart';

abstract class CountryDataSource {
  Future<Either<ErrorResponse, MappedResponse>> getAllCountries();
  Future<Either<ErrorResponse, MappedResponse>> getCountryDetails(String countryCode);
}
