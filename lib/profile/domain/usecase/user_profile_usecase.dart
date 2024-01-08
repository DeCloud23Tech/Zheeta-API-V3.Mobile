import 'package:dio/dio.dart';
import 'package:zheeta/profile/data/request/create_user_profile_request.dart';
import 'package:zheeta/profile/data/request/update_user_profile_request.dart';

abstract class UserProfileUseCase {
  getSingleUserProfileUseCase();
  updateUserProfilePictureUseCase({
    required String userId,
    required MultipartFile file,
  });
  getAllUsersProfileUseCase({
    required int roleType,
    required int pageNumber,
    required int pageSize,
  });
  createUserProfileUseCase(CreateUserProfileRequest request);
  updateUserProfileUseCase(UpdateUserProfileRequest request);
  visitUserProfileUseCase({required String userId});
}
