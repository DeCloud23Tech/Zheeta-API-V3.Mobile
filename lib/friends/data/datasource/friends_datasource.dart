
import 'package:zheeta/friends/data/model/get_pending_friends_model.dart';

import '../../../app/common/enums/type_of_request.dart';
import '../model/all_friends_model.dart';
import '../request/friend_request_model.dart';

abstract class FriendsDataSource {
  Future<FriendsListModel> getAllFriends();
  Future<GetPendingFriendsModel> getPendingFriends();
  Future<void> processFriendRequest(FriendRequest request);
  Future<void> sendFriendRequestNew({
    required String receiverId,
    required TypeOfRequest typeOfRequest,
  });
}
