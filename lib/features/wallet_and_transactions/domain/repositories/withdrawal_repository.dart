import 'package:zheeta/core/constants/type_def.dart';
import 'package:zheeta/features/wallet_and_transactions/data/models/pay_out_model.dart';
import 'package:zheeta/features/wallet_and_transactions/data/models/rate_by_country_model.dart';

abstract class IWithdrawalRepository {
  ResultFuture<PayoutData> processPayOut({
    required double coinAmount,
    required String payOutAccountId,
  });

  ResultFuture<RateByCountry> getRateByCountry({
    required String countryName,
  });
}
