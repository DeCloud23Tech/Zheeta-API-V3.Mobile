import 'package:zheeta/app/common/type_def.dart';

import '../../data/model/payment_account_model.dart';

abstract class PayoutAccountRepository {
  ResultFuture<bool> verifyAccount({
    required String bankAccount,
    required String bankCode,
  });

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

  // ResultFuture<List<CountryModel>> getPayoutCountries();

  // ResultFuture<List<PayoutOptionModel>> getCountryPayoutOptions(
  //     String countryCode);

  // ResultFuture<List<MandatoryFieldModel>> getPayoutMandatoryFields();
}
