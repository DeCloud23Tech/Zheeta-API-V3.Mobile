import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:zheeta/core/constants/type_def.dart';
import 'package:zheeta/core/error/error.dart';
import 'package:zheeta/core/error/exception.dart';
import 'package:zheeta/features/profile/data/datasources/i_user_search_datasource.dart';
import 'package:zheeta/features/profile/data/models/search_user_by_customer_model.dart';
import 'package:zheeta/features/profile/domain/repositories/user_search_repository.dart';

@prod
@LazySingleton(as: IUserSearchRepository)
class UserSearchRepositoryImpl implements IUserSearchRepository {
  final IUserSearchDataSource _datasource;
  UserSearchRepositoryImpl(this._datasource);

  @override
  ResultFuture<SearchUserByCustomerListModel> searchUserByCustomerRepo(
      {required String userName,
      required int pageNumber,
      required int pageSize}) async {
    try {
      final result = await _datasource.searchUserByCustomerNew(
        username: userName,
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
