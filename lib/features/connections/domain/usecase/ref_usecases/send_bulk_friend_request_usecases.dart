import 'package:injectable/injectable.dart';
import 'package:zheeta/common/constants/type_def.dart';
import 'package:zheeta/common/usecase/usecases.dart';
import 'package:zheeta/features/connections/data/model/bulk_friend_request_model.dart';
import 'package:zheeta/features/connections/domain/repository/friends_repository.dart';


@prod
@LazySingleton()
class SendBulkFriendRequest
    extends UsecaseWithParams<void, SendBulkFriendRequestParams> {
  const SendBulkFriendRequest(this._repo);

  final FriendsRepository _repo;

  @override
  ResultFuture<void> call(SendBulkFriendRequestParams params) async =>
      await _repo.sendBulkFriendRequest(friendList: params.friendList);
}

class SendBulkFriendRequestParams {
  final List<BulkFriendRequestModel> friendList;

  SendBulkFriendRequestParams({required this.friendList});
}
