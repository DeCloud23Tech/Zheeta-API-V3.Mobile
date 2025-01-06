import 'package:zheeta/app/common/type_def.dart';
import '../../data/model/zheeta_wallet_model.dart';

abstract class WalletRepository {
  ResultFuture<ZheetaWalletModel> getZheetaWallet({required String id});

  ResultFuture<double> getTotalWalletAmount();

  ResultFuture<double> getUserAvailableBalance({required String userId});

  ResultVoid transferToUserWallet({
    required String fromUserId,
    required String toUserId,
    required double amount,
  });
}
