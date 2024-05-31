import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:zheeta/app/api/errors/error.dart';
import 'package:zheeta/app/api/errors/exception.dart';
import 'package:zheeta/app/common/type_def.dart';
import 'package:zheeta/profile/data/datasource/user_interest_datasource.dart';
import 'package:zheeta/profile/data/model/user_interest_model.dart';
import 'package:zheeta/profile/data/request/update_user_interest_request.dart';
import 'package:zheeta/profile/domain/repository/user_interest_repository.dart';

@prod
@LazySingleton(as: UserInterestRepository)
class UserInterestRepositoryImpl implements UserInterestRepository {
  final UserInterestDataSource _datasource;
  UserInterestRepositoryImpl(this._datasource);

  @override
  ResultVoid updateUserInterestRepo(UpdateUserUnterestRequest request) async {
    // final result = await _datasource.updateUserInterestNew(request);
    // return result.fold(
    //   (error) => throw new Exception(error.message),
    //   (value) => value,
    // );
    try {
      final result = await _datasource.updateUserInterestNew(request);
      return right(result);
    } on ApiException catch (ex) {
      return left(ApiError(message: ex.message, statusCode: ex.statusCode));
    } on DioException catch (ex) {
      return left(
          ApiError(message: ex.message!, statusCode: ex.response!.statusCode!));
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
      return left(
          ApiError(message: ex.message!, statusCode: ex.response!.statusCode!));
    }
  }
}
