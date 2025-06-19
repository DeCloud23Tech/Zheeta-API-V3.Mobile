import 'package:zheeta/common/constants/type_def.dart';
import 'package:zheeta/features/wallet_and_transactions/data/model/wallet_counters_model.dart';

abstract class WalletRepository {
  ResultFuture<WalletCounters> getZheetaWallet();

  ResultVoid transferToUserWallet({
    required String receiverUsername,
    required String message,
    required double amount,
  });
}
