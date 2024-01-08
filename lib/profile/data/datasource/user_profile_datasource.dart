import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:zheeta/authentication/domain/entity/types.dart';
import 'package:zheeta/profile/data/request/create_user_profile_request.dart';
import 'package:zheeta/profile/data/request/update_user_profile_request.dart';

abstract class UserProfileDataSource {
  Future<Either<Error, MappedResponse>> getSingleUserProfile();
  Future<Either<Error, MappedResponse>> updateUserProfilePicture({
    required String userId,
    required MultipartFile file,
  });
  Future<Either<Error, MappedResponse>> getAllUsersProfile({
    required int roleType,
    required int pageNumber,
    required int pageSize,
  });
  Future<Either<Error, MappedResponse>> createUserProfile(CreateUserProfileRequest request);
  Future<Either<Error, MappedResponse>> updateUserProfile(UpdateUserProfileRequest request);
  Future<Either<Error, MappedResponse>> visitUserProfile({required String userId});
}
