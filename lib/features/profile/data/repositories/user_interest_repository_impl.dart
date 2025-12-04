import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:zheeta/core/constants/type_def.dart';
import 'package:zheeta/core/error/error.dart';
import 'package:zheeta/core/error/exception.dart';
import 'package:zheeta/features/profile/data/datasources/i_user_interest_datasource.dart';
import 'package:zheeta/features/profile/data/models/user_interest_model.dart';
import 'package:zheeta/features/profile/data/requests/update_user_interest_request.dart';
import 'package:zheeta/features/profile/domain/repositories/user_interest_repository.dart';

@prod
@LazySingleton(as: IUserInterestRepository)
class UserInterestRepositoryImpl implements IUserInterestRepository {
  final IUserInterestDataSource _datasource;
  UserInterestRepositoryImpl(this._datasource);

  @override
  ResultVoid updateUserInterestRepo(UpdateUserInterestRequest request) async {
    try {
      final result = await _datasource.updateUserInterestNew(request);
      return right(result);
    } on ApiException catch (ex) {
      return left(ApiError(message: ex.message, statusCode: ex.statusCode));
    } on DioException catch (ex) {
      return left(ApiError(
          message: ex.response?.data['message'],
          statusCode: ex.response!.statusCode!));
    }
  }

  @override
  ResultFuture<UserInterestListModel> getInterestsRepo() async {
    try {
      final result = await _datasource.getInterestsNew();
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
