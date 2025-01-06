import 'package:injectable/injectable.dart';
import 'package:zheeta/app/common/type_def.dart';
import 'package:zheeta/wallet/data/datasource/wallet_datasource.dart';
import 'package:zheeta/wallet/domain/repository/wallet_repository.dart';

import '../model/zheeta_wallet_model.dart';
@prod
@LazySingleton(as: WalletRepository)
class WalletRepositoryImpl implements WalletRepository {
  final WalletDataSource _datasource;

  WalletRepositoryImpl(this._datasource);

  @override
  ResultFuture<double> getTotalWalletAmount() {
    // TODO: implement getTotalWalletAmount
    throw UnimplementedError();
  }

  @override
  ResultFuture<double> getUserAvailableBalance({required String userId}) {
    // TODO: implement getUserAvailableBalance
    throw UnimplementedError();
  }

  @override
  ResultFuture<ZheetaWalletModel> getZheetaWallet({required String id}) {
    // TODO: implement getZheetaWallet
    throw UnimplementedError();
  }

  @override
  ResultVoid transferToUserWallet({required String fromUserId, required String toUserId, required double amount}) {
    // TODO: implement transferToUserWallet
    throw UnimplementedError();
  }
}
