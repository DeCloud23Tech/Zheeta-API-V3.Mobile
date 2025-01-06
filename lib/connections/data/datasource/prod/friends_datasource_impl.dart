import 'dart:convert';

import 'package:dio/dio.dart' show FormData, Headers, MultipartFile, Options;
import 'package:injectable/injectable.dart';
import 'package:zheeta/app/api/api_manager_refactored.dart';
import 'package:zheeta/app/api/errors/exception.dart';
import 'package:zheeta/app/common/enums/type_of_request.dart';
import 'package:zheeta/connections/data/datasource/friends_datasource.dart';
import 'package:zheeta/connections/data/model/all_friends_model.dart';
import 'package:zheeta/connections/data/model/bulk_friend_request_model.dart';
import 'package:zheeta/connections/data/model/get_pending_friends_model.dart';
import 'package:zheeta/connections/data/request/friend_request_model.dart';

@prod
@Singleton(as: FriendsDataSource)
class FriendsDataSourceImpl
    implements FriendsDataSource {
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
      throw ApiException(
          message: response.statusMessage!, statusCode: response.statusCode!);
    }
  }

  @override
  Future<GetPendingFriendsModel> getPendingFriends(
      {required int pageNumber, required int pageSize}) async {
    print('response');

    var response = await _api.dio.get(
      '/friends/get-pending-friend-requests?PageNumber=$pageNumber&PageSize=$pageSize',
      options: Options(
        contentType: Headers.jsonContentType,
      ),
    );
    print(response);

    if (response.statusCode == 200) {
      final List<dynamic> dataList = response.data['data'] ?? [];
      final List<FriendRequestModel> friends = dataList
          .map((item) =>
          FriendRequestModel.fromJson(item as Map<String, dynamic>))
          .toList();
      return GetPendingFriendsModel(data: friends);
    } else {
      throw ApiException(
          message: response.statusMessage!, statusCode: response.statusCode!);
    }
  }

  @override
  Future<void> processFriendRequest(FriendRequest request) async {
    var response = await _api.dio.post(
      '/friends/process-friend-request',
      data: jsonEncode(request.toJson()),
      options: Options(
        contentType: Headers.jsonContentType,
        headers: {
          // 'Authorization': 'Bearer $_authToken',
        },
      ),
    );

    print(request);
    print(response);

    if (response.statusCode != 200) {
      throw ApiException(
          message: response.statusMessage!, statusCode: response.statusCode!);
    }
  }

  @override
  Future<void> sendFriendRequestNew({required String receiverId,
    required TypeOfRequest typeOfRequest}) async {
    var response = await _api.dio.post(
        '/friends/send-friend-request?RecieverId=$receiverId&TypeOfRequest=${typeOfRequest
            .value}',
        options: Options(
          contentType: Headers.jsonContentType,
        ),
        data: null);
    if (response.statusCode == 200) {} else {
      throw ApiException(
          message: response.statusMessage!, statusCode: response.statusCode!);
    }
  }

  @override
  Future<void> sendBulkFriendRequest(
      {required List<BulkFriendRequestModel> friendList}) async {
    var response = await _api.dio.post(
        '/friends/send-bulk-friend-request',
        options: Options(
          contentType: Headers.jsonContentType,
        ),
        // data: jsonEncode({
        //   'friendList': friendList.map((friend) => friend.toJson()).toList(),
        // }));
        data: jsonEncode(friendList));
    if (response.statusCode == 200) {} else {
      throw ApiException(
          message: response.statusMessage!, statusCode: response.statusCode!);
    }
  }
}