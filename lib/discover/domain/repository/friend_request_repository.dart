import 'package:zheeta/app/common/enums/type_of_request.dart';

abstract class FriendRequestRepository {
  sendFriendRequestRepo({
    required String recieverId,
    required TypeOfRequest typeOfRequest,
  });
}
