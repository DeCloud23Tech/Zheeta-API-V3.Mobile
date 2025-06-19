import 'package:injectable/injectable.dart';
import 'package:zheeta/common/constants/type_def.dart';
import 'package:zheeta/common/usecase/usecases.dart';
import 'package:zheeta/features/wallet_and_transactions/domain/repository/wallet_repository.dart';

@prod
@LazySingleton()
class TransferToUserWallet extends UsecaseWithParams<void, TransferParams> {
  const TransferToUserWallet(this._repo);

  final WalletRepository _repo;

  @override
  ResultFuture<void> call(TransferParams params) async {
    return await _repo.transferToUserWallet(
      receiverUsername: params.receiverUsername,
      message: params.message,
      amount: params.amount,
    );
  }
}

class TransferParams {
  final String receiverUsername;
  final String message;
  final double amount;

  const TransferParams({
    required this.receiverUsername,
    required this.message,
    required this.amount,
  });
}
