import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:zheeta/app/common/exceptions/custom_exception.dart';
import 'package:zheeta/profile/data/datasource/user_profile_datasource.dart';
import 'package:zheeta/profile/data/model/all_user_profile_model.dart';
import 'package:zheeta/profile/data/model/user_profile_model.dart';
import 'package:zheeta/profile/data/request/create_user_profile_request.dart';
import 'package:zheeta/profile/data/request/update_user_profile_request.dart';
import 'package:zheeta/profile/domain/repository/user_profile_repository.dart';

@prod
@LazySingleton(as: UserProfileRepository)
class UserProfileRepositoryImpl implements UserProfileRepository {
  final UserProfileDataSource _datasource;
  UserProfileRepositoryImpl(this._datasource);

  @override
  createUserProfileRepo(CreateUserProfileRequest request) async {
    final result = await _datasource.createUserProfile(request);
    return result.fold(
      (error) => throw new Exception(error.message),
      (value) => value,
    );
  }

  @override
  Future<AllUserProfileListModel> getAllUsersProfileRepo({required int roleType, required int pageNumber, required int pageSize}) async {
    final result = await _datasource.getAllUsersProfile(
      roleType: roleType,
      pageNumber: pageNumber,
      pageSize: pageSize,
    );
    return result.fold(
      (error) => throw new Exception(error.message),
      (value) => AllUserProfileListModel.fromJson(value),
    );
  }

  @override
  Future<UserProfileModel> getSingleUserProfileRepo() async {
    final result = await _datasource.getSingleUserProfile();

    return result.fold(
      (error) => throw new Exception(error.message),
      (value) {
        if (value['data'] == null) {
          throw new UserProfileNotCreatedException('User profile not created');
        } else {
          return UserProfileModel.fromJson(value);
        }
      },
    );
  }

  @override
  updateUserProfilePictureRepo({required String userId, required MultipartFile file}) async {
    final result = await _datasource.updateUserProfilePicture(userId: userId, file: file);
    return result.fold(
      (error) => throw new Exception(error.message),
      (value) => value,
    );
  }

  @override
  updateUserProfileRepo(UpdateUserProfileRequest request) async {
    final result = await _datasource.updateUserProfile(request);
    return result.fold(
      (error) => throw new Exception(error.message),
      (value) => value,
    );
  }

  @override
  visitUserProfileRepo({required String userId}) async {
    final result = await _datasource.visitUserProfile(userId: userId);
    return result.fold(
      (error) => throw new Exception(error.message),
      (value) => value,
    );
  }
}
