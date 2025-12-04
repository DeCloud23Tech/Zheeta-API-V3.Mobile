import 'package:dio/dio.dart';
import 'package:zheeta/core/constants/type_def.dart';
import 'package:zheeta/features/profile/data/models/address_from_location_model.dart';
import 'package:zheeta/features/profile/data/models/user_profile_model.dart';
import 'package:zheeta/features/profile/data/models/view_profile_model.dart';
import 'package:zheeta/features/profile/data/requests/create_user_profile_request.dart';
import 'package:zheeta/features/profile/data/requests/update_user_profile_request.dart';

abstract class IUserProfileRepository {
  ResultFuture<UserProfileModel?> getSingleUserProfileRepo();

  ResultFuture<ViewProfileModel> visitUserProfileRepo({required String userId});

  ResultVoid updateUserProfilePictureRepo({
    required String userId,
    required MultipartFile file,
  });

  ResultVoid uploadCarouselImagesRepo({
    required String userId,
    required List<MultipartFile> files,
    String? currentMediaUrl,
  });

// ResultFuture<AllUserProfileListModel> getAllUsersProfileRepo({
//   required int roleType,
//   required int pageNumber,
//   required int pageSize,
// });
//
  ResultVoid createUserProfileRepo(CreateUserProfileRequest request);

  ResultVoid updateUserProfileRepo(UpdateUserProfileRequest request);

// ResultFuture<UserPostListModel> getUserRecentActivity(
//     {required int pageNumber, required int pageSize, String? userId});
}
