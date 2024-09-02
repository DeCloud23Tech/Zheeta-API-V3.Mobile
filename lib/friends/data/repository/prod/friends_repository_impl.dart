import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:zheeta/app/api/errors/error.dart';
import 'package:zheeta/app/api/errors/exception.dart';
import 'package:zheeta/app/common/enums/type_of_request.dart';
import 'package:zheeta/app/common/type_def.dart';
import 'package:zheeta/friends/data/model/get_pending_friends_model.dart';
import 'package:zheeta/friends/data/request/friend_request_model.dart';

import '../../../domain/repository/friends_repository.dart';
import '../../datasource/friends_datasource.dart';
import '../../model/all_friends_model.dart';

@prod
@LazySingleton(as: FriendsRepository)
class FriendsRepositoryImpl implements FriendsRepository {
  final FriendsDataSource _datasource;

  FriendsRepositoryImpl(this._datasource);

  @override
  ResultFuture<FriendsListModel> getAllFriends() async {
    try {
      final result = await _datasource.getAllFriends();
      return right(result);
    } on ApiException catch (ex) {
      return left(ApiError(message: ex.message, statusCode: ex.statusCode));
    } on DioException catch (ex) {
      return left(
          ApiError(message: ex.message!, statusCode: ex.response!.statusCode!));
    }
  }

  @override
  ResultFuture<GetPendingFriendsModel> getPendingFriends() async {
    try {
      final result = await _datasource.getPendingFriends();
      return right(result);
    } on ApiException catch (ex) {
      return left(ApiError(message: ex.message, statusCode: ex.statusCode));
    } on DioException catch (ex) {
      return left(
          ApiError(message: ex.message!, statusCode: ex.response!.statusCode!));
    }
  }

  @override
  ResultFuture<void> processFriendRequest(FriendRequest request) async {
    try {
      await _datasource.processFriendRequest(request);
      return right(null);
    } on ApiException catch (ex) {
      return left(ApiError(message: ex.message, statusCode: ex.statusCode));
    } on DioException catch (ex) {
      return left(
          ApiError(message: ex.message!, statusCode: ex.response!.statusCode!));
    }
  }

  @override
  ResultVoid sendFriendRequest(
      {required String receiverId,
      required TypeOfRequest typeOfRequest}) async {
    try {
      final result = await _datasource.sendFriendRequestNew(
          receiverId: receiverId, typeOfRequest: typeOfRequest);
      return right(result);
    } on ApiException catch (ex) {
      return left(ApiError(message: ex.message, statusCode: ex.statusCode));
    } on DioException catch (ex) {
      return left(
          ApiError(message: ex.message!, statusCode: ex.response!.statusCode!));
    }
  }
}
