import 'package:injectable/injectable.dart';
import 'package:zheeta/profile/data/request/create_update_bank_account_request.dart';
import 'package:zheeta/profile/domain/repository/user_bank_account_repository.dart';
import 'package:zheeta/profile/domain/usecase/user_bank_account_usecase.dart';

@prod
@LazySingleton(as: UserBankAccountUseCase)
class UserBankAccountUseCaseImpl implements UserBankAccountUseCase {
  final UserBankAccountRepository _repository;
  UserBankAccountUseCaseImpl(this._repository);

  @override
  createUpdateBankAccountUseCase(CreateUpdateBankAccountRequest request) {
    return _repository.createUpdateBankAccountRepo(request);
  }

  @override
  getUserBankAccountUseCase() {
    return _repository.getUserBankAccountRepo();
  }
}
