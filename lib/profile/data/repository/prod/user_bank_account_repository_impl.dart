import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:zheeta/app/api/errors/error.dart';
import 'package:zheeta/app/api/errors/exception.dart';
import 'package:zheeta/app/common/type_def.dart';
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
    try {
      final result = await _datasource.createUpdateBankAccountNew(request);
      return right(result);
    } on ApiException catch (ex) {
      return left(ApiError(message: ex.message, statusCode: ex.statusCode));
    } on DioException catch (ex) {
      return left(
          ApiError(message: ex.message!, statusCode: ex.response!.statusCode!));
    }
    // final result = await _datasource.createUpdateBankAccount(request);
    // return result.fold(
    //   (error) => throw new Exception(error.message),
    //   (value) => value,
    //);
  }

  @override
  ResultFuture<BankAccountDetailModel> getUserBankAccountRepo() async {
    try {
      final result = await _datasource.getUserBankAccountNew();
      return right(result);
    } on ApiException catch (ex) {
      return left(ApiError(message: ex.message, statusCode: ex.statusCode));
    } on DioException catch (ex) {
      return left(
          ApiError(message: ex.message!, statusCode: ex.response!.statusCode!));
    }
    // final result = await _datasource.getUserBankAccount();
    // return result.fold(
    //   (error) => throw new Exception(error.message),
    //   (value) => BankAccountDetailModel.fromJson(value['data']),
    // );
  }
}
