import 'package:dio/dio.dart';
import 'package:zheeta/profile/data/model/all_user_profile_model.dart';
import 'package:zheeta/profile/data/model/user_profile_model.dart';
import 'package:zheeta/profile/data/model/view_profile_model.dart';
import 'package:zheeta/profile/data/request/create_user_profile_request.dart';
import 'package:zheeta/profile/data/request/update_user_profile_request.dart';

abstract class UserProfileRepository {
  Future<UserProfileModel> getSingleUserProfileRepo();
  updateUserProfilePictureRepo({
    required String userId,
    required MultipartFile file,
  });
  Future<AllUserProfileListModel> getAllUsersProfileRepo({
    required int roleType,
    required int pageNumber,
    required int pageSize,
  });
  createUserProfileRepo(CreateUserProfileRequest request);
  updateUserProfileRepo(UpdateUserProfileRequest request);
  Future<ViewProfileModel> visitUserProfileRepo({required String userId});
}
