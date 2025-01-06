
import 'package:zheeta/wallet/data/model/zheeta_wallet_model.dart';


abstract class WalletDataSource {
  Future<ZheetaWalletModel> getZheetaWallet({
    required String id
  });

  Future<double> getTotalWalletAmount();

  Future<double> getUserAvailableBalance({
    required String userId,
  });

  Future transferToUserWallet({
    required String fromUserId,
    required String toUserId,
    required double amount,
  });
}
