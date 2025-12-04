import 'package:zheeta/core/constants/type_def.dart';
import 'package:zheeta/features/wallet_and_transactions/data/models/wallet_counters_model.dart';

abstract class IWalletRepository {
  ResultFuture<WalletCounters> getZheetaWallet();

  ResultVoid transferToUserWallet({
    required String receiverUsername,
    required String message,
    required double amount,
  });
}
