import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:zheeta/common/constants/type_def.dart';
import 'package:zheeta/common/errors/error.dart';
import 'package:zheeta/common/errors/exception.dart';
import 'package:zheeta/features/authentication/data/datasource/user_country_datasource.dart';
import 'package:zheeta/features/authentication/data/model/country_detail_model.dart';
import 'package:zheeta/features/authentication/data/model/country_model.dart';
import 'package:zheeta/features/authentication/domain/repository/user_country_repository.dart';


@prod
@LazySingleton(as: UserCountryRepository)
class UserCountryRepositoryImpl implements UserCountryRepository {
  final UserCountryDataSource _datasource;
  UserCountryRepositoryImpl(this._datasource);

  @override
  ResultFuture<List<CountryModel>> getAllCountriesRepo() async {
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
