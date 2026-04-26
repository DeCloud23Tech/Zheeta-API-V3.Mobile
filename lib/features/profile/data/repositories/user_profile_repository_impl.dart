import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:zheeta/core/constants/type_def.dart';
import 'package:zheeta/core/error/error.dart';
import 'package:zheeta/core/error/exception.dart';
import 'package:zheeta/features/profile/data/datasources/i_user_profile_datasource.dart';
import 'package:zheeta/features/profile/data/models/user_profile_model.dart';
import 'package:zheeta/features/profile/data/models/view_profile_model.dart';
import 'package:zheeta/features/profile/data/requests/create_user_profile_request.dart';
import 'package:zheeta/features/profile/data/requests/update_user_profile_request.dart';
import 'package:zheeta/features/profile/domain/repositories/user_profile_repository.dart';

@prod
@LazySingleton(as: IUserProfileRepository)
class UserProfileRepositoryImpl implements IUserProfileRepository {
  final IUserProfileDataSource _datasource;

  UserProfileRepositoryImpl(this._datasource);

  @override
  ResultFuture<UserProfileModel?> getSingleUserProfileRepo({
    bool isRefresh = false,
  }) async {
    try {
      final result =
          await _datasource.getSingleUserProfileNew(isRefresh: isRefresh);

      return right(result);
    } on ApiException catch (ex) {
      return left(ApiError(message: ex.message, statusCode: ex.statusCode));
    } on DioException catch (ex) {
      String? errorMessage;
      if (ex.response?.data?["message"] != null) {
        errorMessage = ex.response?.data?["message"];
      }
      return left(ApiError(
          message: ex.response?.data['message'],
          statusCode: ex.response!.statusCode!));
    }
  }

  @override
  ResultFuture<ViewProfileModel> visitUserProfileRepo(
      {required String userId}) async {
    try {
      final result = await _datasource.visitUserProfileNew(userId: userId);

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
  ResultVoid createUserProfileRepo(CreateUserProfileRequest request) async {
    try {
      final result = await _datasource.createUserProfileNew(request);

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
  ResultVoid updateUserProfilePictureRepo(
      {required String userId, required MultipartFile file}) async {
    try {
      final result = await _datasource.updateUserProfilePictureNew(
          userId: userId, file: file);

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
  ResultVoid updateUserProfileRepo(UpdateUserProfileRequest request) async {
    try {
      final result = await _datasource.updateUserProfileNew(request);
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
  ResultVoid uploadCarouselImagesRepo({
    required String userId,
    required List<MultipartFile> files,
    currentMediaUrl,
  }) async {
    try {
      final result = await _datasource.uploadCarouselImagesNew(
          userId: userId, files: files, currentMediaUrl: currentMediaUrl);
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
