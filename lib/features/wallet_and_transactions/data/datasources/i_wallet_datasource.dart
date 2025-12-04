import 'package:zheeta/features/wallet_and_transactions/data/models/wallet_counters_model.dart';

abstract class IWalletDataSource {
  Future<WalletCounters> getZheetaWallet();

  Future transferToUserWallet({
    required String receiverUsername,
    required String message,
    required double amount,
  });
}
