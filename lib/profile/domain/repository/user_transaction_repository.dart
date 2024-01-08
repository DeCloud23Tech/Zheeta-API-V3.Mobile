abstract class UserTransactionRepository {
  getUserTransactionsRepo({
    required String userId,
    required int pageNumber,
    required int pageSize,
  });
}
