import 'package:injectable/injectable.dart';
import 'package:zheeta/app/common/enums/type_of_request.dart';
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
    final result = await _datasource.sendFriendRequest(recieverId: recieverId, typeOfRequest: typeOfRequest);
    return result.fold(
      (error) => throw new Exception(error.message),
      (value) => value,
    );
  }
}
