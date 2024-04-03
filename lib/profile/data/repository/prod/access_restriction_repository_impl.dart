import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:zheeta/app/api/errors/error.dart';
import 'package:zheeta/app/api/errors/exception.dart';
import 'package:zheeta/app/common/type_def.dart';
import 'package:zheeta/profile/data/datasource/access_restriction_datasource.dart';
import 'package:zheeta/profile/domain/repository/access_restriction_repository.dart';

@prod
@LazySingleton(as: AccessRestrictionRepository)
class AccessRestrictionRepositoryImpl implements AccessRestrictionRepository {
  final AccessRestrictionDataSource _datasource;
  AccessRestrictionRepositoryImpl(this._datasource);

  @override
  ResultVoid disableAccountRepo({required String userId}) async {
    try {
      var result = await _datasource.disableAccountNew(userId: userId);

      return right(result);
    } on ApiException catch (ex) {
      return left(ApiError(message: ex.message, statusCode: ex.statusCode));
    } on DioException catch (ex) {
      return left(
          ApiError(message: ex.message!, statusCode: ex.response!.statusCode!));
    }

    // final result = await _datasource.disableAccount(userId: userId);
    //
    // return result.fold(
    //   (error) => throw new Exception(error.message),
    //   (value) => value,
    // );
  }

  @override
  ResultVoid enableAccountRepo({required String userId}) async {
    try {
      var result = await _datasource.enableAccountNew(userId: userId);

      return right(result);
    } on ApiException catch (ex) {
      return left(ApiError(message: ex.message, statusCode: ex.statusCode));
    } on DioException catch (ex) {
      return left(
          ApiError(message: ex.message!, statusCode: ex.response!.statusCode!));
    }

    // final result = await _datasource.enableAccount(userId: userId);
    // return result.fold(
    //   (error) => throw new Exception(error.message),
    //   (value) => value,
    // );
  }
}
