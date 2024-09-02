import 'dart:convert';

import 'package:dio/dio.dart' show FormData, Headers, MultipartFile, Options;
import 'package:injectable/injectable.dart';
import 'package:zheeta/app/api/api_manager.dart';
import 'package:zheeta/app/api/api_manager_refactored.dart';
import 'package:zheeta/app/api/errors/exception.dart';
import 'package:zheeta/app/common/enums/type_of_request.dart';
import 'package:zheeta/app/common/storage/local_storage_impl.dart';
import 'package:zheeta/app/common/storage/storage_keys.dart';
import 'package:zheeta/friends/data/datasource/friends_datasource.dart';
import 'package:zheeta/friends/data/model/get_pending_friends_model.dart';
import 'package:zheeta/friends/data/request/friend_request_model.dart';

import '../../model/all_friends_model.dart';

@prod
@Singleton(as: FriendsDataSource)
class FriendsDataSourceImpl implements FriendsDataSource {
  final ApiManager _apiManager;
  final Api _api;
  late final String? _authToken;

  FriendsDataSourceImpl(this._apiManager, this._api) {
    _getAuthToken();
  }

  _getAuthToken() async {
    _authToken = (await sessionManager.get(SessionManagerKeys.authTokenString))
        as String?;
  }

  @override
  Future<FriendsListModel> getAllFriends() async {
    var response = await _api.dio.get(
      '/friends/get-all-friends',
      options: Options(
        contentType: Headers.jsonContentType,
      ),
    );
    if (response.statusCode == 200) {
      if (response.data['data'] == null) {
        // If null, return an empty list
        return FriendsListModel(data: []);
      } else {
        final List<dynamic> dataList = response.data['data'];
        final List<FriendModel> friends = dataList
            .map((item) => FriendModel.fromJson(item as Map<String, dynamic>))
            .toList();
        return FriendsListModel(data: friends);
      }
    } else {
      throw ApiException(
          message: response.statusMessage!, statusCode: response.statusCode!);
    }
  }

  @override
  Future<GetPendingFriendsModel> getPendingFriends() async {
    var response = await _api.dio.get(
      '/friends/get-pending-friend-requests',
      options: Options(
        contentType: Headers.jsonContentType,
      ),
    );

    if (response.statusCode == 200) {
      if (response.data == null || response.data['data'] == null) {
        // If null, return an empty list
        return GetPendingFriendsModel(data: []);
      } else {
        final List<dynamic> dataList = response.data['data'];
        final List<FriendRequestModel> friends = dataList
            .map((item) =>
                FriendRequestModel.fromJson(item as Map<String, dynamic>))
            .toList();
        return GetPendingFriendsModel(data: friends);
      }
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
          'Authorization': 'Bearer $_authToken',
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
  Future<void> sendFriendRequestNew(
      {required String receiverId,
      required TypeOfRequest typeOfRequest}) async {
    var response = await _api.dio.post(
        '/friends/send-friend-request?RecieverId=$receiverId&TypeOfRequest=${typeOfRequest.value}',
        options: Options(
          contentType: Headers.jsonContentType,
        ),
        data: null);
    if (response.statusCode == 200) {
    } else {
      throw ApiException(
          message: response.statusMessage!, statusCode: response.statusCode!);
    }
  }
}
