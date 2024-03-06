abstract class UserProfileAccessUseCase {
  blockAccountUseCase({required String userId, required String blockOrUnblockUserId});
  unblockAccountUseCase({required String userId, required String blockOrUnblockUserId});
  getBlockedUsersUseCase({required int pageNumber, required int pageSize});
}
