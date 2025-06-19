import 'package:zheeta/features/wallet_and_transactions/data/model/wallet_counters_model.dart';

abstract class WalletDataSource {
  Future<WalletCounters> getZheetaWallet();


  Future transferToUserWallet({
    required String receiverUsername,
    required String message,
    required double amount,
  });
}
