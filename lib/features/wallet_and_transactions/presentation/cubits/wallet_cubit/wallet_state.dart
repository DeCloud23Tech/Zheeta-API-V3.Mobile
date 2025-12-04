part of 'wallet_cubit.dart';

abstract class WalletState extends Equatable {
  @override
  List<Object?> get props => [];
}

class WalletInitial extends WalletState {}

class WalletLoading extends WalletState {}

class WalletLoaded extends WalletState {
  final WalletCounters walletCounters;

  WalletLoaded(this.walletCounters);

  @override
  List<Object?> get props => [walletCounters];
}

class WalletTransferLoading extends WalletState {}

class WalletTransferSuccess extends WalletState {}

class WalletError extends WalletState {
  final String message;

  WalletError(this.message);

  @override
  List<Object?> get props => [message];
}
