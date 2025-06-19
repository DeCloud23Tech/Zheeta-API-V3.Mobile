import 'package:zheeta/common/constants/type_def.dart';
import 'package:zheeta/features/profile/data/model/boost_insight_model.dart';
import 'package:zheeta/features/profile/data/model/matched_profile_boost_model.dart';
import 'package:zheeta/features/profile/data/request/create_profile_boost_request.dart';

abstract class UserProfileBoostRepository {
  ResultFuture<ProfileBoostListModel> getProfileBoost();

  ResultFuture<BoostInsightModel> getProfileBoostInsight(String userId);

  ResultVoid createProfileBoostRepo(CreateProfileBoostRequest request);
}
