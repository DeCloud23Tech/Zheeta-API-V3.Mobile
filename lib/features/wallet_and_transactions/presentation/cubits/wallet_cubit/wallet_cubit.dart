import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:zheeta/features/wallet_and_transactions/data/models/wallet_counters_model.dart';
import 'package:zheeta/features/wallet_and_transactions/domain/usecases/wallet_usecase/get_wallet_counters.dart';
import 'package:zheeta/features/wallet_and_transactions/domain/usecases/wallet_usecase/transfer_to_user_wallet_balance.dart';

part 'wallet_state.dart';

@prod
@LazySingleton()
class WalletCubit extends Cubit<WalletState> {
  final GetWalletCounters getWalletCounters;
  final TransferToUserWallet transferToUserWallet;

  WalletCubit({
    required this.getWalletCounters,
    required this.transferToUserWallet,
  }) : super(WalletInitial());

  Future<void> fetchWalletCounters() async {
    emit(WalletLoading());
    final result = await getWalletCounters();
    result.fold(
      (failure) => emit(WalletError(failure.message)),
      (walletData) => emit(WalletLoaded(walletData)),
    );
  }

  Future<void> transferFundsCubit({
    required String receiverUsername,
    required String message,
    required double amount,
  }) async {
    emit(WalletTransferLoading());
    final result = await transferToUserWallet(
      TransferParams(
          receiverUsername: receiverUsername, message: message, amount: amount),
    );
    result.fold(
      (failure) => emit(WalletError(failure.message)),
      (_) => emit(WalletTransferSuccess()),
    );
  }
}
