import 'package:dartz/dartz.dart';
import 'package:zheeta/authentication/domain/entity/types.dart';
import 'package:zheeta/profile/data/request/create_profile_boost_request.dart';
import 'package:zheeta/profile/domain/entity/type.dart';

abstract class UserProfileBoostDataSource {
  Future<Either<Error, MappedResponse>> createProfileBoost(CreateProfileBoostRequest request);
  Future<Either<Error, MappedResponse>> getMatchedProfileBoost();
  Future<Either<Error, MappedResponse>> getBoostedProfileByAdmin(GetBoostedProfileByAdminRequest request);
}
