import 'package:injectable/injectable.dart';
import 'package:zheeta/common/constants/type_def.dart';
import 'package:zheeta/common/usecase/usecases.dart';
import 'package:zheeta/features/profile/data/model/boost_insight_model.dart';
import 'package:zheeta/features/profile/data/model/matched_profile_boost_model.dart';
import 'package:zheeta/features/profile/data/request/create_profile_boost_request.dart';
import 'package:zheeta/features/profile/domain/repository/user_profile_boost_repository.dart';

@prod
@LazySingleton()
class CreateProfileBoost
    extends UsecaseWithParams<void, CreateProfileBoostRequest> {
  const CreateProfileBoost(this._repo);

  final UserProfileBoostRepository _repo;

  @override
  ResultFuture<void> call(CreateProfileBoostRequest params) async =>
      await _repo.createProfileBoostRepo(params);
}

@prod
@LazySingleton()
class GetProfileBoost extends UsecaseWithoutParams<ProfileBoostListModel> {
  const GetProfileBoost(this._repo);

  final UserProfileBoostRepository _repo;

  @override
  ResultFuture<ProfileBoostListModel> call() async =>
      await _repo.getProfileBoost();
}

@prod
@LazySingleton()
class GetProfileBoostInsight extends UsecaseWithParams<BoostInsightModel, String> {
  const GetProfileBoostInsight(this._repo);

  final UserProfileBoostRepository _repo;

  @override
  ResultFuture<BoostInsightModel> call(String params) async =>
      await _repo.getProfileBoostInsight(params);
}
