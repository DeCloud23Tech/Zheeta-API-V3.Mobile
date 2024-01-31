import 'package:injectable/injectable.dart';
import 'package:zheeta/profile/domain/repository/access_restriction_repository.dart';
import 'package:zheeta/profile/domain/usecase/access_restriction_usecase.dart';

@prod
@LazySingleton(as: AccessRestrictionUseCase)
class AccessRestrictionUseCaseImpl implements AccessRestrictionUseCase {
  final AccessRestrictionRepository _repository;
  AccessRestrictionUseCaseImpl(this._repository);

  @override
  disableAccountUseCase({required String userId}) {
    _repository.disableAccountRepo(userId: userId);
  }

  @override
  enableAccountUseCase({required String userId}) {
    _repository.enableAccountRepo(userId: userId);
  }
}
