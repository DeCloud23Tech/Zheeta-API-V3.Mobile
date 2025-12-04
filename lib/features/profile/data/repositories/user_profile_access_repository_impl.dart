import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:zheeta/core/constants/type_def.dart';
import 'package:zheeta/core/error/error.dart';
import 'package:zheeta/core/error/exception.dart';
import 'package:zheeta/features/profile/data/datasources/i_user_profile_access_datasource.dart';
import 'package:zheeta/features/profile/data/models/blocked_user_model.dart';
import 'package:zheeta/features/profile/domain/repositories/user_profile_access_repository.dart';

@prod
@LazySingleton(as: IUserProfileAccessRepository)
class UserProfileAccessRepositoryImpl implements IUserProfileAccessRepository {
  final IUserProfileAccessDataSource _datasource;
  UserProfileAccessRepositoryImpl(this._datasource);

  @override
  ResultFuture<bool> blockAccountRepo(
      {required String userId, required String blockOrUnblockUserId}) async {
    try {
      final result = await _datasource.blockAccountNew(
          userId: userId, blockOrUnblockUserId: blockOrUnblockUserId);
      return right(result);
    } on ApiException catch (ex) {
      return left(ApiError(message: ex.message, statusCode: ex.statusCode));
    } on DioException catch (ex) {
      return left(ApiError(
          message: ex.response?.data['message'],
          statusCode: ex.response!.statusCode!));
    }
  }

  @override
  ResultFuture<BlockedUsersResponse> getBlockedUsersRepo(
      {required int pageNumber, required int pageSize}) async {
    try {
      final result = await _datasource.getBlockedUsersNew(
          pageNumber: pageNumber, pageSize: pageSize);
      return right(result);
    } on ApiException catch (ex) {
      return left(ApiError(message: ex.message, statusCode: ex.statusCode));
    } on DioException catch (ex) {
      return left(ApiError(
          message: ex.response?.data['message'],
          statusCode: ex.response!.statusCode!));
    }
  }

  @override
  ResultFuture<bool> unblockAccountRepo(
      {required String userId, required String blockOrUnblockUserId}) async {
    try {
      final result = await _datasource.unblockAccountNew(
          userId: userId, blockOrUnblockUserId: blockOrUnblockUserId);
      return right(result);
    } on ApiException catch (ex) {
      return left(ApiError(message: ex.message, statusCode: ex.statusCode));
    } on DioException catch (ex) {
      return left(ApiError(
          message: ex.response?.data['message'],
          statusCode: ex.response!.statusCode!));
    }
  }
}
