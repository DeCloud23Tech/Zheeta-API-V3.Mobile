import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:zheeta/features/payment_and_subscriptions/data/models/payment_countries_model.dart';
import 'package:zheeta/features/payment_and_subscriptions/data/models/payment_account_model.dart';
import 'package:zheeta/features/payment_and_subscriptions/domain/usecases/payout_usecase.dart';

part 'payout_state.dart';

@prod
@LazySingleton()
class PayoutCubit extends Cubit<PayoutState> {
  final AddBankAccount addBankAccount;
  final AddMobileMoneyAccount addMobileMoneyAccount;
  final AddPaypalAccount addPaypalAccount;
  final AddCryptoAccount addCryptoAccount;
  final GetAllAccounts getAllAccounts;
  final GetAccountById getAccountById;
  final DeleteAccountById deleteAccountById;
  final GetPayoutCountries getPayoutCountries;

  PayoutCubit({
    required this.addBankAccount,
    required this.addMobileMoneyAccount,
    required this.addPaypalAccount,
    required this.addCryptoAccount,
    required this.getAllAccounts,
    required this.getAccountById,
    required this.deleteAccountById,
    required this.getPayoutCountries,
  }) : super(PayoutInitial());

  // Add Bank Account
  Future<void> addBankAccountMethod(AddBankAccountParams params) async {
    emit(PayoutLoading());
    final result = await addBankAccount(params);
    result.fold(
      (failure) => emit(PayoutError(message: failure.message)),
      (success) =>
          emit(PayoutSuccess(message: 'Bank account added successfully')),
    );
  }

  // Add Mobile Money Account
  Future<void> addMobileMoneyAccountMethod(
      AddMobileMoneyAccountParams params) async {
    emit(PayoutLoading());
    final result = await addMobileMoneyAccount(params);
    result.fold(
      (failure) => emit(PayoutError(message: failure.message)),
      (success) => emit(
          PayoutSuccess(message: 'Mobile money account added successfully')),
    );
  }

  // Add PayPal Account
  Future<void> addPaypalAccountMethod(AddPaypalAccountParams params) async {
    emit(PayoutLoading());
    final result = await addPaypalAccount(params);
    result.fold(
      (failure) => emit(PayoutError(message: failure.message)),
      (success) =>
          emit(PayoutSuccess(message: 'PayPal account added successfully')),
    );
  }

  // Add Crypto Account
  Future<void> addCryptoAccountMethod(AddCryptoAccountParams params) async {
    emit(PayoutLoading());
    final result = await addCryptoAccount(params);
    result.fold(
      (failure) => emit(PayoutError(message: failure.message)),
      (success) =>
          emit(PayoutSuccess(message: 'Crypto account added successfully')),
    );
  }

  // Get All Accounts
  Future<void> fetchAllAccounts() async {
    emit(PayoutLoading());
    final result = await getAllAccounts();
    result.fold(
      (failure) => emit(PayoutError(message: failure.message)),
      (accounts) => emit(PayoutAccountsLoaded(accounts: accounts)),
    );
  }

  // Get Account By ID
  Future<void> fetchAccountById(String accountId) async {
    emit(PayoutLoading());
    final result = await getAccountById(accountId);
    result.fold(
      (failure) => emit(PayoutError(message: failure.message)),
      (account) => emit(PayoutAccountLoaded(account: account)),
    );
  }

  Future<void> deleteAccount(String accountId) async {
    emit(PayoutLoading());
    final result = await deleteAccountById(accountId);
    result.fold(
      (failure) => emit(PayoutError(message: failure.message)),
      (success) async {
        emit(PayoutSuccess(message: 'Account deleted successfully'));
        await fetchAllAccounts(); // Refresh the list after successful deletion
      },
    );
  }

  Future<void> fetchPayoutCountries() async {
    emit(PayoutLoading());
    final result = await getPayoutCountries();
    result.fold((failure) => emit(PayoutError(message: failure.message)),
        (countries) => emit(PayoutCountriesLoaded(countries: countries)));
  }
}
