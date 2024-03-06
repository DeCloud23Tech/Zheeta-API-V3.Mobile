import 'package:dartz/dartz.dart';
import 'package:zheeta/authentication/domain/entity/types.dart';
import 'package:zheeta/profile/data/request/create_update_bank_account_request.dart';

abstract class UserBankAccountDataSource {
  Future<Either<ErrorResponse, MappedResponse>> createUpdateBankAccount(CreateUpdateBankAccountRequest request);
  Future<Either<ErrorResponse, MappedResponse>> getUserBankAccount();
}
