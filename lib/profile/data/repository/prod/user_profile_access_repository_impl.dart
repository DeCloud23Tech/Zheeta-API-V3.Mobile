import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:zheeta/app/api/errors/error.dart';
import 'package:zheeta/app/api/errors/exception.dart';
import 'package:zheeta/app/common/type_def.dart';
import 'package:zheeta/profile/data/datasource/user_profile_access_datasource.dart';
import 'package:zheeta/profile/domain/repository/user_profile_access_repository.dart';

@prod
@LazySingleton(as: UserProfileAccessRepository)
class UserProfileAccessRepositoryImpl implements UserProfileAccessRepository {
  final UserProfileAccessDataSource _datasource;
  UserProfileAccessRepositoryImpl(this._datasource);

  @override
  ResultVoid blockAccountRepo(
      {required String userId, required String blockOrUnblockUserId}) async {
    // final result = await _datasource.blockAccount(userId: userId, blockOrUnblockUserId: blockOrUnblockUserId);
    // return result.fold(
    //   (error) => throw new Exception(error.message),
    //   (value) => value,
    // );

    try {
      final result = await _datasource.blockAccountNew(
          userId: userId, blockOrUnblockUserId: blockOrUnblockUserId);
      return right(result);
    } on ApiException catch (ex) {
      return left(ApiError(message: ex.message, statusCode: ex.statusCode));
    } on DioException catch (ex) {
      return left(
          ApiError(message: ex.message!, statusCode: ex.response!.statusCode!));
    }
  }

  @override
  ResultVoid getBlockedUsersRepo(
      {required int pageNumber, required int pageSize}) async {
    // final result = await _datasource.getBlockedUsers(
    //     pageNumber: pageNumber, pageSize: pageSize);
    // return result.fold(
    //   (error) => throw new Exception(error.message),
    //   (value) => value,
    // );
    try {
      final result = await _datasource.getBlockedUsersNew(
          pageNumber: pageNumber, pageSize: pageSize);
      return right(result);
    } on ApiException catch (ex) {
      return left(ApiError(message: ex.message, statusCode: ex.statusCode));
    } on DioException catch (ex) {
      return left(
          ApiError(message: ex.message!, statusCode: ex.response!.statusCode!));
    }
  }

  @override
  ResultVoid unblockAccountRepo(
      {required String userId, required String blockOrUnblockUserId}) async {
    // final result = await _datasource.unblockAccount(
    //     userId: userId, blockOrUnblockUserId: blockOrUnblockUserId);
    // return result.fold(
    //   (error) => throw new Exception(error.message),
    //   (value) => value,
    // );

    try {
      final result = await _datasource.unblockAccountNew(
          userId: userId, blockOrUnblockUserId: blockOrUnblockUserId);
      return right(result);
    } on ApiException catch (ex) {
      return left(ApiError(message: ex.message, statusCode: ex.statusCode));
    } on DioException catch (ex) {
      return left(
          ApiError(message: ex.message!, statusCode: ex.response!.statusCode!));
    }
  }
}
