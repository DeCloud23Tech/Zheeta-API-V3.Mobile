import 'package:zheeta/features/profile/data/models/blocked_user_model.dart';

abstract class IUserProfileAccessDataSource {
  Future<bool> blockAccountNew(
      {required String userId, required String blockOrUnblockUserId});
  Future<bool> unblockAccountNew(
      {required String userId, required String blockOrUnblockUserId});
  Future<BlockedUsersResponse> getBlockedUsersNew(
      {required int pageNumber, required int pageSize});
}
