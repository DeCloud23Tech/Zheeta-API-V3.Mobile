import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:zheeta/common/constants/type_def.dart';
import 'package:zheeta/common/errors/error.dart';
import 'package:zheeta/common/errors/exception.dart';
import 'package:zheeta/features/profile/data/datasource/user_profile_datasource.dart';
import 'package:zheeta/features/profile/data/model/user_profile_model.dart';
import 'package:zheeta/features/profile/data/model/view_profile_model.dart';
import 'package:zheeta/features/profile/data/request/create_user_profile_request.dart';
import 'package:zheeta/features/profile/data/request/update_user_profile_request.dart';
import 'package:zheeta/features/profile/domain/repository/user_profile_repository.dart';

@prod
@LazySingleton(as: UserProfileRepository)
class UserProfileRepositoryImpl implements UserProfileRepository {
  final UserProfileDataSource _datasource;

  UserProfileRepositoryImpl(this._datasource);

  @override
  ResultFuture<UserProfileModel?> getSingleUserProfileRepo() async {
    try {
      final result = await _datasource.getSingleUserProfileNew();

      return right(result);
    } on ApiException catch (ex) {
      return left(ApiError(message: ex.message, statusCode: ex.statusCode));
    } on DioException catch (ex) {
      String? errorMessage;
      if (ex.response?.data?["message"] != null) {
        errorMessage = ex.response?.data?["message"];
      }
      return left(
          ApiError(message: ex.response?.data['message'], statusCode: ex.response!.statusCode!));
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
      return left(
          ApiError(message: ex.response?.data['message'], statusCode: ex.response!.statusCode!));
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
      return left(
          ApiError(message: ex.response?.data['message'], statusCode: ex.response!.statusCode!));
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
      return left(
          ApiError(message: ex.response?.data['message'], statusCode: ex.response!.statusCode!));
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
      return left(
          ApiError(message: ex.response?.data['message'], statusCode: ex.response!.statusCode!));
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
      return left(
          ApiError(message: ex.response?.data['message'], statusCode: ex.response!.statusCode!));
    }
  }
}
