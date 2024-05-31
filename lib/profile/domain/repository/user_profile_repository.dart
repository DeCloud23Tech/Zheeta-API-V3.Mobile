import 'package:dio/dio.dart';
import 'package:zheeta/activity/data/models/activity_model.dart';
import 'package:zheeta/app/common/type_def.dart';
import 'package:zheeta/profile/data/model/all_user_profile_model.dart';
import 'package:zheeta/profile/data/model/user_profile_model.dart';
import 'package:zheeta/profile/data/model/view_profile_model.dart';
import 'package:zheeta/profile/data/request/create_user_profile_request.dart';
import 'package:zheeta/profile/data/request/update_user_profile_request.dart';

abstract class UserProfileRepository {
  ResultFuture<UserProfileModel> getSingleUserProfileRepo();
  ResultVoid updateUserProfilePictureRepo({
    required String userId,
    required MultipartFile file,
  });
  ResultFuture<AllUserProfileListModel> getAllUsersProfileRepo({
    required int roleType,
    required int pageNumber,
    required int pageSize,
  });
  ResultVoid createUserProfileRepo(CreateUserProfileRequest request);
  ResultVoid updateUserProfileRepo(UpdateUserProfileRequest request);
  ResultFuture<ViewProfileModel> visitUserProfileRepo({required String userId});

  ResultFuture<ActivityListModel> getUserRecentActivity();
}
