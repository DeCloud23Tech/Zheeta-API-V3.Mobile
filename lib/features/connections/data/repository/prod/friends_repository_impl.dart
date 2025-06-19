import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:zheeta/common/constants/type_def.dart';
import 'package:zheeta/common/enums/type_of_request.dart';
import 'package:zheeta/common/errors/error.dart';
import 'package:zheeta/common/errors/exception.dart';
import 'package:zheeta/features/connections/data/datasource/friends_datasource.dart';
import 'package:zheeta/features/connections/data/model/all_friends_model.dart';
import 'package:zheeta/features/connections/data/model/bulk_friend_request_model.dart';
import 'package:zheeta/features/connections/data/model/get_pending_friends_model.dart';
import 'package:zheeta/features/connections/data/request/friend_request_model.dart';
import 'package:zheeta/features/connections/domain/repository/friends_repository.dart';



@prod
@LazySingleton(as: FriendsRepository)
class FriendsRepositoryImpl implements FriendsRepository {
  final FriendsDataSource _datasource;

  FriendsRepositoryImpl(this._datasource);

  @override
  ResultFuture<FriendsListModel> getAllFriends(
      {required int pageNumber, required int pageSize}) async {
    try {
      final result = await _datasource.getAllFriends(
          pageNumber: pageNumber, pageSize: pageSize);
      return right(result);
    } on ApiException catch (ex) {
      return left(ApiError(message: ex.message, statusCode: ex.statusCode));
    } on DioException catch (ex) {
      return left(
          ApiError(message: ex.response?.data['message'], statusCode: ex.response!.statusCode!));
    }
  }

  @override
  ResultFuture<GetPendingFriendsModel> getPendingFriends(
      {required int pageNumber, required int pageSize}) async {
    try {
      final result = await _datasource.getPendingFriends(
          pageNumber: pageNumber, pageSize: pageSize);
      return right(result);
    } on ApiException catch (ex) {
      return left(ApiError(message: ex.message, statusCode: ex.statusCode));
    } on DioException catch (ex) {
      return left(
          ApiError(message: ex.response?.data['message'], statusCode: ex.response!.statusCode!));
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
          ApiError(message: ex.response?.data['message'], statusCode: ex.response!.statusCode!));
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
          ApiError(message: ex.response?.data['message'], statusCode: ex.response!.statusCode!));
    }
  }

  @override
  ResultVoid sendBulkFriendRequest(
      {required List<BulkFriendRequestModel> friendList}) async {
    try {
      final result = await _datasource.sendBulkFriendRequest(friendList: friendList);
      return right(result);
    } on ApiException catch (ex) {
      return left(ApiError(message: ex.message, statusCode: ex.statusCode));
    } on DioException catch (ex) {
      return left(
          ApiError(message: ex.response?.data['message'], statusCode: ex.response!.statusCode!));
    }
  }
}
