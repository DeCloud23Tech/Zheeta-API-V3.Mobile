import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:zheeta/core/constants/type_def.dart';
import 'package:zheeta/core/error/error.dart';
import 'package:zheeta/core/error/exception.dart';
import 'package:zheeta/features/connections/data/datasources/i_friends_datasource.dart';
import 'package:zheeta/features/connections/data/models/all_friends_model.dart';
import 'package:zheeta/features/connections/data/models/bulk_friend_request_model.dart';
import 'package:zheeta/features/connections/data/models/get_pending_friends_model.dart';
import 'package:zheeta/features/connections/data/requests/friend_request_model.dart';
import 'package:zheeta/features/connections/domain/repositories/friends_repository.dart';
import 'package:zheeta/shared/enums/type_of_request.dart';

@prod
@LazySingleton(as: IFriendsRepository)
class FriendsRepositoryImpl implements IFriendsRepository {
  final IFriendsDataSource _datasource;

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
      return left(ApiError(
          message: ex.response?.data['message'],
          statusCode: ex.response!.statusCode!));
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
      return left(ApiError(
          message: ex.response?.data['message'],
          statusCode: ex.response!.statusCode!));
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
      return left(ApiError(
          message: ex.response?.data['message'],
          statusCode: ex.response!.statusCode!));
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
      return left(ApiError(
          message: ex.response?.data['message'],
          statusCode: ex.response!.statusCode!));
    }
  }

  @override
  ResultVoid sendBulkFriendRequest(
      {required List<BulkFriendRequestModel> friendList}) async {
    try {
      final result =
          await _datasource.sendBulkFriendRequest(friendList: friendList);
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
