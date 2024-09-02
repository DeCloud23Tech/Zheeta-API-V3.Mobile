import 'package:zheeta/app/common/type_def.dart';
import 'package:zheeta/friends/data/model/get_pending_friends_model.dart';

import '../../../app/common/enums/type_of_request.dart';
import '../../data/model/all_friends_model.dart';
import '../../data/request/friend_request_model.dart';

abstract class FriendsRepository {
  ResultFuture<FriendsListModel> getAllFriends();

  ResultFuture<GetPendingFriendsModel> getPendingFriends();

  ResultFuture<void> processFriendRequest(FriendRequest request);

  ResultVoid sendFriendRequest({
    required String receiverId,
    required TypeOfRequest typeOfRequest,
  });
}
