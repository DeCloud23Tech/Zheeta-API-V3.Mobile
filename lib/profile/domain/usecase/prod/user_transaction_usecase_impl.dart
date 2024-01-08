import 'package:injectable/injectable.dart';
import 'package:zheeta/profile/domain/repository/user_transaction_repository.dart';
import 'package:zheeta/profile/domain/usecase/user_transaction_usecase.dart';

@prod
@LazySingleton(as: UserTransactionUseCase)
class UserTransactionUseCaseImpl implements UserTransactionUseCase {
  final UserTransactionRepository _repository;
  UserTransactionUseCaseImpl(this._repository);

  @override
  getUserTransactionsUseCase({required String userId, required int pageNumber, required int pageSize}) {
    return _repository.getUserTransactionsRepo(
      userId: userId,
      pageNumber: pageNumber,
      pageSize: pageSize,
    );
  }
}
