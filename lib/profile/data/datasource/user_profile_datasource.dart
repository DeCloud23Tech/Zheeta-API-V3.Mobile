import 'package:dio/dio.dart';
import 'package:zheeta/profile/data/model/all_user_profile_model.dart';
import 'package:zheeta/profile/data/model/user_post_model.dart';
import 'package:zheeta/profile/data/model/user_profile_model.dart';
import 'package:zheeta/profile/data/model/view_profile_model.dart';
import 'package:zheeta/profile/data/request/create_user_profile_request.dart';
import 'package:zheeta/profile/data/request/update_user_profile_request.dart';

abstract class UserProfileDataSource {
  Future<UserProfileModel?> getSingleUserProfileNew();

  Future<void> updateUserProfilePictureNew({
    required String userId,
    required MultipartFile file,
  });

  Future<void> uploadCarouselImagesNew({
    required String userId,
    required List<MultipartFile> files,
    String? currentMediaUrl,
  });

  Future<AllUserProfileListModel> getAllUsersProfileNew({
    required int roleType,
    required int pageNumber,
    required int pageSize,
  });

  Future<void> createUserProfileNew(CreateUserProfileRequest request);

  Future<void> updateUserProfileNew(UpdateUserProfileRequest request);

  Future<ViewProfileModel> visitUserProfileNew({required String userId});

  Future<UserPostListModel> getUserActivityNew(
      {required int pageNumber, required int pageSize, String? userId});
}
