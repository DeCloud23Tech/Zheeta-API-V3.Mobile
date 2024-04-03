import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:zheeta/app/api/errors/error.dart';
import 'package:zheeta/app/api/errors/exception.dart';
import 'package:zheeta/app/common/type_def.dart';
import 'package:zheeta/profile/data/datasource/user_profile_boost_datasource.dart';
import 'package:zheeta/profile/data/model/boosted_profile_by_admin_model.dart';
import 'package:zheeta/profile/data/model/matched_profile_boost_model.dart';
import 'package:zheeta/profile/data/request/create_profile_boost_request.dart';
import 'package:zheeta/profile/domain/entity/type.dart';
import 'package:zheeta/profile/domain/repository/user_profile_boost_repository.dart';

@prod
@LazySingleton(as: UserProfileBoostRepository)
class UserProfileBoostRepositoryImpl implements UserProfileBoostRepository {
  final UserProfileBoostDataSource _datasource;
  UserProfileBoostRepositoryImpl(this._datasource);

  @override
  ResultVoid createProfileBoostRepo(CreateProfileBoostRequest request) async {
    // final result = await _datasource.createProfileBoost(request);
    // return result.fold(
    //   (error) => throw new Exception(error.message),
    //   (value) => value,
    // );

    try {
      final result = await _datasource.createProfileBoostNew(request);
      return right(result);
    } on ApiException catch (ex) {
      return left(ApiError(message: ex.message, statusCode: ex.statusCode));
    } on DioException catch (ex) {
      return left(
          ApiError(message: ex.message!, statusCode: ex.response!.statusCode!));
    }
  }

  @override
  ResultFuture<BoostedProfileByAdminListModel> getBoostedProfileByAdminRepo(
      GetBoostedProfileByAdminRequest request) async {
    try {
      final result = await _datasource.getBoostedProfileByAdminNew(request);
      return right(result);
    } on ApiException catch (ex) {
      return left(ApiError(message: ex.message, statusCode: ex.statusCode));
    } on DioException catch (ex) {
      return left(
          ApiError(message: ex.message!, statusCode: ex.response!.statusCode!));
    }

    // final result = await _datasource.getBoostedProfileByAdmin(request);
    // return result.fold(
    //   (error) => throw new Exception(error.message),
    //   (value) => BoostedProfileByAdminListModel.fromJson(value),
    // );
  }

  @override
  ResultFuture<MatchedProfileBoostListModel>
      getMatchedProfileBoostRepo() async {
    try {
      final result = await _datasource.getMatchedProfileBoostNew();
      return right(result);
    } on ApiException catch (ex) {
      return left(ApiError(message: ex.message, statusCode: ex.statusCode));
    } on DioException catch (ex) {
      return left(
          ApiError(message: ex.message!, statusCode: ex.response!.statusCode!));
    }
  }
}
