import 'package:zheeta/core/constants/type_def.dart';
import 'package:zheeta/features/profile/data/models/boost_insight_model.dart';
import 'package:zheeta/features/profile/data/models/matched_profile_boost_model.dart';
import 'package:zheeta/features/profile/data/requests/create_profile_boost_request.dart';

abstract class IUserProfileBoostRepository {
  ResultFuture<ProfileBoostListModel> getProfileBoost();

  ResultFuture<BoostInsightModel> getProfileBoostInsight(String userId);

  ResultVoid createProfileBoostRepo(CreateProfileBoostRequest request);
}
