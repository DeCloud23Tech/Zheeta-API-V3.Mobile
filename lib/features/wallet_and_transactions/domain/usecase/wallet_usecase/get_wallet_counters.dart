import 'package:injectable/injectable.dart';
import 'package:zheeta/common/constants/type_def.dart';
import 'package:zheeta/common/usecase/usecases.dart';
import 'package:zheeta/features/wallet_and_transactions/data/model/wallet_counters_model.dart';
import 'package:zheeta/features/wallet_and_transactions/domain/repository/wallet_repository.dart';

@prod
@LazySingleton()
class GetWalletCounters extends UsecaseWithoutParams<WalletCounters> {
  const GetWalletCounters(this._repo);

  final WalletRepository _repo;

  @override
  ResultFuture<WalletCounters> call() async {
    return await _repo.getZheetaWallet();
  }
}