
import 'package:zheeta/features/wallet_and_transactions/data/model/banks_model.dart';
import 'package:zheeta/features/wallet_and_transactions/data/model/pay_out_model.dart';

abstract class WithdrawalDataSource {
  Future<PayoutData> processPayOut({
    required double coinAmount,
    required String payOutAccountId,
  });

  Future<double> getRateByCountry({
    required String countryName,
  });
}
