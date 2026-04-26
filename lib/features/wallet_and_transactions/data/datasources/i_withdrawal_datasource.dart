import 'package:zheeta/features/wallet_and_transactions/data/models/pay_out_model.dart';
import 'package:zheeta/features/wallet_and_transactions/data/models/rate_by_country_model.dart';

abstract class IWithdrawalDataSource {
  Future<PayoutData> processPayOut({
    required double coinAmount,
    required String payOutAccountId,
  });

  Future<RateByCountry> getRateByCountry({
    required String countryName,
  });
}
