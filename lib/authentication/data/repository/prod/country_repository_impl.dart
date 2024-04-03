import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:zheeta/app/api/errors/error.dart';
import 'package:zheeta/app/api/errors/exception.dart';
import 'package:zheeta/app/common/type_def.dart';
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
  ResultFuture<CountryListModel> getAllCountriesRepo() async {
    try {
      final result = await _datasource.getAllCountriesNew();
      return right(result);
    } on ApiException catch (ex) {
      return left(ApiError(message: ex.message, statusCode: ex.statusCode));
    } on DioException catch (ex) {
      return left(
          ApiError(message: ex.message!, statusCode: ex.response!.statusCode!));
    }
  }

  @override
  ResultFuture<CountryDetailModel> getCountryDetailsRepo(
      String countryCode) async {
    try {
      final result = await _datasource.getCountryDetailsNew(countryCode);
      return right(result);
    } on ApiException catch (ex) {
      return left(ApiError(message: ex.message, statusCode: ex.statusCode));
    } on DioException catch (ex) {
      return left(
          ApiError(message: ex.message!, statusCode: ex.response!.statusCode!));
    }
  }
}
