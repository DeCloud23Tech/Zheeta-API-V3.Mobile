import 'package:injectable/injectable.dart';
import 'package:zheeta/core/common/usecase/usecases.dart';
import 'package:zheeta/core/constants/type_def.dart';
import 'package:zheeta/features/wallet_and_transactions/domain/repositories/wallet_repository.dart';

@prod
@LazySingleton()
class TransferToUserWallet extends UsecaseWithParams<void, TransferParams> {
  const TransferToUserWallet(this._repo);

  final IWalletRepository _repo;

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
