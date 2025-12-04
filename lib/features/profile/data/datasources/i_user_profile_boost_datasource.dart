import 'package:zheeta/features/profile/data/models/boost_insight_model.dart';
import 'package:zheeta/features/profile/data/models/matched_profile_boost_model.dart';
import 'package:zheeta/features/profile/data/requests/create_profile_boost_request.dart';

abstract class IUserProfileBoostDataSource {
  Future<ProfileBoostListModel> getProfileBoost();

  Future<void> createProfileBoostNew(CreateProfileBoostRequest request);

  Future<BoostInsightModel> getProfileBoostInsight(String userId);
}
