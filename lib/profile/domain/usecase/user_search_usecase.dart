abstract class UserSearchUseCase {
  searchUserByCustomerUseCase({
    required String username,
    required int pageNumber,
    required int pageSize,
  });
  findUserByAdminUsernameUseCase({
    required String username,
    required int pageNumber,
    required int pageSize,
  });
  findUserByAdminEmailUseCase({
    required String email,
    required int pageNumber,
    required int pageSize,
  });
}
