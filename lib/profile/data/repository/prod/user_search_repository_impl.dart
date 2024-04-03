import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:zheeta/app/api/errors/error.dart';
import 'package:zheeta/app/api/errors/exception.dart';
import 'package:zheeta/app/common/type_def.dart';
import 'package:zheeta/profile/data/datasource/user_search_datasource.dart';
import 'package:zheeta/profile/data/model/search_user_by_admin_model.dart';
import 'package:zheeta/profile/data/model/search_user_by_customer_model.dart';
import 'package:zheeta/profile/domain/repository/user_search_repository.dart';

@prod
@LazySingleton(as: UserSearchRepository)
class UserSearchRepositorImpl implements UserSearchRepository {
  final UserSearchDataSource _datasource;
  UserSearchRepositorImpl(this._datasource);

  @override
  ResultFuture<SearchUserByAdminListModel> findUserByAdminEmailRepo(
      {required String email,
      required int pageNumber,
      required int pageSize}) async {
    try {
      final result = await _datasource.findUserByAdminEmailNew(
        email: email,
        pageNumber: pageNumber,
        pageSize: pageSize,
      );
      return right(result);
    } on ApiException catch (ex) {
      return left(ApiError(message: ex.message, statusCode: ex.statusCode));
    } on DioException catch (ex) {
      return left(
          ApiError(message: ex.message!, statusCode: ex.response!.statusCode!));
    }
  }

  @override
  ResultFuture<SearchUserByAdminListModel> findUserByAdminUsernameRepo(
      {required String username,
      required int pageNumber,
      required int pageSize}) async {
    try {
      final result = await _datasource.findUserByAdminUsernameNew(
        username: username,
        pageNumber: pageNumber,
        pageSize: pageSize,
      );
      return right(result);
    } on ApiException catch (ex) {
      return left(ApiError(message: ex.message, statusCode: ex.statusCode));
    } on DioException catch (ex) {
      return left(
          ApiError(message: ex.message!, statusCode: ex.response!.statusCode!));
    }
  }

  @override
  ResultFuture<SearchUserByCustomerListModel> searchUserByCustomerRepo(
      {required String username,
      required int pageNumber,
      required int pageSize}) async {
    try {
      final result = await _datasource.searchUserByCustomerNew(
        username: username,
        pageNumber: pageNumber,
        pageSize: pageSize,
      );
      return right(result);
    } on ApiException catch (ex) {
      return left(ApiError(message: ex.message, statusCode: ex.statusCode));
    } on DioException catch (ex) {
      return left(
          ApiError(message: ex.message!, statusCode: ex.response!.statusCode!));
    }
  }
}
