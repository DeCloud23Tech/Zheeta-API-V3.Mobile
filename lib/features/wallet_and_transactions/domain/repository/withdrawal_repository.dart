

import 'package:zheeta/common/constants/type_def.dart';
import 'package:zheeta/features/wallet_and_transactions/data/model/banks_model.dart';
import 'package:zheeta/features/wallet_and_transactions/data/model/pay_out_model.dart';

abstract class WithdrawalRepository {

  ResultFuture<PayoutData> processPayOut({
    required double coinAmount,
    required String payOutAccountId,
  });

  ResultFuture<double> getRateByCountry({
    required String countryName,
  });
}
