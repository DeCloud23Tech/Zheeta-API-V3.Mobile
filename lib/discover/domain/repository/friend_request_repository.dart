import 'package:zheeta/app/common/enums/type_of_request.dart';
import 'package:zheeta/app/common/type_def.dart';
import 'package:zheeta/discover/data/request/send_bulk_request.dart';

abstract class FriendRequestRepository {
  sendFriendRequestRepo({
    required String recieverId,
    required TypeOfRequest typeOfRequest,
  });

  ResultVoid sendFriendRequest({
    required String recieverId,
    required TypeOfRequest typeOfRequest,
  });

  ResultVoid sendBulkFriendRequest({required SendBulkRequest request});
}
