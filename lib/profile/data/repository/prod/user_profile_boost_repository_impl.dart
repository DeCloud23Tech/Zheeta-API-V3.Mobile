import 'package:injectable/injectable.dart';
import 'package:zheeta/profile/data/datasource/user_profile_boost_datasource.dart';
import 'package:zheeta/profile/data/model/boosted_profile_by_admin_model.dart';
import 'package:zheeta/profile/data/model/matched_profile_boost_model.dart';
import 'package:zheeta/profile/data/request/create_profile_boost_request.dart';
import 'package:zheeta/profile/domain/entity/type.dart';
import 'package:zheeta/profile/domain/repository/user_profile_boost_repository.dart';

@prod
@LazySingleton(as: UserProfileBoostRepository)
class UserProfileBoostRepositoryImpl implements UserProfileBoostRepository {
  final UserProfileBoostDataSource _datasource;
  UserProfileBoostRepositoryImpl(this._datasource);

  @override
  createProfileBoostRepo(CreateProfileBoostRequest request) async {
    final result = await _datasource.createProfileBoost(request);
    return result.fold(
      (error) => throw new Exception(error.message),
      (value) => value,
    );
  }

  @override
  Future<BoostedProfileByAdminListModel> getBoostedProfileByAdminRepo(GetBoostedProfileByAdminRequest request) async {
    final result = await _datasource.getBoostedProfileByAdmin(request);
    return result.fold(
      (error) => throw new Exception(error.message),
      (value) => BoostedProfileByAdminListModel.fromJson(value),
    );
  }

  @override
  Future<MatchedProfileBoostListModel> getMatchedProfileBoostRepo() async {
    final result = await _datasource.getMatchedProfileBoost();
    return result.fold(
      (error) => throw new Exception(error.message),
      (value) => MatchedProfileBoostListModel.fromJson(value),
    );
  }
}
