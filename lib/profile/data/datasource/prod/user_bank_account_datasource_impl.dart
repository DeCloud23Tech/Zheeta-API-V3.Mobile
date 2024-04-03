import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:zheeta/app/api/api_manager.dart';
import 'package:zheeta/app/api/api_manager_refactored.dart';
import 'package:zheeta/app/api/errors/exception.dart';
import 'package:zheeta/app/common/storage/local_storage_impl.dart';
import 'package:zheeta/app/common/storage/storage_keys.dart';
import 'package:zheeta/authentication/domain/entity/types.dart';
import 'package:zheeta/profile/data/datasource/user_bank_account_datasource.dart';
import 'package:zheeta/profile/data/model/user_profile_model.dart';
import 'package:zheeta/profile/data/request/create_update_bank_account_request.dart';

@prod
@Singleton(as: UserBankAccountDataSource)
class UserBankAccountDataSourceImpl implements UserBankAccountDataSource {
  final ApiManager _apiManager;
  late final String? _authToken;
  final Api _api;

  UserBankAccountDataSourceImpl(this._apiManager, this._api) {
    _getAuthToken();
  }

  _getAuthToken() async {
    _authToken = (await sessionManager.get(SessionManagerKeys.authTokenString))
        as String?;
  }

  @override
  Future<Either<ErrorResponse, MappedResponse>> createUpdateBankAccount(
      CreateUpdateBankAccountRequest request) async {
    final response = await _apiManager
        .postHttp('/user/account', request.toJson(), token: _authToken);
    if (response.success) {
      return Right(response.data);
    } else {
      return Left(
        ErrorResponse(message: response.message, data: response.data),
      );
    }
  }

  @override
  Future<Either<ErrorResponse, MappedResponse>> getUserBankAccount() async {
    final response =
        await _apiManager.getHttp('/user/account', token: _authToken);
    if (response.success) {
      return Right(response.data);
    } else {
      return Left(
        ErrorResponse(message: response.message, data: response.data),
      );
    }
  }

  @override
  Future<void> createUpdateBankAccountNew(
      CreateUpdateBankAccountRequest request) async {
    var response = await _api.dio.post('/user/account',
        options: Options(
          contentType: Headers.jsonContentType,
        ),
        data: jsonEncode(request.toJson()));
    if (response.statusCode == 200) {
    } else {
      throw ApiException(
          message: response.statusMessage!, statusCode: response.statusCode!);
    }
  }

  @override
  Future<BankAccountDetailModel> getUserBankAccountNew() async {
    var response = await _api.dio.get(
      '/user/account',
      options: Options(
        contentType: Headers.jsonContentType,
      ),
    );
    if (response.statusCode == 200) {
      return BankAccountDetailModel.fromJson(response.data['data']);
    } else {
      throw ApiException(
          message: response.statusMessage!, statusCode: response.statusCode!);
    }
  }
}
