import 'package:zheeta/app/common/type_def.dart';
import 'package:zheeta/app/common/usecase/usecases.dart';
import 'package:zheeta/profile/data/model/user_profile_model.dart';
import 'package:zheeta/profile/data/request/create_update_bank_account_request.dart';
import 'package:zheeta/profile/data/request/location_coordinate_from_address_request.dart';
import 'package:zheeta/profile/domain/repository/access_restriction_repository.dart';
import 'package:zheeta/profile/domain/repository/location_repository.dart';
import 'package:zheeta/profile/domain/repository/user_bank_account_repository.dart';

class CreateUpdateBankAccount
    extends UsecaseWithParams<void, CreateUpdateBankAccountRequest> {
  const CreateUpdateBankAccount(this._repo);

  final UserBankAccountRepository _repo;

  @override
  ResultFuture<void> call(CreateUpdateBankAccountRequest params) async =>
      await _repo.createUpdateBankAccountRepo(params);
}

class GetUserBankAccount extends UsecaseWithoutParams<BankAccountDetailModel> {
  const GetUserBankAccount(this._repo);

  final UserBankAccountRepository _repo;

  @override
  ResultFuture<BankAccountDetailModel> call() async =>
      await _repo.getUserBankAccountRepo();
}
