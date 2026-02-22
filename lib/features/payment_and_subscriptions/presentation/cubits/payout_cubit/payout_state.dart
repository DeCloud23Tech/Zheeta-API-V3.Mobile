part of 'payout_cubit.dart';

abstract class PayoutState extends Equatable {
  @override
  List<Object> get props => [];
}

class PayoutInitial extends PayoutState {}

class PayoutLoading extends PayoutState {}

class PayoutSuccess extends PayoutState {
  final String message;

  PayoutSuccess({required this.message});

  @override
  List<Object> get props => [message];
}

class PayoutError extends PayoutState {
  final String message;

  PayoutError({required this.message});

  @override
  List<Object> get props => [message];
}

class PayoutAccountsLoaded extends PayoutState {
  final List<PaymentAccount> accounts;

  PayoutAccountsLoaded({required this.accounts});

  @override
  List<Object> get props => [accounts];
}

class PayoutAccountLoaded extends PayoutState {
  final PaymentAccount account;

  PayoutAccountLoaded({required this.account});

  @override
  List<Object> get props => [account];
}

class PayoutCountriesLoaded extends PayoutState {
  final List<CountryData> countries;
  final List<String> payoutMethods;
  final List<BankProvider> banks;

  PayoutCountriesLoaded({
    required this.countries,
    required this.payoutMethods,
    required this.banks,
  });

  @override
  List<Object> get props => [countries, payoutMethods, banks];
}
