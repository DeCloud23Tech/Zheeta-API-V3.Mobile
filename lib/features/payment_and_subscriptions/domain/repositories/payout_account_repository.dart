import 'package:zheeta/core/constants/type_def.dart';
import 'package:zheeta/features/payment_and_subscriptions/data/models/payment_account_model.dart';
import 'package:zheeta/features/payment_and_subscriptions/data/models/payment_countries_model.dart';

abstract class IPayoutAccountRepository {
  ResultFuture<bool> addBankAccount({
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

  ResultFuture<bool> addMobileMoneyAccount({
    required String userId,
    required String firstName,
    required String lastName,
    required String countryIso2Code,
    required String currency,
    required String mobileMoneyProvider,
    required String mobileMoneyAccount,
  });

  ResultFuture<bool> addPaypalAccount({
    required String userId,
    required String firstName,
    required String lastName,
    required String countryIso2Code,
    required String currency,
    required String paypalAddress,
  });

  ResultFuture<bool> addCryptoAccount({
    required String userId,
    required String firstName,
    required String lastName,
    required String countryIso2Code,
    required String currency,
    required String cryptoCoinName,
    required String cryptoCoinAddress,
  });

  ResultFuture<List<PaymentAccount>> getAllAccounts();

  ResultFuture<PaymentAccount> getAccountById(String accountId);

  ResultFuture<bool> deleteAccountById(String accountId);

  ResultFuture<List<CountryData>> getPayoutCountries();
}
