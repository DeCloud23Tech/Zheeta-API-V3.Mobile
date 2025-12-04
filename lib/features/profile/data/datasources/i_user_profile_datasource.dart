import 'package:dio/dio.dart';
import 'package:zheeta/features/profile/data/models/user_profile_model.dart';
import 'package:zheeta/features/profile/data/models/view_profile_model.dart';
import 'package:zheeta/features/profile/data/requests/create_user_profile_request.dart';
import 'package:zheeta/features/profile/data/requests/update_user_profile_request.dart';

abstract class IUserProfileDataSource {
  Future<UserProfileModel?> getSingleUserProfileNew();

  Future<ViewProfileModel> visitUserProfileNew({required String userId});

  Future<void> updateUserProfilePictureNew({
    required String userId,
    required MultipartFile file,
  });

  Future<void> uploadCarouselImagesNew({
    required String userId,
    required List<MultipartFile> files,
    String? currentMediaUrl,
  });

//
// Future<AllUserProfileListModel> getAllUsersProfileNew({
//   required int roleType,
//   required int pageNumber,
//   required int pageSize,
// });
//
  Future<void> createUserProfileNew(CreateUserProfileRequest request);

  Future<void> updateUserProfileNew(UpdateUserProfileRequest request);
}
