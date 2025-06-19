import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:zheeta/features/wallet_and_transactions/data/model/pay_out_model.dart';
import 'package:zheeta/features/wallet_and_transactions/domain/usecase/withdrawal_usecase/process_payout_usecase.dart';
import '../../../domain/usecase/withdrawal_usecase/get_rate_by_country_usecase.dart';

part 'withdrawal_state.dart';

@prod
@LazySingleton()
class WithdrawalCubit extends Cubit<WithdrawalState> {
  final GetRateByCountry getRateByCountry;
  final ProcessPayout processPayout;

  WithdrawalCubit({
    required this.getRateByCountry,
    required this.processPayout,
  }) : super(WithdrawalInitial());

  Future<void> getRateByCountryCubit(String countryName) async {
    emit(WithdrawalLoading());

    final result = await getRateByCountry(countryName);
    result.fold(
          (failure) => emit(WithdrawalFailure(failure.message)),
          (rate) => emit(WithdrawalRate(rate)),
    );
  }

  Future<void> processPayoutCubit({
    required double coinAmount,
    required String payOutAccountId,
  }) async {
    emit(WithdrawalLoading());

    final result = await processPayout(ProcessPayoutParams(
      coinAmount: coinAmount,
      payOutAccountId: payOutAccountId,
    ));

    result.fold(
          (failure) => emit(WithdrawalFailure(failure.message)),
          (payoutData) => emit(WithdrawalSuccess(payoutData)),
    );
  }
}
