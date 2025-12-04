import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:zheeta/core/constants/type_def.dart';
import 'package:zheeta/core/error/error.dart';
import 'package:zheeta/core/error/exception.dart';
import 'package:zheeta/features/profile/data/datasources/i_user_profile_boost_datasource.dart';
import 'package:zheeta/features/profile/data/models/boost_insight_model.dart';
import 'package:zheeta/features/profile/data/models/matched_profile_boost_model.dart';
import 'package:zheeta/features/profile/data/requests/create_profile_boost_request.dart';
import 'package:zheeta/features/profile/domain/repositories/user_profile_boost_repository.dart';

@prod
@LazySingleton(as: IUserProfileBoostRepository)
class UserProfileBoostRepositoryImpl implements IUserProfileBoostRepository {
  final IUserProfileBoostDataSource _datasource;

  UserProfileBoostRepositoryImpl(this._datasource);

  @override
  ResultVoid createProfileBoostRepo(CreateProfileBoostRequest request) async {
    try {
      final result = await _datasource.createProfileBoostNew(request);
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
  ResultFuture<ProfileBoostListModel> getProfileBoost() async {
    try {
      final result = await _datasource.getProfileBoost();
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
  ResultFuture<BoostInsightModel> getProfileBoostInsight(String userId) async {
    try {
      final result = await _datasource.getProfileBoostInsight(userId);
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
