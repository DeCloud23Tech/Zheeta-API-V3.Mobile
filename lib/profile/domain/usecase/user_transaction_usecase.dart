abstract class UserTransactionUseCase {
  getUserTransactionsUseCase({
    required String userId,
    required int pageNumber,
    required int pageSize,
  });
}
