import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:zheeta/core/network/api.dart';
import 'package:zheeta/features/connections/data/datasources/i_friends_datasource.dart';
import 'package:zheeta/features/connections/data/models/all_friends_model.dart';
import 'package:zheeta/features/connections/data/models/bulk_friend_request_model.dart';
import 'package:zheeta/features/connections/data/models/get_pending_friends_model.dart';
import 'package:zheeta/features/connections/data/requests/friend_request_model.dart';
import 'package:zheeta/shared/enums/type_of_request.dart';

@prod
@Singleton(as: IFriendsDataSource)
class FriendsDataSourceImpl implements IFriendsDataSource {
  final Api _api;

  FriendsDataSourceImpl(this._api);

  @override
  Future<FriendsListModel> getAllFriends(
      {required int pageNumber, required int pageSize}) async {
    var response = await _api.dio.get(
      '/friends/get-all-friends?PageNumber=$pageNumber&PageSize=$pageSize',
      options: Options(
        contentType: Headers.jsonContentType,
      ),
    );
    if (response.statusCode == 200) {
      final List<dynamic> dataList = response.data['data'] ?? [];
      final List<FriendModel> friends = dataList
          .map((item) => FriendModel.fromJson(item as Map<String, dynamic>))
          .toList();
      return FriendsListModel(data: friends);
    } else {
      throw DioException.badResponse(
          statusCode: response.data?['statusCode'] ?? 400,
          requestOptions: response.requestOptions,
          response: response);
    }
  }

  @override
  Future<GetPendingFriendsModel> getPendingFriends(
      {required int pageNumber, required int pageSize}) async {
    var response = await _api.dio.get(
      '/friends/get-pending-friend-requests?PageNumber=$pageNumber&PageSize=$pageSize',
      options: Options(
        contentType: Headers.jsonContentType,
      ),
    );
    if (response.statusCode == 200 || response.statusCode == 204) {
      final List<dynamic> dataList = response.data['data'] ?? [];
      final List<FriendRequestModel> friends = dataList
          .map((item) =>
              FriendRequestModel.fromJson(item as Map<String, dynamic>))
          .toList();
      return GetPendingFriendsModel(data: friends);
    } else {
      throw DioException.badResponse(
        statusCode: response.data?['statusCode'] ?? 400,
        requestOptions: response.requestOptions,
        response: response,
      );
    }
  }

  @override
  Future<void> processFriendRequest(FriendRequest request) async {
    var response = await _api.dio.post(
      '/friends/process-friend-request',
      data: jsonEncode(request.toJson()),
      options: Options(
        contentType: Headers.jsonContentType,
      ),
    );

    if (response.statusCode != 200) {
      throw DioException.badResponse(
          statusCode: response.data?['statusCode'] ?? 400,
          requestOptions: response.requestOptions,
          response: response);
    }
  }

  @override
  Future<void> sendFriendRequestNew(
      {required String receiverId,
      required TypeOfRequest typeOfRequest}) async {
    var response = await _api.dio.post(
        '/friends/send-friend-request?RecieverId=$receiverId&TypeOfRequest=${typeOfRequest.value}',
        options: Options(
          contentType: Headers.jsonContentType,
        ));

    if (response.statusCode == 200 && response.data?['statusCode'] == 200) {
    } else {
      throw DioException.badResponse(
          statusCode: response.data?['statusCode'] ?? 400,
          requestOptions: response.requestOptions,
          response: response);
    }
  }

  @override
  Future<void> sendBulkFriendRequest(
      {required List<BulkFriendRequestModel> friendList}) async {
    final requestData = {
      "friendList": friendList.map((e) => e.toJson()).toList(),
    };
    var response = await _api.dio.post('/friends/send-bulk-friend-request',
        options: Options(
          contentType: Headers.jsonContentType,
        ),
        data: requestData);
    if (response.statusCode == 200) {
    } else {
      throw DioException.badResponse(
          statusCode: response.data?['statusCode'] ?? 400,
          requestOptions: response.requestOptions,
          response: response);
    }
  }
}
