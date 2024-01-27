import 'package:injectable/injectable.dart';
import 'package:zheeta/profile/domain/repository/user_profile_access_repository.dart';
import 'package:zheeta/profile/domain/usecase/user_profile_access_usecase.dart';

@prod
@LazySingleton(as: UserProfileAccessUseCase)
class UserProfileAccessUseCaseImpl implements UserProfileAccessUseCase {
  final UserProfileAccessRepository _repository;
  UserProfileAccessUseCaseImpl(this._repository);

  @override
  blockAccountUseCase({required String userId, required String blockOrUnblockUserId}) {
    _repository.blockAccountRepo(userId: userId, blockOrUnblockUserId: blockOrUnblockUserId);
  }

  @override
  getBlockedUsersUseCase({required int pageNumber, required int pageSize}) {
    _repository.getBlockedUsersRepo(pageNumber: pageNumber, pageSize: pageSize);
  }

  @override
  unblockAccountUseCase({required String userId, required String blockOrUnblockUserId}) {
    _repository.unblockAccountRepo(userId: userId, blockOrUnblockUserId: blockOrUnblockUserId);
  }
}
