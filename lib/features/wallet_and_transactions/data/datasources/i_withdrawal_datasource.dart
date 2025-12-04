

import 'package:zheeta/features/wallet_and_transactions/data/models/pay_out_model.dart';

abstract class IWithdrawalDataSource {
  Future<PayoutData> processPayOut({
    required double coinAmount,
    required String payOutAccountId,
  });

  Future<double> getRateByCountry({
    required String countryName,
  });
}
