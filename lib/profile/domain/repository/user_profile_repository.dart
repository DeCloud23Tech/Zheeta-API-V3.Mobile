import 'package:dio/dio.dart';
import 'package:zheeta/profile/data/request/create_user_profile_request.dart';
import 'package:zheeta/profile/data/request/update_user_profile_request.dart';

abstract class UserProfileRepository {
  getSingleUserProfileRepo();
  updateUserProfilePictureRepo({
    required String userId,
    required MultipartFile file,
  });
  getAllUsersProfileRepo({
    required int roleType,
    required int pageNumber,
    required int pageSize,
  });
  createUserProfileRepo(CreateUserProfileRequest request);
  updateUserProfileRepo(UpdateUserProfileRequest request);
  visitUserProfileRepo({required String userId});
}
