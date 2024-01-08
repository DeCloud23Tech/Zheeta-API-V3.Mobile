abstract class UserSearchRepository {
  searchUserByCustomerRepo({
    required String username,
    required int pageNumber,
    required int pageSize,
  });
  findUserByAdminUsernameRepo({
    required String username,
    required int pageNumber,
    required int pageSize,
  });
  findUserByAdminEmailRepo({
    required String email,
    required int pageNumber,
    required int pageSize,
  });
}
