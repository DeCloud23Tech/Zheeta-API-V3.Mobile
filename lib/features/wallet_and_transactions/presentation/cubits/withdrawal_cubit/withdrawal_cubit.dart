import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:zheeta/features/wallet_and_transactions/data/models/pay_out_model.dart';
import 'package:zheeta/features/wallet_and_transactions/domain/usecases/withdrawal_usecase/get_rate_by_country_usecase.dart';
import 'package:zheeta/features/wallet_and_transactions/domain/usecases/withdrawal_usecase/process_payout_usecase.dart';

part 'withdrawal_state.dart';

@prod
@LazySingleton()
class WithdrawalCubit extends Cubit<WithdrawalState> {
  final GetRateByCountry getRateByCountry;
  final ProcessPayout processPayout;

  WithdrawalCubit({
    required this.getRateByCountry,
    required this.processPayout,
  }) : super(const WithdrawalInitial());

  Future<void> getRateByCountryCubit(String countryName) async {
    // Emit loading state, preserving existing data (rate or payout) and error if any
    emit(WithdrawalLoading(
      currentRate: state.currentRate,
      lastPayoutData: state.lastPayoutData,
      errorMessage: state.errorMessage, // Preserve error message
    ));

    final result = await getRateByCountry(countryName);
    result.fold(
      (failure) => emit(WithdrawalFailure(
        failure.message,
        currentRate: state.currentRate, // Preserve data on failure
        lastPayoutData: state.lastPayoutData,
      )),
      // Emit the new state that specifically holds the rate
      (rate) => emit(WithdrawalRateLoaded(rate)),
    );
  }

  Future<void> processPayoutCubit({
    required double coinAmount,
    required String payOutAccountId,
  }) async {
    // Emit loading state, preserving existing data (rate or payout) and error if any
    emit(WithdrawalLoading(
      currentRate: state.currentRate,
      lastPayoutData: state.lastPayoutData,
      errorMessage: state.errorMessage, // Preserve error message
    ));

    final result = await processPayout(ProcessPayoutParams(
      coinAmount: coinAmount,
      payOutAccountId: payOutAccountId,
    ));
    result.fold(
      (failure) => emit(WithdrawalFailure(
        failure.message,
        currentRate: state.currentRate, // Preserve data on failure
        lastPayoutData: state.lastPayoutData,
      )),
      // Emit the new state that specifically holds the payout data
      (payoutData) => emit(WithdrawalPayoutSuccess(payoutData)),
    );
  }
}
