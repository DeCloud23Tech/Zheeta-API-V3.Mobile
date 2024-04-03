import 'package:dartz/dartz.dart';
import 'package:zheeta/authentication/domain/entity/types.dart';
import 'package:zheeta/profile/data/model/boosted_profile_by_admin_model.dart';
import 'package:zheeta/profile/data/model/matched_profile_boost_model.dart';
import 'package:zheeta/profile/data/request/create_profile_boost_request.dart';
import 'package:zheeta/profile/domain/entity/type.dart';

abstract class UserProfileBoostDataSource {
  Future<Either<ErrorResponse, MappedResponse>> createProfileBoost(
      CreateProfileBoostRequest request);
  Future<Either<ErrorResponse, MappedResponse>> getMatchedProfileBoost();
  Future<Either<ErrorResponse, MappedResponse>> getBoostedProfileByAdmin(
      GetBoostedProfileByAdminRequest request);

  Future<void> createProfileBoostNew(CreateProfileBoostRequest request);
  Future<MatchedProfileBoostListModel> getMatchedProfileBoostNew();
  Future<BoostedProfileByAdminListModel> getBoostedProfileByAdminNew(
      GetBoostedProfileByAdminRequest request);
}
