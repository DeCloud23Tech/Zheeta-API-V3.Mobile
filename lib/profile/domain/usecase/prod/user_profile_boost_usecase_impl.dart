import 'package:injectable/injectable.dart';
import 'package:zheeta/profile/data/request/create_profile_boost_request.dart';
import 'package:zheeta/profile/domain/entity/type.dart';
import 'package:zheeta/profile/domain/repository/user_profile_boost_repository.dart';
import 'package:zheeta/profile/domain/usecase/user_profile_boost_usecase.dart';

@prod
@LazySingleton(as: UserProfileBoostUseCase)
class UserProfileBoostUseCaseImpl implements UserProfileBoostUseCase {
  final UserProfileBoostRepository _repository;
  UserProfileBoostUseCaseImpl(this._repository);

  @override
  createProfileBoostUseCase(CreateProfileBoostRequest request) {
    return _repository.createProfileBoostRepo(request);
  }

  @override
  getBoostedProfileByAdminUseCase(GetBoostedProfileByAdminRequest request) {
    return _repository.getBoostedProfileByAdminRepo(request);
  }

  @override
  getMatchedProfileBoostUseCase() {
    return _repository.getMatchedProfileBoostRepo();
  }
}
