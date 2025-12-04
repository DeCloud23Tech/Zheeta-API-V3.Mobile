import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:zheeta/core/common/usecase/usecases.dart';
import 'package:zheeta/core/constants/type_def.dart';
import 'package:zheeta/features/profile/data/models/user_profile_model.dart';
import 'package:zheeta/features/profile/data/requests/create_user_profile_request.dart';
import 'package:zheeta/features/profile/data/requests/update_user_profile_request.dart';
import 'package:zheeta/features/profile/domain/repositories/user_profile_repository.dart';

@prod
@LazySingleton()
class GetSingleUserProfile extends UsecaseWithoutParams<UserProfileModel?> {
  const GetSingleUserProfile(this._repo);

  final IUserProfileRepository _repo;

  @override
  ResultFuture<UserProfileModel?> call() async =>
      await _repo.getSingleUserProfileRepo();
}

@prod
@LazySingleton()
class CreateProfile extends UsecaseWithParams<void, CreateUserProfileRequest> {
  const CreateProfile(this._repo);

  final IUserProfileRepository _repo;

  @override
  ResultFuture<void> call(CreateUserProfileRequest param) async =>
      await _repo.createUserProfileRepo(param);
}

@prod
@LazySingleton()
class UpdateUserProfilePicture
    extends UsecaseWithParams<void, UploadProfilePictureParam> {
  const UpdateUserProfilePicture(this._repo);

  final IUserProfileRepository _repo;

  @override
  ResultFuture<void> call(UploadProfilePictureParam param) async => await _repo
      .updateUserProfilePictureRepo(userId: param.userId, file: param.file);
}

@prod
@LazySingleton()
class UpdateUserProfileCarousels
    extends UsecaseWithParams<void, UploadProfileCarouselsParam> {
  const UpdateUserProfileCarousels(this._repo);

  final IUserProfileRepository _repo;

  @override
  ResultFuture<void> call(UploadProfileCarouselsParam params) async =>
      await _repo.uploadCarouselImagesRepo(
        userId: params.userId,
        files: params.file,
        currentMediaUrl: params.currentMediaUrl,
      );
}

@prod
@LazySingleton()
class UpdateUserProfile
    extends UsecaseWithParams<void, UpdateUserProfileRequest> {
  const UpdateUserProfile(this._repo);

  final IUserProfileRepository _repo;

  @override
  ResultFuture<void> call(UpdateUserProfileRequest params) async =>
      await _repo.updateUserProfileRepo(params);
}

class UploadProfilePictureParam {
  String userId;
  MultipartFile file;

  UploadProfilePictureParam({
    required this.userId,
    required this.file,
  });
}

class UploadProfileCarouselsParam {
  String userId;
  List<MultipartFile> file;
  String? currentMediaUrl;

  UploadProfileCarouselsParam({
    required this.userId,
    required this.file,
    this.currentMediaUrl,
  });
}
