import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:zheeta/common/constants/type_def.dart';
import 'package:zheeta/common/usecase/usecases.dart';
import 'package:zheeta/features/profile/data/model/user_profile_model.dart';
import 'package:zheeta/features/profile/domain/repository/user_profile_repository.dart';

@prod
@LazySingleton()
class GetSingleUserProfile extends UsecaseWithoutParams<UserProfileModel?> {
  const GetSingleUserProfile(this._repo);

  final UserProfileRepository _repo;

  @override
  ResultFuture<UserProfileModel?> call() async =>
      await _repo.getSingleUserProfileRepo();
}
