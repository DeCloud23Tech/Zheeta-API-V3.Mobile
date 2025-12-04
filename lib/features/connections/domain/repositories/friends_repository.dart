import 'package:zheeta/core/constants/type_def.dart';
import 'package:zheeta/features/connections/data/models/all_friends_model.dart';
import 'package:zheeta/features/connections/data/models/bulk_friend_request_model.dart';
import 'package:zheeta/features/connections/data/models/get_pending_friends_model.dart';
import 'package:zheeta/features/connections/data/requests/friend_request_model.dart';
import 'package:zheeta/shared/enums/type_of_request.dart';

abstract class IFriendsRepository {
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
