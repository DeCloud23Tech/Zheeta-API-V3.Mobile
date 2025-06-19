import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:zheeta/common/constants/type_def.dart';
import 'package:zheeta/common/errors/error.dart';
import 'package:zheeta/common/errors/exception.dart';
import 'package:zheeta/features/profile/data/datasource/user_interest_datasource.dart';
import 'package:zheeta/features/profile/data/model/user_interest_model.dart';
import 'package:zheeta/features/profile/data/request/update_user_interest_request.dart';
import 'package:zheeta/features/profile/domain/repository/user_interest_repository.dart';

@prod
@LazySingleton(as: UserInterestRepository)
class UserInterestRepositoryImpl implements UserInterestRepository {
  final UserInterestDataSource _datasource;
  UserInterestRepositoryImpl(this._datasource);

  @override
  ResultVoid updateUserInterestRepo(UpdateUserInterestRequest request) async {
    try {
      final result = await _datasource.updateUserInterestNew(request);
      return right(result);
    } on ApiException catch (ex) {
      return left(ApiError(message: ex.message, statusCode: ex.statusCode));
    } on DioException catch (ex) {
      return left(
          ApiError(message: ex.response?.data['message'], statusCode: ex.response!.statusCode!));
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
          ApiError(message: ex.response?.data['message'], statusCode: ex.response!.statusCode!));
    }
  }
}
