import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:zheeta/core/network/api.dart';
import 'package:zheeta/features/profile/data/datasources/i_user_profile_access_datasource.dart';
import 'package:zheeta/features/profile/data/models/blocked_user_model.dart';

@prod
@Singleton(as: IUserProfileAccessDataSource)
class UserProfileAccessDataSourceImpl implements IUserProfileAccessDataSource {
  final Api _api;

  UserProfileAccessDataSourceImpl(this._api);

  @override
  Future<bool> blockAccountNew(
      {required String userId, required String blockOrUnblockUserId}) async {
    Map<String, String> payload = {
      'userId': userId,
      'blockOrUnblockUserId': blockOrUnblockUserId
    };
    var response = await _api.dio.post('/user/block-user',
        options: Options(
          contentType: Headers.jsonContentType,
        ),
        data: payload);
    if (response.statusCode == 200) {
      return true;
    } else {
      throw DioException.badResponse(
          statusCode: response.data?['statusCode'] ?? 400,
          requestOptions: response.requestOptions,
          response: response);
    }
  }

  @override
  Future<BlockedUsersResponse> getBlockedUsersNew(
      {required int pageNumber, required int pageSize}) async {
    var response = await _api.dio.get(
      '/user/get-blocked-users?PageNumber=$pageNumber&PageSize=$pageSize',
      options: Options(
        contentType: Headers.jsonContentType,
      ),
    );

    if (response.statusCode == 200) {
      final List<dynamic> dataList = response.data['data'] ?? [];
      final List<BlockedUser> blockedUsers = dataList
          .map((item) => BlockedUser.fromJson(item as Map<String, dynamic>))
          .toList();
      return BlockedUsersResponse(data: blockedUsers);
    } else {
      throw DioException.badResponse(
          statusCode: response.data?['statusCode'] ?? 400,
          requestOptions: response.requestOptions,
          response: response);
    }
  }

  @override
  Future<bool> unblockAccountNew(
      {required String userId, required String blockOrUnblockUserId}) async {
    Map<String, String> payload = {
      'userId': userId,
      'blockOrUnblockUserId': blockOrUnblockUserId
    };
    var response = await _api.dio.delete('/user/unblock-user',
        options: Options(
          contentType: Headers.jsonContentType,
        ),
        data: payload);
    if (response.statusCode == 200) {
      return true;
    } else {
      throw DioException.badResponse(
          statusCode: response.data?['statusCode'] ?? 400,
          requestOptions: response.requestOptions,
          response: response);
    }
  }
}
