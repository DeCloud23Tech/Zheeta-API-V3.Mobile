import 'package:injectable/injectable.dart';
import 'package:zheeta/profile/data/request/update_user_interest_request.dart';
import 'package:zheeta/profile/domain/repository/user_interest_repository.dart';
import 'package:zheeta/profile/domain/usecase/user_interest_usecase.dart';

@prod
@LazySingleton(as: UserInterestUseCase)
class UserInterestUseCaseImpl implements UserInterestUseCase {
  final UserInterestRepository _repository;
  UserInterestUseCaseImpl(this._repository);

  @override
  updateUserInterestUseCase(UpdateUserUnterestRequest request) {
    return _repository.updateUserInterestRepo(request);
  }
}
