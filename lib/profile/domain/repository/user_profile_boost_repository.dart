import 'package:zheeta/profile/data/model/boosted_profile_by_admin_model.dart';
import 'package:zheeta/profile/data/model/matched_profile_boost_model.dart';
import 'package:zheeta/profile/data/request/create_profile_boost_request.dart';
import 'package:zheeta/profile/domain/entity/type.dart';

abstract class UserProfileBoostRepository {
  createProfileBoostRepo(CreateProfileBoostRequest request);
  Future<MatchedProfileBoostListModel> getMatchedProfileBoostRepo();
  Future<BoostedProfileByAdminListModel> getBoostedProfileByAdminRepo(GetBoostedProfileByAdminRequest request);
}
