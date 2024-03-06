abstract class UserProfileAccessRepository {
  blockAccountRepo({required String userId, required String blockOrUnblockUserId});
  unblockAccountRepo({required String userId, required String blockOrUnblockUserId});
  getBlockedUsersRepo({required int pageNumber, required int pageSize});
}
