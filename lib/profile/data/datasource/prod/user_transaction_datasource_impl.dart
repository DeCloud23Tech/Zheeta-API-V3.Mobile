import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:zheeta/app/api/api_manager.dart';
import 'package:zheeta/app/common/storage/local_storage_impl.dart';
import 'package:zheeta/app/common/storage/storage_keys.dart';
import 'package:zheeta/authentication/domain/entity/types.dart';
import 'package:zheeta/profile/data/datasource/user_transaction_datasource.dart';

@prod
@Singleton(as: UserTransactionDataSource)
class UserTransactionDataSourceImpl implements UserTransactionDataSource {
  final ApiManager _apiManager;
  late final String? _authToken;

  UserTransactionDataSourceImpl(this._apiManager) {
    _getAuthToken();
  }

  _getAuthToken() async {
    _authToken = (await sessionManager.get(SessionManagerKeys.authTokenString)) as String?;
  }

  @override
  Future<Either<ErrorResponse, MappedResponse>> getUserTransactions({
    required String userId,
    required int pageNumber,
    required int pageSize,
  }) async {
    final response = await _apiManager.getHttp('/transaction/get-user-transactions?userId=$userId&PageNumber=$pageNumber&PageSize=$pageSize', token: _authToken);
    if (response.success) {
      return Right(response.data);
    } else {
      return Left(
        ErrorResponse(message: response.message, data: response.data),
      );
    }
  }
}
