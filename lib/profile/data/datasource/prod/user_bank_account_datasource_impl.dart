import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:zheeta/app/api/api_manager.dart';
import 'package:zheeta/app/common/storage/local_storage_impl.dart';
import 'package:zheeta/app/common/storage/storage_keys.dart';
import 'package:zheeta/authentication/domain/entity/types.dart';
import 'package:zheeta/profile/data/datasource/user_bank_account_datasource.dart';
import 'package:zheeta/profile/data/request/create_update_bank_account_request.dart';

@prod
@LazySingleton(as: UserBankAccountDataSource)
class UserBankAccountDataSourceImpl implements UserBankAccountDataSource {
  final ApiManager _apiManager;
  late final String? _authToken;

  UserBankAccountDataSourceImpl(this._apiManager) {
    _getAuthToken();
  }

  _getAuthToken() async {
    _authToken = (await sessionManager.get(SessionManagerKeys.authTokenString)) as String?;
  }

  @override
  Future<Either<ErrorResponse, MappedResponse>> createUpdateBankAccount(CreateUpdateBankAccountRequest request) async {
    final response = await _apiManager.postHttp('/user/account', request.toJson(), token: _authToken);
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
    final response = await _apiManager.getHttp('/user/account', token: _authToken);
    if (response.success) {
      return Right(response.data);
    } else {
      return Left(
        ErrorResponse(message: response.message, data: response.data),
      );
    }
  }
}
