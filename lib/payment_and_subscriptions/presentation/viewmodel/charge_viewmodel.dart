import 'package:injectable/injectable.dart';
import 'package:zheeta/payment_and_subscriptions/presentation/bloc/subscription/subscription_cubit.dart';

import '../bloc/charges/charges_cubit.dart';

@prod
@LazySingleton()
class ChargesViewModel {
  final ChargesCubit chargesCubit;

  ChargesViewModel(this.chargesCubit);

  void fetchAllCharges() {
    chargesCubit.getAllChargesCubit();
  }

  ChargesState get state => chargesCubit.state;

  Stream<ChargesState> get stateStream => chargesCubit.stream;
}
