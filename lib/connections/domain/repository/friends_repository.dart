import 'package:zheeta/app/common/type_def.dart';
import 'package:zheeta/connections/data/model/bulk_friend_request_model.dart';
import 'package:zheeta/connections/data/model/get_pending_friends_model.dart';

import '../../../app/common/enums/type_of_request.dart';
import '../../data/model/all_friends_model.dart';
import '../../data/request/friend_request_model.dart';

abstract class FriendsRepository {
  ResultFuture<FriendsListModel> getAllFriends(
      {required int pageNumber, required int pageSize});

  ResultFuture<GetPendingFriendsModel> getPendingFriends(
      {required int pageNumber, required int pageSize});

  ResultFuture<void> processFriendRequest(FriendRequest request);

  ResultVoid sendFriendRequest({
    required String receiverId,
    required TypeOfRequest typeOfRequest,
  });

  ResultVoid sendBulkFriendRequest({
    required List<BulkFriendRequestModel> friendList,
  });
}
