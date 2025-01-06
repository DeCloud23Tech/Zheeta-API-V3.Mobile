import 'package:zheeta/app/common/type_def.dart';
import 'package:zheeta/wallet/data/model/pay_out_model.dart';

import '../../data/model/banks_model.dart';

abstract class WithdrawalRepository {
  ResultFuture<List<BankModel>> getAllBanks({String? countryIso2Code});

  ResultFuture<List<BankModel>> getBankBranches({
    required String id,
  });

  ResultFuture<PayoutDataModel> processPayOut({
    required double coinAmount,
    required String payOutAccountId,
  });

  ResultFuture<double> getRateByCountry({
    required String countryName,
  });
}
