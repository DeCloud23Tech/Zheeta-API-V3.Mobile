import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:zheeta/common/constants/type_def.dart';
import 'package:zheeta/common/errors/error.dart';
import 'package:zheeta/common/errors/exception.dart';
import 'package:zheeta/features/connections/data/datasource/downline_datasource.dart';
import 'package:zheeta/features/connections/data/model/user_downline_model.dart';
import 'package:zheeta/features/connections/domain/repository/user_downline_repository.dart';


@prod
@LazySingleton(as: UserDownlineRepository)
class UserDownlineRepositoryImpl implements UserDownlineRepository {
  final UserDownlineDataSource _datasource;

  UserDownlineRepositoryImpl(this._datasource);

  @override
  ResultFuture<UserDownlineListModel> getDownlines({required int pageNumber, required int pageSize}) async {
    try {
      final result = await _datasource.getDownlines(pageNumber: pageNumber, pageSize: pageSize,);
      return right(result);
    } on ApiException catch (ex) {
      return left(ApiError(message: ex.message, statusCode: ex.statusCode));
    } on DioException catch (ex) {
      return left(
          ApiError(message: ex.response?.data['message'], statusCode: ex.response!.statusCode!));
    }
  }
}
