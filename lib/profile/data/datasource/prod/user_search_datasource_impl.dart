import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:zheeta/app/api/api_manager.dart';
import 'package:zheeta/app/common/storage/local_storage_impl.dart';
import 'package:zheeta/app/common/storage/storage_keys.dart';
import 'package:zheeta/authentication/domain/entity/types.dart';
import 'package:zheeta/profile/data/datasource/user_search_datasource.dart';

@prod
@LazySingleton(as: UserSearchDataSource)
class UserSearchDataSourceImpl implements UserSearchDataSource {
  final ApiManager _apiManager;
  late final String? _authToken;

  UserSearchDataSourceImpl(this._apiManager) {
    _getAuthToken();
  }

  _getAuthToken() async {
    _authToken = (await sessionManager.get(SessionManagerKeys.authTokenString)) as String?;
  }

  @override
  Future<Either<Error, MappedResponse>> findUserByAdminEmail({
    required String email,
    required int pageNumber,
    required int pageSize,
  }) async {
    final response = await _apiManager.getHttp('/user/find-user-by-admin?email=$email&PageNumber=$pageNumber&PageSize=$pageSize', token: _authToken);
    if (response.success) {
      return Right(response.data);
    } else {
      return Left(response.message);
    }
  }

  @override
  Future<Either<Error, MappedResponse>> findUserByAdminUsername({
    required String username,
    required int pageNumber,
    required int pageSize,
  }) async {
    final response = await _apiManager.getHttp('/user/find-user-by-admin?username=$username&PageNumber=$pageNumber&PageSize=$pageSize', token: _authToken);
    if (response.success) {
      return Right(response.data);
    } else {
      return Left(response.message);
    }
  }

  @override
  Future<Either<Error, MappedResponse>> searchUserByCustomer({
    required String username,
    required int pageNumber,
    required int pageSize,
  }) async {
    final response = await _apiManager.getHttp('/user/search/$username?&PageNumber=$pageNumber&PageSize=$pageSize', token: _authToken);
    if (response.success) {
      return Right(response.data);
    } else {
      return Left(response.message);
    }
  }
}
