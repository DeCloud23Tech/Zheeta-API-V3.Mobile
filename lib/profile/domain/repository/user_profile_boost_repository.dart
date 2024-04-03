import 'package:zheeta/app/common/type_def.dart';
import 'package:zheeta/profile/data/model/boosted_profile_by_admin_model.dart';
import 'package:zheeta/profile/data/model/matched_profile_boost_model.dart';
import 'package:zheeta/profile/data/request/create_profile_boost_request.dart';
import 'package:zheeta/profile/domain/entity/type.dart';

abstract class UserProfileBoostRepository {
  ResultVoid createProfileBoostRepo(CreateProfileBoostRequest request);
  ResultFuture<MatchedProfileBoostListModel> getMatchedProfileBoostRepo();
  ResultFuture<BoostedProfileByAdminListModel> getBoostedProfileByAdminRepo(
      GetBoostedProfileByAdminRequest request);
}
