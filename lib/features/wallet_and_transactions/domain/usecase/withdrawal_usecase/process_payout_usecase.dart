import 'package:injectable/injectable.dart';
import 'package:zheeta/common/constants/type_def.dart';
import 'package:zheeta/common/usecase/usecases.dart';
import 'package:zheeta/features/wallet_and_transactions/data/model/pay_out_model.dart';
import 'package:zheeta/features/wallet_and_transactions/domain/repository/withdrawal_repository.dart';

@prod
@LazySingleton()
class ProcessPayout extends UsecaseWithParams<PayoutData, ProcessPayoutParams> {
  const ProcessPayout(this._repo);

  final WithdrawalRepository _repo;

  @override
  ResultFuture<PayoutData> call(ProcessPayoutParams params) async {
    return await _repo.processPayOut(
      coinAmount: params.coinAmount,
      payOutAccountId: params.payOutAccountId,
    );
  }
}

class ProcessPayoutParams {
  final double coinAmount;
  final String payOutAccountId;

  const ProcessPayoutParams({
    required this.coinAmount,
    required this.payOutAccountId,
  });
}
