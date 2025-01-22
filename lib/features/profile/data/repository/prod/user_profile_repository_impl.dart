import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:zheeta/common/constants/type_def.dart';
import 'package:zheeta/common/errors/error.dart';
import 'package:zheeta/common/errors/exception.dart';
import 'package:zheeta/features/profile/data/datasource/user_profile_datasource.dart';
import 'package:zheeta/features/profile/data/model/user_profile_model.dart';
import 'package:zheeta/features/profile/domain/repository/user_profile_repository.dart';

@prod
@LazySingleton(as: UserProfileRepository)
class UserProfileRepositoryImpl implements UserProfileRepository {
  final UserProfileDataSource _datasource;

  UserProfileRepositoryImpl(this._datasource);



  @override
  ResultFuture<UserProfileModel?> getSingleUserProfileRepo() async {
    try {
      final result = await _datasource.getSingleUserProfileNew();

      return right(result);
    } on ApiException catch (ex) {
      return left(ApiError(message: ex.message, statusCode: ex.statusCode));
    } on DioException catch (ex) {
      String? errorMessage;
      if (ex.response?.data?["message"] != null) {
        errorMessage = ex.response?.data?["message"];
      }
      return left(ApiError(
          message: errorMessage!, statusCode: ex.response?.statusCode ?? 500));
    }
  }
}
