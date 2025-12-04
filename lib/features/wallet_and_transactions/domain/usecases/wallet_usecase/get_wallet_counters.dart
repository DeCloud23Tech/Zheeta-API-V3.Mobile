import 'package:injectable/injectable.dart';
import 'package:zheeta/core/common/usecase/usecases.dart';
import 'package:zheeta/core/constants/type_def.dart';
import 'package:zheeta/features/wallet_and_transactions/data/models/wallet_counters_model.dart';
import 'package:zheeta/features/wallet_and_transactions/domain/repositories/wallet_repository.dart';

@prod
@LazySingleton()
class GetWalletCounters extends UsecaseWithoutParams<WalletCounters> {
  const GetWalletCounters(this._repo);

  final IWalletRepository _repo;

  @override
  ResultFuture<WalletCounters> call() async {
    return await _repo.getZheetaWallet();
  }
}
