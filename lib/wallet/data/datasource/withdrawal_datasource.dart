import 'package:zheeta/wallet/data/model/banks_model.dart';
import 'package:zheeta/wallet/data/model/pay_out_model.dart';

abstract class WithdrawalDataSource {
  Future<List<BankModel>> getAllBanks({
    String? countryIso2Code,
  });

  Future<List<BankModel>> getBankBranches({
    required String id,
  });

  Future<PayoutDataModel> processPayOut({
    required double coinAmount,
    required String payOutAccountId,
  });

  Future<double> getRateByCountry({
    required String countryName,
  });
}
