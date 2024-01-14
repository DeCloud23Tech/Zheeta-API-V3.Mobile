import 'package:injectable/injectable.dart';
import 'package:zheeta/profile/data/datasource/user_bank_account_datasource.dart';
import 'package:zheeta/profile/data/model/user_profile_model.dart';
import 'package:zheeta/profile/data/request/create_update_bank_account_request.dart';
import 'package:zheeta/profile/domain/repository/user_bank_account_repository.dart';

@prod
@LazySingleton(as: UserBankAccountRepository)
class UserBankAccountRepositoryImpl implements UserBankAccountRepository {
  final UserBankAccountDataSource _datasource;
  UserBankAccountRepositoryImpl(this._datasource);

  @override
  createUpdateBankAccountRepo(CreateUpdateBankAccountRequest request) async {
    final result = await _datasource.createUpdateBankAccount(request);
    return result.fold(
      (error) => throw new Exception(error),
      (value) => value,
    );
  }

  @override
  Future<BankAccountDetailModel> getUserBankAccountRepo() async {
    final result = await _datasource.getUserBankAccount();
    return result.fold(
      (error) => throw new Exception(error),
      (value) => BankAccountDetailModel.fromJson(value['data']),
    );
  }
}
