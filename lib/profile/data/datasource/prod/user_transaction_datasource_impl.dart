import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:zheeta/app/api/api_manager.dart';
import 'package:zheeta/app/api/api_manager_refactored.dart';
import 'package:zheeta/app/api/errors/exception.dart';
import 'package:zheeta/app/common/storage/local_storage_impl.dart';
import 'package:zheeta/app/common/storage/storage_keys.dart';
import 'package:zheeta/authentication/domain/entity/types.dart';
import 'package:zheeta/profile/data/datasource/user_transaction_datasource.dart';
import 'package:zheeta/profile/data/model/user_transaction_model.dart';

@prod
@Singleton(as: UserTransactionDataSource)
class UserTransactionDataSourceImpl implements UserTransactionDataSource {
  final ApiManager _apiManager;
  final Api _api;
  late final String? _authToken;

  UserTransactionDataSourceImpl(this._apiManager, this._api) {
    _getAuthToken();
  }

  _getAuthToken() async {
    _authToken = (await sessionManager.get(SessionManagerKeys.authTokenString))
        as String?;
  }

  @override
  Future<Either<ErrorResponse, MappedResponse>> getUserTransactions({
    required String userId,
    required int pageNumber,
    required int pageSize,
  }) async {
    final response = await _apiManager.getHttp(
        '/transaction/get-user-transactions?userId=$userId&PageNumber=$pageNumber&PageSize=$pageSize',
        token: _authToken);
    if (response.success) {
      return Right(response.data);
    } else {
      return Left(
        ErrorResponse(message: response.message, data: response.data),
      );
    }
  }

  @override
  Future<UserTransactionListModel> getUserTransactionsNew(
      {required String userId,
      required int pageNumber,
      required int pageSize}) async {
    var response = await _api.dio.get(
      '/transaction/get-user-transactions?userId=$userId&PageNumber=$pageNumber&PageSize=$pageSize',
      options: Options(
        contentType: Headers.jsonContentType,
      ),
    );
    if (response.statusCode == 200) {
      return UserTransactionListModel.fromJson(response.data['data']);
    } else {
      throw ApiException(
          message: response.statusMessage!, statusCode: response.statusCode!);
    }
  }
}
