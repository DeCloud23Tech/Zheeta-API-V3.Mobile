import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:zheeta/activity/data/models/activity_model.dart';
import 'package:zheeta/app/common/type_def.dart';
import 'package:zheeta/app/common/usecase/usecases.dart';
import 'package:zheeta/profile/data/model/all_user_profile_model.dart';
import 'package:zheeta/profile/data/model/user_profile_model.dart';
import 'package:zheeta/profile/data/model/view_profile_model.dart';
import 'package:zheeta/profile/data/request/create_user_profile_request.dart';
import 'package:zheeta/profile/data/request/update_user_profile_request.dart';
import 'package:zheeta/profile/domain/repository/user_profile_repository.dart';

@prod
@LazySingleton()
class CreateProfile extends UsecaseWithParams<void, CreateUserProfileRequest> {
  const CreateProfile(this._repo);

  final UserProfileRepository _repo;

  @override
  ResultFuture<void> call(CreateUserProfileRequest param) async =>
      await _repo.createUserProfileRepo(param);
}

@prod
@LazySingleton()
class GetAllUsersProfile
    extends UsecaseWithParams<AllUserProfileListModel, GetAllUserParams> {
  const GetAllUsersProfile(this._repo);

  final UserProfileRepository _repo;

  @override
  ResultFuture<AllUserProfileListModel> call(GetAllUserParams param) async =>
      await _repo.getAllUsersProfileRepo(
          pageNumber: param.pageNo,
          pageSize: param.pageSize,
          roleType: param.roleType);
}

@prod
@LazySingleton()
class GetSingleUserProfile extends UsecaseWithoutParams<UserProfileModel> {
  const GetSingleUserProfile(this._repo);

  final UserProfileRepository _repo;

  @override
  ResultFuture<UserProfileModel> call() async =>
      await _repo.getSingleUserProfileRepo();
}

@prod
@LazySingleton()
class GetUserRecentActivity extends UsecaseWithoutParams<ActivityListModel> {
  const GetUserRecentActivity(this._repo);

  final UserProfileRepository _repo;

  @override
  ResultFuture<ActivityListModel> call() async =>
      await _repo.getUserRecentActivity();
}

@prod
@LazySingleton()
class GetVisitedUserRecentActivity
    extends UsecaseWithParams<ActivityListModel, String> {
  const GetVisitedUserRecentActivity(this._repo);

  final UserProfileRepository _repo;

  @override
  ResultFuture<ActivityListModel> call(String param) async =>
      await _repo.getVisitedUserRecentActivity(param);
}

@prod
@LazySingleton()
class UpdateUserProfilePicture
    extends UsecaseWithParams<void, UploadProfilePictureParam> {
  const UpdateUserProfilePicture(this._repo);

  final UserProfileRepository _repo;

  @override
  ResultFuture<void> call(UploadProfilePictureParam param) async => await _repo
      .updateUserProfilePictureRepo(userId: param.userId, file: param.file);
}

@prod
@LazySingleton()
class UpdateUserProfile
    extends UsecaseWithParams<void, UpdateUserProfileRequest> {
  const UpdateUserProfile(this._repo);

  final UserProfileRepository _repo;

  @override
  ResultFuture<void> call(UpdateUserProfileRequest param) async =>
      await _repo.updateUserProfileRepo(param);
}

@prod
@LazySingleton()
class VisitUserProfile extends UsecaseWithParams<ViewProfileModel, String> {
  const VisitUserProfile(this._repo);

  final UserProfileRepository _repo;

  @override
  ResultFuture<ViewProfileModel> call(String param) async =>
      await _repo.visitUserProfileRepo(userId: param);
}

class GetAllUserParams {
  int pageNo;
  int pageSize;
  int roleType;

  GetAllUserParams(
      {required this.pageNo, required this.pageSize, required this.roleType});
}

class UploadProfilePictureParam {
  MultipartFile file;
  String userId;

  UploadProfilePictureParam({required this.userId, required this.file});
}
