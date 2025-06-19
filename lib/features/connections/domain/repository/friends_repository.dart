import 'package:injectable/injectable.dart';
import 'package:zheeta/common/constants/type_def.dart';
import 'package:zheeta/common/enums/type_of_request.dart';
import 'package:zheeta/common/param/pagination_param.dart';
import 'package:zheeta/common/usecase/usecases.dart';
import 'package:zheeta/features/connections/data/model/all_friends_model.dart';
import 'package:zheeta/features/connections/data/model/bulk_friend_request_model.dart';
import 'package:zheeta/features/connections/data/model/get_pending_friends_model.dart';
import 'package:zheeta/features/connections/data/request/friend_request_model.dart';
import 'package:zheeta/features/connections/domain/repository/friends_repository.dart';


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
