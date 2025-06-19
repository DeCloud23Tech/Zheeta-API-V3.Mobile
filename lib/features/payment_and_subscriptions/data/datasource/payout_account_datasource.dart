
import 'package:zheeta/common/constants/type_def.dart';
import 'package:zheeta/features/payment_and_subscriptions/data/model/payment_account_model.dart';
import 'package:zheeta/features/payment_and_subscriptions/data/model/payment_countries_model.dart';

abstract class PayoutAccountDataSource {

  Future<bool> addBankAccount({
    required String userId,
    required String firstName,
    required String lastName,
    required String countryIso2Code,
    required String currency,
    required String bankId,
    required String bankName,
    required String bankCode,
    required String branchCode,
    required String accountNumber,
    required String routingNumber,
    required String swiftCode,
  });

  Future<bool> addMobileMoneyAccount({
    required String userId,
    required String firstName,
    required String lastName,
    required String countryIso2Code,
    required String currency,
    required String mobileMoneyProvider,
    required String mobileMoneyAccount,
  });

  Future<bool> addPaypalAccount({
    required String userId,
    required String firstName,
    required String lastName,
    required String countryIso2Code,
    required String currency,
    required String paypalAddress,
  });

  Future<bool> addCryptoAccount({
    required String userId,
    required String firstName,
    required String lastName,
    required String countryIso2Code,
    required String currency,
    required String cryptoCoinName,
    required String cryptoCoinAddress,
  });

  Future<List<PaymentAccount>> getAllAccounts();

  Future<PaymentAccount> getAccountById(String accountId);

  Future<bool> deleteAccountById(String accountId);

  Future<List<CountryData>> getPayoutCountries();

}
