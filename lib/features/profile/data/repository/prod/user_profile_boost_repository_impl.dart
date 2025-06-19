import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:zheeta/common/constants/type_def.dart';
import 'package:zheeta/common/errors/error.dart';
import 'package:zheeta/common/errors/exception.dart';
import 'package:zheeta/features/profile/data/datasource/user_profile_boost_datasource.dart';
import 'package:zheeta/features/profile/data/model/boost_insight_model.dart';
import 'package:zheeta/features/profile/data/model/matched_profile_boost_model.dart';
import 'package:zheeta/features/profile/data/request/create_profile_boost_request.dart';
import 'package:zheeta/features/profile/domain/repository/user_profile_boost_repository.dart';

@prod
@LazySingleton(as: UserProfileBoostRepository)
class UserProfileBoostRepositoryImpl implements UserProfileBoostRepository {
  final UserProfileBoostDataSource _datasource;

  UserProfileBoostRepositoryImpl(this._datasource);

  @override
  ResultVoid createProfileBoostRepo(CreateProfileBoostRequest request) async {
    try {
      final result = await _datasource.createProfileBoostNew(request);
      return right(result);
    } on ApiException catch (ex) {
      return left(ApiError(message: ex.message, statusCode: ex.statusCode));
    } on DioException catch (ex) {
      return left(
          ApiError(message: ex.response?.data['message'], statusCode: ex.response!.statusCode!));
    }
  }


  @override
  ResultFuture<ProfileBoostListModel> getProfileBoost() async {
    try {
      final result = await _datasource.getProfileBoost();
      return right(result);
    } on ApiException catch (ex) {
      return left(ApiError(message: ex.message, statusCode: ex.statusCode));
    } on DioException catch (ex) {
      return left(
          ApiError(message: ex.response?.data['message'], statusCode: ex.response!.statusCode!));
    }
  }

  @override
  ResultFuture<BoostInsightModel> getProfileBoostInsight(String userId) async {
    try {
      final result = await _datasource.getProfileBoostInsight(userId);
      return right(result);
    } on ApiException catch (ex) {
      return left(ApiError(message: ex.message, statusCode: ex.statusCode));
    } on DioException catch (ex) {
      return left(
          ApiError(message: ex.response?.data['message'], statusCode: ex.response!.statusCode!));
    }
  }
}