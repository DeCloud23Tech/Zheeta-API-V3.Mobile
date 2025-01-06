import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/usecase/withdrawal_usecase/get_rate_by_country_usecase.dart';

part 'withdrawal_state.dart';

@prod
@LazySingleton()
class WithdrawalCubit extends Cubit<WithdrawalState> {
  final GetRateByCountry getRateByCountry;

  WithdrawalCubit({required this.getRateByCountry})
      : super(WithdrawalInitial());

  Future<void> getRateByCountryCubit(String countryName) async {
    emit(WithdrawalLoading());

    final result = await getRateByCountry(countryName);
    result.fold(
      (failure) {
        emit(WithdrawalFailure(failure.message));
      },
      (rate) {
        emit(WithdrawalRate(rate));
      },
    );
  }
}
