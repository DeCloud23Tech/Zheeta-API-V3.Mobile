import 'package:injectable/injectable.dart';
import 'package:zheeta/common/constants/type_def.dart';
import 'package:zheeta/common/usecase/usecases.dart';
import 'package:zheeta/features/payment_and_subscriptions/data/model/payment_account_model.dart';
import 'package:zheeta/features/payment_and_subscriptions/data/model/payment_countries_model.dart';
import 'package:zheeta/features/payment_and_subscriptions/domain/repository/payout_account_repository.dart';

// Add Bank Account Use Case
@prod
@LazySingleton()
class AddBankAccount extends UsecaseWithParams<bool, AddBankAccountParams> {
  const AddBankAccount(this._repo);

  final PayoutAccountRepository _repo;

  @override
  ResultFuture<bool> call(AddBankAccountParams params) async =>
      await _repo.addBankAccount(
        userId: params.userId,
        firstName: params.firstName,
        lastName: params.lastName,
        countryIso2Code: params.countryIso2Code,
        currency: params.currency,
        bankId: params.bankId,
        bankName: params.bankName,
        bankCode: params.bankCode,
        branchCode: params.branchCode,
        accountNumber: params.accountNumber,
        routingNumber: params.routingNumber,
        swiftCode: params.swiftCode,
      );
}

class AddBankAccountParams {
  final String userId;
  final String firstName;
  final String lastName;
  final String countryIso2Code;
  final String currency;
  final String bankId;
  final String bankName;
  final String bankCode;
  final String branchCode;
  final String accountNumber;
  final String routingNumber;
  final String swiftCode;

  AddBankAccountParams({
    required this.userId,
    required this.firstName,
    required this.lastName,
    required this.countryIso2Code,
    required this.currency,
    required this.bankId,
    required this.bankName,
    required this.bankCode,
    required this.branchCode,
    required this.accountNumber,
    required this.routingNumber,
    required this.swiftCode,
  });
}

// Add Mobile Money Account Use Case
@prod
@LazySingleton()
class AddMobileMoneyAccount
    extends UsecaseWithParams<bool, AddMobileMoneyAccountParams> {
  const AddMobileMoneyAccount(this._repo);

  final PayoutAccountRepository _repo;

  @override
  ResultFuture<bool> call(AddMobileMoneyAccountParams params) async =>
      await _repo.addMobileMoneyAccount(
        userId: params.userId,
        firstName: params.firstName,
        lastName: params.lastName,
        countryIso2Code: params.countryIso2Code,
        currency: params.currency,
        mobileMoneyProvider: params.mobileMoneyProvider,
        mobileMoneyAccount: params.mobileMoneyAccount,
      );
}

class AddMobileMoneyAccountParams {
  final String userId;
  final String firstName;
  final String lastName;
  final String countryIso2Code;
  final String currency;
  final String mobileMoneyProvider;
  final String mobileMoneyAccount;

  AddMobileMoneyAccountParams({
    required this.userId,
    required this.firstName,
    required this.lastName,
    required this.countryIso2Code,
    required this.currency,
    required this.mobileMoneyProvider,
    required this.mobileMoneyAccount,
  });
}

// Add PayPal Account Use Case
@prod
@LazySingleton()
class AddPaypalAccount extends UsecaseWithParams<bool, AddPaypalAccountParams> {
  const AddPaypalAccount(this._repo);

  final PayoutAccountRepository _repo;

  @override
  ResultFuture<bool> call(AddPaypalAccountParams params) async =>
      await _repo.addPaypalAccount(
        userId: params.userId,
        firstName: params.firstName,
        lastName: params.lastName,
        countryIso2Code: params.countryIso2Code,
        currency: params.currency,
        paypalAddress: params.paypalAddress,
      );
}

class AddPaypalAccountParams {
  final String userId;
  final String firstName;
  final String lastName;
  final String countryIso2Code;
  final String currency;
  final String paypalAddress;

  AddPaypalAccountParams({
    required this.userId,
    required this.firstName,
    required this.lastName,
    required this.countryIso2Code,
    required this.currency,
    required this.paypalAddress,
  });
}

// Add Crypto Account Use Case
@prod
@LazySingleton()
class AddCryptoAccount extends UsecaseWithParams<bool, AddCryptoAccountParams> {
  const AddCryptoAccount(this._repo);

  final PayoutAccountRepository _repo;

  @override
  ResultFuture<bool> call(AddCryptoAccountParams params) async =>
      await _repo.addCryptoAccount(
        userId: params.userId,
        firstName: params.firstName,
        lastName: params.lastName,
        countryIso2Code: params.countryIso2Code,
        currency: params.currency,
        cryptoCoinName: params.cryptoCoinName,
        cryptoCoinAddress: params.cryptoCoinAddress,
      );
}

class AddCryptoAccountParams {
  final String userId;
  final String firstName;
  final String lastName;
  final String countryIso2Code;
  final String currency;
  final String cryptoCoinName;
  final String cryptoCoinAddress;

  AddCryptoAccountParams({
    required this.userId,
    required this.firstName,
    required this.lastName,
    required this.countryIso2Code,
    required this.currency,
    required this.cryptoCoinName,
    required this.cryptoCoinAddress,
  });
}

// Get All Accounts Use Case
@prod
@LazySingleton()
class GetAllAccounts extends UsecaseWithoutParams<List<PaymentAccount>> {
  const GetAllAccounts(this._repo);

  final PayoutAccountRepository _repo;

  @override
  ResultFuture<List<PaymentAccount>> call() async =>
      await _repo.getAllAccounts();
}

// Get Account By ID Use Case
@prod
@LazySingleton()
class GetAccountById extends UsecaseWithParams<PaymentAccount, String> {
  const GetAccountById(this._repo);

  final PayoutAccountRepository _repo;

  @override
  ResultFuture<PaymentAccount> call(String params) async =>
      await _repo.getAccountById(params);
}

// Delete Account By ID Use Case
@prod
@LazySingleton()
class DeleteAccountById extends UsecaseWithParams<bool, String> {
  const DeleteAccountById(this._repo);

  final PayoutAccountRepository _repo;

  @override
  ResultFuture<bool> call(String params) async =>
      await _repo.deleteAccountById(params);
}

// Get Payout Countries Use Case
@prod
@LazySingleton()
class GetPayoutCountries extends UsecaseWithoutParams<List<CountryData>> {
  const GetPayoutCountries(this._repo);

  final PayoutAccountRepository _repo;

  @override
  ResultFuture<List<CountryData>> call() async =>
      await _repo.getPayoutCountries();
}
