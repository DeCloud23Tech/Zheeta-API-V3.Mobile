import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:zheeta/app/api/errors/error.dart';
import 'package:zheeta/app/api/errors/exception.dart';
import 'package:zheeta/app/common/enums/type_of_request.dart';
import 'package:zheeta/app/common/type_def.dart';
import 'package:zheeta/discover/data/datasource/friend_request_datasource.dart';
import 'package:zheeta/discover/domain/repository/friend_request_repository.dart';

@prod
@LazySingleton(as: FriendRequestRepository)
class FriendRequestRepositoryImpl implements FriendRequestRepository {
  final FriendRequestDataSource _datasource;
  FriendRequestRepositoryImpl(this._datasource);

  @override
  sendFriendRequestRepo({
    required String recieverId,
    required TypeOfRequest typeOfRequest,
  }) async {
    final result = await _datasource.sendFriendRequest(
        recieverId: recieverId, typeOfRequest: typeOfRequest);
    return result.fold(
      (error) => throw new Exception(error.message),
      (value) => value,
    );
  }

  @override
  ResultVoid sendFriendRequest(
      {required String recieverId,
      required TypeOfRequest typeOfRequest}) async {
    try {
      final result = await _datasource.sendFriendRequestNew(
          recieverId: recieverId, typeOfRequest: typeOfRequest);
      return right(result);
    } on ApiException catch (ex) {
      return left(ApiError(message: ex.message, statusCode: ex.statusCode));
    } on DioException catch (ex) {
      return left(
          ApiError(message: ex.message!, statusCode: ex.response!.statusCode!));
    }
  }
}
