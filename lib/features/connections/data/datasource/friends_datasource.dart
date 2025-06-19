
import 'package:zheeta/common/enums/type_of_request.dart';
import 'package:zheeta/features/connections/data/model/all_friends_model.dart';
import 'package:zheeta/features/connections/data/model/bulk_friend_request_model.dart';
import 'package:zheeta/features/connections/data/model/get_pending_friends_model.dart';
import 'package:zheeta/features/connections/data/request/friend_request_model.dart';

abstract class FriendsDataSource {
  Future<FriendsListModel> getAllFriends(
      {required int pageNumber, required int pageSize});

  Future<GetPendingFriendsModel> getPendingFriends(
      {required int pageNumber, required int pageSize});

  Future<void> processFriendRequest(FriendRequest request);

  Future<void> sendFriendRequestNew({
    required String receiverId,
    required TypeOfRequest typeOfRequest,
  });

  Future<void> sendBulkFriendRequest({
    required List<BulkFriendRequestModel> friendList,
  });
}
