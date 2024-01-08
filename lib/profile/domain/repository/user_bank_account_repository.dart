import 'package:zheeta/profile/data/request/create_update_bank_account_request.dart';

abstract class UserBankAccountRepository {
  createUpdateBankAccountRepo(CreateUpdateBankAccountRequest request);
  getUserBankAccountRepo();
}
