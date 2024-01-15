import 'package:dartz/dartz.dart';
import 'package:dio/src/multipart_file.dart';
import 'package:injectable/injectable.dart';
import 'package:zheeta/app/api/api_manager.dart';
import 'package:zheeta/app/common/storage/local_storage_impl.dart';
import 'package:zheeta/app/common/storage/storage_keys.dart';
import 'package:zheeta/authentication/domain/entity/types.dart';
import 'package:zheeta/profile/data/datasource/user_profile_datasource.dart';
import 'package:zheeta/profile/data/request/create_user_profile_request.dart';
import 'package:zheeta/profile/data/request/update_user_profile_request.dart';

@prod
@LazySingleton(as: UserProfileDataSource)
class UserProfileDataSourceImpl implements UserProfileDataSource {
  final ApiManager _apiManager;
  late final String? _authToken;

  UserProfileDataSourceImpl(this._apiManager) {
    _getAuthToken();
  }

  _getAuthToken() async {
    _authToken = (await sessionManager.get(SessionManagerKeys.authTokenString)) as String?;
  }

  @override
  Future<Either<Error, MappedResponse>> createUserProfile(CreateUserProfileRequest request) async {
    final response = await _apiManager.postHttp('/user/profile', request.toJson(), token: _authToken);
    if (response.success) {
      return Right(response.data);
    } else {
      return Left(response.message);
    }
  }

  @override
  Future<Either<Error, MappedResponse>> getAllUsersProfile({
    required int roleType,
    required int pageNumber,
    required int pageSize,
  }) async {
    final response = await _apiManager.getHttp('/user/get-all-users?PageNumber=$pageNumber&PageSize=$pageSize&roleType=$roleType', token: _authToken);
    if (response.success) {
      return Right(response.data);
    } else {
      return Left(response.message);
    }
  }

  @override
  Future<Either<Error, MappedResponse>> getSingleUserProfile() async {
    final response = await _apiManager.getHttp('/user/get-single-user-profile', token: _authToken);
    if (response.success) {
      return Right(response.data);
    } else {
      return Left(response.message);
    }
  }

  @override
  Future<Either<Error, MappedResponse>> updateUserProfile(UpdateUserProfileRequest request) async {
    final response = await _apiManager.putHttp('/user/update-user-profile', request.toJson(), token: _authToken);
    if (response.success) {
      return Right(response.data);
    } else {
      return Left(response.message);
    }
  }

  @override
  Future<Either<Error, MappedResponse>> updateUserProfilePicture({
    required String userId,
    required MultipartFile file,
  }) async {
    Map<String, dynamic> payload = {'userId': userId, 'file': file};
    final response = await _apiManager.putHttp('/user/picture', payload, token: _authToken, formdata: true);
    if (response.success) {
      return Right(response.data);
    } else if (response.statusCode == 413) {
      return Left('File size is too large');
    } else {
      return Left(response.message);
    }
  }

  @override
  Future<Either<Error, MappedResponse>> visitUserProfile({required String userId}) async {
    final response = await _apiManager.getHttp('/user/get-user-profile-full-detail/$userId', token: _authToken);
    if (response.success) {
      return Right(response.data);
    } else {
      return Left(response.message);
    }
  }
}
