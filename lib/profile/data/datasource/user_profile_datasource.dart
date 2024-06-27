import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:zheeta/activity/data/models/activity_model.dart';
import 'package:zheeta/authentication/domain/entity/types.dart';
import 'package:zheeta/profile/data/model/all_user_profile_model.dart';
import 'package:zheeta/profile/data/model/user_profile_model.dart';
import 'package:zheeta/profile/data/model/view_profile_model.dart';
import 'package:zheeta/profile/data/request/create_user_profile_request.dart';
import 'package:zheeta/profile/data/request/update_user_profile_request.dart';

abstract class UserProfileDataSource {
  Future<Either<ErrorResponse, MappedResponse>> getSingleUserProfile();
  Future<Either<ErrorResponse, MappedResponse>> updateUserProfilePicture({
    required String userId,
    required MultipartFile file,
  });
  Future<Either<ErrorResponse, MappedResponse>> getAllUsersProfile({
    required int roleType,
    required int pageNumber,
    required int pageSize,
  });
  Future<Either<ErrorResponse, MappedResponse>> createUserProfile(
      CreateUserProfileRequest request);
  Future<Either<ErrorResponse, MappedResponse>> updateUserProfile(
      UpdateUserProfileRequest request);
  Future<Either<ErrorResponse, MappedResponse>> visitUserProfile(
      {required String userId});
  Future<Either<ErrorResponse, MappedResponse>> getUserActivity();

  Future<UserProfileModel> getSingleUserProfileNew();
  Future<void> updateUserProfilePictureNew({
    required String userId,
    required MultipartFile file,
  });
  Future<AllUserProfileListModel> getAllUsersProfileNew({
    required int roleType,
    required int pageNumber,
    required int pageSize,
  });
  Future<void> createUserProfileNew(CreateUserProfileRequest request);
  Future<void> updateUserProfileNew(UpdateUserProfileRequest request);
  Future<ViewProfileModel> visitUserProfileNew({required String userId});
  Future<ActivityListModel> getUserActivityNew();
  Future<ActivityListModel> getVisitedUserActivity(String userId);
}
