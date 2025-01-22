import 'package:dio/dio.dart';
import 'package:zheeta/common/constants/type_def.dart';
import 'package:zheeta/features/profile/data/model/user_profile_model.dart';

abstract class UserProfileRepository {
  ResultFuture<UserProfileModel?> getSingleUserProfileRepo();

// ResultVoid updateUserProfilePictureRepo({
//   required String userId,
//   required MultipartFile file,
// });
//
// ResultVoid uploadCarouselImagesRepo({
//   required String userId,
//   required List<MultipartFile> files,
//   String? currentMediaUrl,
// });
//
// ResultFuture<AllUserProfileListModel> getAllUsersProfileRepo({
//   required int roleType,
//   required int pageNumber,
//   required int pageSize,
// });
//
// ResultVoid createUserProfileRepo(CreateUserProfileRequest request);
//
// ResultVoid updateUserProfileRepo(UpdateUserProfileRequest request);
//
// ResultFuture<ViewProfileModel> visitUserProfileRepo({required String userId});
//
// ResultFuture<UserPostListModel> getUserRecentActivity(
//     {required int pageNumber, required int pageSize, String? userId});
}
