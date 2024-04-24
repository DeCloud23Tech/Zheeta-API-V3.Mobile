import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:zheeta/activity/data/models/activity_model.dart';
import 'package:zheeta/app/api/errors/error.dart';
import 'package:zheeta/app/api/errors/exception.dart';
import 'package:zheeta/app/common/exceptions/custom_exception.dart';
import 'package:zheeta/app/common/type_def.dart';
import 'package:zheeta/profile/data/datasource/user_profile_datasource.dart';
import 'package:zheeta/profile/data/model/all_user_profile_model.dart';
import 'package:zheeta/profile/data/model/user_profile_model.dart';
import 'package:zheeta/profile/data/model/view_profile_model.dart';
import 'package:zheeta/profile/data/request/create_user_profile_request.dart';
import 'package:zheeta/profile/data/request/update_user_profile_request.dart';
import 'package:zheeta/profile/domain/repository/user_profile_repository.dart';

@prod
@LazySingleton(as: UserProfileRepository)
class UserProfileRepositoryImpl implements UserProfileRepository {
  final UserProfileDataSource _datasource;
  UserProfileRepositoryImpl(this._datasource);

  @override
  ResultVoid createUserProfileRepo(CreateUserProfileRequest request) async {
    try {
      final result = await _datasource.createUserProfileNew(request);

      return right(result);
    } on ApiException catch (ex) {
      return left(ApiError(message: ex.message, statusCode: ex.statusCode));
    } on DioException catch (ex) {
      return left(
          ApiError(message: ex.message!, statusCode: ex.response!.statusCode!));
    }
    // return result.fold(
    //   (error) {
    //     if (error.errors != null) {
    //       throw new CreateProfileValidationException(
    //           originCityException: error.errors['OriginCity'],
    //           originCountryException: error.errors['OriginCountry']);
    //     } else {
    //       throw new Exception(error.message);
    //     }
    //   },
    //   (value) => value,
    // );
  }

  @override
  ResultFuture<AllUserProfileListModel> getAllUsersProfileRepo(
      {required int roleType,
      required int pageNumber,
      required int pageSize}) async {
    try {
      final result = await _datasource.getAllUsersProfileNew(
        roleType: roleType,
        pageNumber: pageNumber,
        pageSize: pageSize,
      );

      return right(result);
    } on ApiException catch (ex) {
      return left(ApiError(message: ex.message, statusCode: ex.statusCode));
    } on DioException catch (ex) {
      return left(
          ApiError(message: ex.message!, statusCode: ex.response!.statusCode!));
    }
    // return result.fold(
    //   (error) => throw new Exception(error.message),
    //   (value) => AllUserProfileListModel.fromJson(value),
    // );
  }

  @override
  ResultFuture<UserProfileModel> getSingleUserProfileRepo() async {
    try {
      final result = await _datasource.getSingleUserProfileNew();

      return right(result);
    } on ApiException catch (ex) {
      return left(ApiError(message: ex.message, statusCode: ex.statusCode));
    } on DioException catch (ex) {
      String errorMessage = "Error Logging In";
      if (ex.response?.data?["message"] != null) {
        errorMessage = ex.response?.data?["message"];
      }
      return left(ApiError(
          message: errorMessage, statusCode: ex.response!.statusCode!));
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
          ApiError(message: ex.message!, statusCode: ex.response!.statusCode!));
    }
    // return result.fold(
    //   (error) => throw new Exception(error.message),
    //   (value) => value,
    // );
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
          ApiError(message: ex.message!, statusCode: ex.response!.statusCode!));
    }

    // return result.fold(
    //   (error) => throw new Exception(error.message),
    //   (value) => value,
    // );
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
          ApiError(message: ex.message!, statusCode: ex.response!.statusCode!));
    }

    // return result.fold(
    //   (error) => throw new Exception(error.message),
    //   (value) => ViewProfileModel.fromJson(value),
    // );
  }

  @override
  ResultFuture<ActivityListModel> getUserRecentActivity() async {
    try {
      final result = await _datasource.getUserActivityNew();
      return right(result);
    } on ApiException catch (ex) {
      return left(ApiError(message: ex.message, statusCode: ex.statusCode));
    } on DioException catch (ex) {
      return left(
          ApiError(message: ex.message!, statusCode: ex.response!.statusCode!));
    }
    // return result.fold(
    //   (error) => throw new Exception(error.message),
    //   (value) {
    //     //var theData = value['data'];
    //     //theData.map(activity => ActivityModel.fromJson(activity)).toList();
    //     var theList = ActivityListModel.fromJson(value);

    //     return theList;
    //   },
    // );
  }
}
