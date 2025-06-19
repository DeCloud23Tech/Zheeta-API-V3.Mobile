import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:zheeta/common/constants/type_def.dart';
import 'package:zheeta/common/errors/error.dart';
import 'package:zheeta/common/errors/exception.dart';
import 'package:zheeta/features/profile/data/datasource/user_search_datasource.dart';
import 'package:zheeta/features/profile/data/model/search_user_by_customer_model.dart';
import 'package:zheeta/features/profile/domain/repository/user_search_repository.dart';

@prod
@LazySingleton(as: UserSearchRepository)
class UserSearchRepositoryImpl implements UserSearchRepository {
  final UserSearchDataSource _datasource;
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
