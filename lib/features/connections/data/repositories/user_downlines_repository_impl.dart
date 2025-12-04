import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:zheeta/core/constants/type_def.dart';
import 'package:zheeta/core/error/error.dart';
import 'package:zheeta/core/error/exception.dart';
import 'package:zheeta/features/connections/data/datasources/i_downline_datasource.dart';
import 'package:zheeta/features/connections/data/models/user_downline_model.dart';
import 'package:zheeta/features/connections/domain/repositories/user_downline_repository.dart';

@prod
@LazySingleton(as: IUserDownlineRepository)
class UserDownlineRepositoryImpl implements IUserDownlineRepository {
  final IUserDownlineDataSource _datasource;

  UserDownlineRepositoryImpl(this._datasource);

  @override
  ResultFuture<UserDownlineListModel> getDownlines(
      {required int pageNumber, required int pageSize}) async {
    try {
      final result = await _datasource.getDownlines(
        pageNumber: pageNumber,
        pageSize: pageSize,
      );
      return right(result);
    } on ApiException catch (ex) {
      return left(ApiError(message: ex.message, statusCode: ex.statusCode));
    } on DioException catch (ex) {
      return left(ApiError(
          message: ex.response?.data['message'],
          statusCode: ex.response!.statusCode!));
    }
  }
}
