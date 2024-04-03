import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:zheeta/app/api/api_manager.dart';
import 'package:zheeta/app/api/api_manager_refactored.dart';
import 'package:zheeta/app/api/errors/exception.dart';
import 'package:zheeta/app/common/storage/local_storage_impl.dart';
import 'package:zheeta/app/common/storage/storage_keys.dart';
import 'package:zheeta/authentication/domain/entity/types.dart';
import 'package:zheeta/profile/data/datasource/user_search_datasource.dart';
import 'package:zheeta/profile/data/model/search_user_by_admin_model.dart';
import 'package:zheeta/profile/data/model/search_user_by_customer_model.dart';

@prod
@Singleton(as: UserSearchDataSource)
class UserSearchDataSourceImpl implements UserSearchDataSource {
  final ApiManager _apiManager;
  late final String? _authToken;
  final Api _api;

  UserSearchDataSourceImpl(this._apiManager, this._api) {
    _getAuthToken();
  }

  _getAuthToken() async {
    _authToken = (await sessionManager.get(SessionManagerKeys.authTokenString))
        as String?;
  }

  @override
  Future<Either<ErrorResponse, MappedResponse>> findUserByAdminEmail({
    required String email,
    required int pageNumber,
    required int pageSize,
  }) async {
    final response = await _apiManager.getHttp(
        '/user/find-user-by-admin?email=$email&PageNumber=$pageNumber&PageSize=$pageSize',
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
  Future<Either<ErrorResponse, MappedResponse>> findUserByAdminUsername({
    required String username,
    required int pageNumber,
    required int pageSize,
  }) async {
    final response = await _apiManager.getHttp(
        '/user/find-user-by-admin?username=$username&PageNumber=$pageNumber&PageSize=$pageSize',
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
  Future<Either<ErrorResponse, MappedResponse>> searchUserByCustomer({
    required String username,
    required int pageNumber,
    required int pageSize,
  }) async {
    final response = await _apiManager.getHttp(
        '/user/search/$username?&PageNumber=$pageNumber&PageSize=$pageSize',
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
  Future<SearchUserByAdminListModel> findUserByAdminEmailNew(
      {required String email,
      required int pageNumber,
      required int pageSize}) async {
    var response = await _api.dio.get(
      '/user/find-user-by-admin?email=$email&PageNumber=$pageNumber&PageSize=$pageSize',
      options: Options(
        contentType: Headers.jsonContentType,
      ),
    );
    if (response.statusCode == 200) {
      return SearchUserByAdminListModel.fromJson(response.data['data']);
    } else {
      throw ApiException(
          message: response.statusMessage!, statusCode: response.statusCode!);
    }
  }

  @override
  Future<SearchUserByAdminListModel> findUserByAdminUsernameNew(
      {required String username,
      required int pageNumber,
      required int pageSize}) async {
    var response = await _api.dio.get(
      '/user/find-user-by-admin?username=$username&PageNumber=$pageNumber&PageSize=$pageSize',
      options: Options(
        contentType: Headers.jsonContentType,
      ),
    );
    if (response.statusCode == 200) {
      return SearchUserByAdminListModel.fromJson(response.data['data']);
    } else {
      throw ApiException(
          message: response.statusMessage!, statusCode: response.statusCode!);
    }
  }

  @override
  Future<SearchUserByCustomerListModel> searchUserByCustomerNew(
      {required String username,
      required int pageNumber,
      required int pageSize}) async {
    var response = await _api.dio.get(
      '/user/search/$username?&PageNumber=$pageNumber&PageSize=$pageSize',
      options: Options(
        contentType: Headers.jsonContentType,
      ),
    );
    if (response.statusCode == 200) {
      return SearchUserByCustomerListModel.fromJson(response.data['data']);
    } else {
      throw ApiException(
          message: response.statusMessage!, statusCode: response.statusCode!);
    }
  }
}
