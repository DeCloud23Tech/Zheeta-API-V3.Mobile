import 'package:zheeta/features/profile/data/model/boost_insight_model.dart';
import 'package:zheeta/features/profile/data/model/matched_profile_boost_model.dart';
import 'package:zheeta/features/profile/data/request/create_profile_boost_request.dart';

abstract class UserProfileBoostDataSource {
  Future<ProfileBoostListModel> getProfileBoost();

  Future<void> createProfileBoostNew(CreateProfileBoostRequest request);

  Future<BoostInsightModel> getProfileBoostInsight(String userId);
}
