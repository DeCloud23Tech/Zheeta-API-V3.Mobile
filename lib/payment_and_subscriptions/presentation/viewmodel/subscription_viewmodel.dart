import 'package:injectable/injectable.dart';
import 'package:zheeta/payment_and_subscriptions/presentation/bloc/subscription/subscription_cubit.dart';

@prod
@LazySingleton()
class SubscriptionViewmodel {
  final SubscriptionCubit subscriptionCubit;

  SubscriptionViewmodel(this.subscriptionCubit);

  void fetchAllSubscriptions() {
    subscriptionCubit.getAllSubscriptionCubit();
  }

  SubscriptionState get state => subscriptionCubit.state;

  Stream<SubscriptionState> get stateStream => subscriptionCubit.stream;
}
