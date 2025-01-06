import 'package:zheeta/profile/data/model/blocked_user_model.dart';

abstract class UserProfileAccessDataSource {
  Future<bool> blockAccountNew(
      {required String userId, required String blockOrUnblockUserId});
  Future<bool> unblockAccountNew(
      {required String userId, required String blockOrUnblockUserId});
  Future<BlockedUsersResponse> getBlockedUsersNew(
      {required int pageNumber, required int pageSize});
}
