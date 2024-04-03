import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:zheeta/app/api/api_manager.dart';
import 'package:zheeta/app/api/api_manager_refactored.dart';
import 'package:zheeta/app/api/errors/exception.dart';
import 'package:zheeta/app/common/enums/type_of_request.dart';
import 'package:zheeta/app/common/storage/local_storage_impl.dart';
import 'package:zheeta/app/common/storage/storage_keys.dart';
import 'package:zheeta/authentication/domain/entity/types.dart';
import 'package:zheeta/discover/data/datasource/friend_request_datasource.dart';

@prod
@Singleton(as: FriendRequestDataSource)
class FriendRequestDataSourceImpl implements FriendRequestDataSource {
  final ApiManager _apiManager;
  late final String? _authToken;
  final Api _api;

  FriendRequestDataSourceImpl(this._apiManager, this._api) {
    _getAuthToken();
  }

  _getAuthToken() async {
    _authToken = (await sessionManager.get(SessionManagerKeys.authTokenString))
        as String?;
  }

  @override
  Future<Either<ErrorResponse, MappedResponse>> sendFriendRequest({
    required String recieverId,
    required TypeOfRequest typeOfRequest,
  }) async {
    final response = await _apiManager.postHttp(
        '/friends/send-friend-request?RecieverId=$recieverId&TypeOfRequest=${typeOfRequest.value}',
        null,
        token: _authToken);
    if (response.success) {
      return Right(response.data);
    } else {
      return Left(
        ErrorResponse(message: response.message, data: response.data),
      );
    }
  }

  @override
  Future<void> sendFriendRequestNew(
      {required String recieverId,
      required TypeOfRequest typeOfRequest}) async {
    var response = await _api.dio.post(
        '/friends/send-friend-request?RecieverId=$recieverId&TypeOfRequest=${typeOfRequest.value}',
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
