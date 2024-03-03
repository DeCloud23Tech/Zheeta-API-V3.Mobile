import 'package:dio/dio.dart';
import 'package:zheeta/profile/data/model/all_user_profile_model.dart';
import 'package:zheeta/profile/data/model/user_profile_model.dart';
import 'package:zheeta/profile/data/model/view_profile_model.dart';
import 'package:zheeta/profile/data/request/create_user_profile_request.dart';
import 'package:zheeta/profile/data/request/update_user_profile_request.dart';

abstract class UserProfileUseCase {
  Future<UserProfileModel> getSingleUserProfileUseCase();
  updateUserProfilePictureUseCase({
    required String userId,
    required MultipartFile file,
  });
  Future<AllUserProfileListModel> getAllUsersProfileUseCase({
    required int roleType,
    required int pageNumber,
    required int pageSize,
  });
  createUserProfileUseCase(CreateUserProfileRequest request);
  updateUserProfileUseCase(UpdateUserProfileRequest request);
  Future<ViewProfileModel> visitUserProfileUseCase({required String userId});
}
