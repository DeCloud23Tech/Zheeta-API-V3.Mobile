import 'package:zheeta/features/connections/data/models/all_friends_model.dart';
import 'package:zheeta/features/connections/data/models/bulk_friend_request_model.dart';
import 'package:zheeta/features/connections/data/models/get_pending_friends_model.dart';
import 'package:zheeta/features/connections/data/requests/friend_request_model.dart';
import 'package:zheeta/shared/enums/type_of_request.dart';

abstract class IFriendsDataSource {
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
