import 'package:injectable/injectable.dart';
import 'package:zheeta/app/common/type_def.dart';
import 'package:zheeta/app/common/usecase/usecases.dart';
import 'package:zheeta/profile/data/model/boosted_profile_by_admin_model.dart';
import 'package:zheeta/profile/data/model/matched_profile_boost_model.dart';
import 'package:zheeta/profile/data/request/create_profile_boost_request.dart';
import 'package:zheeta/profile/domain/repository/user_profile_boost_repository.dart';

@prod
@LazySingleton()
class CreateProfileBoost
    extends UsecaseWithParams<void, CreateProfileBoostRequest> {
  const CreateProfileBoost(this._repo);

  final UserProfileBoostRepository _repo;

  @override
  ResultFuture<void> call(CreateProfileBoostRequest param) async =>
      await _repo.createProfileBoostRepo(param);
}

@prod
@LazySingleton()
class GetBoostedProfileByAdmin extends UsecaseWithParams<
    BoostedProfileByAdminListModel, CreateProfileBoostRequest> {
  const GetBoostedProfileByAdmin(this._repo);

  final UserProfileBoostRepository _repo;

  @override
  ResultFuture<BoostedProfileByAdminListModel> call(
          CreateProfileBoostRequest params) async =>
      await _repo.getBoostedProfileByAdminRepo(params);
}

@prod
@LazySingleton()
class GetMatchedProfileBoost
    extends UsecaseWithoutParams<MatchedProfileBoostListModel> {
  const GetMatchedProfileBoost(this._repo);

  final UserProfileBoostRepository _repo;

  @override
  ResultFuture<MatchedProfileBoostListModel> call() async =>
      await _repo.getMatchedProfileBoostRepo();
}
