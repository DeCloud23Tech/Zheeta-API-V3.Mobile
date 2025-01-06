import 'package:zheeta/profile/data/model/boosted_profile_by_admin_model.dart';
import 'package:zheeta/profile/data/model/matched_profile_boost_model.dart';
import 'package:zheeta/profile/data/request/create_profile_boost_request.dart';
import 'package:zheeta/profile/domain/entity/type.dart';

import '../model/total_matched_count_model.dart';

abstract class UserProfileBoostDataSource {
  Future<ProfileBoostListModel> getProfileBoost();


  Future<void> createProfileBoostNew(CreateProfileBoostRequest request);
  Future<GetTotalMatchedCountResponse> getTotalMatchedCount();
  Future<BoostedProfileByAdminListModel> getBoostedProfileByAdminNew(
      GetBoostedProfileByAdminRequest request);
}
