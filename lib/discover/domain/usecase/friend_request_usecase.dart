import 'package:zheeta/app/common/enums/type_of_request.dart';

abstract class FriendRequestUseCase {
  sendFriendRequestUseCase({
    required String recieverId,
    required TypeOfRequest typeOfRequest,
  });
}
