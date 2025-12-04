import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:zheeta/features/payment_and_subscriptions/data/models/subscription_model.dart';
import 'package:zheeta/features/payment_and_subscriptions/domain/usecases/get_subscriptions_usecase.dart';

part 'subscription_state.dart';

@prod
@LazySingleton()
class SubscriptionCubit extends Cubit<SubscriptionState> {
  final GetAllSubscriptions getAllSubscriptions; // Make it final

  SubscriptionCubit({
    required this.getAllSubscriptions,
  }) : super(const SubscriptionInitial()); // Use const for initial state

  Future<void> getAllSubscriptionCubit() async {
    // Emit loading state, preserving any existing data or error
    emit(SubscriptionsLoadingState(
      subscriptions: state.subscriptions,
      errorMessage: state.errorMessage,
    ));

    var result = await getAllSubscriptions();
    result.fold(
      (fail) {
        // Emit error state, preserving existing data if fetch failed
        emit(SubscriptionsErrorState(
          errorMessage: fail.message,
          subscriptions: state.subscriptions,
        ));
      },
      (success) {
        // Emit success state with new data
        emit(SubscriptionsSuccessState(subscriptions: success));
      },
    );
  }

  // New method for updating subscription details (e.g., from a dialog)
  void updateSelectedSubscriptionDetails({
    required String description,
    required String feature,
    required SubscriptionModel selectedSubscription,
  }) {
    emit(SubscriptionUpdatedState(
      subscriptions: state.subscriptions, // Preserve existing subscription list
      description: description,
      feature: feature,
      selectedSubscription: selectedSubscription,
    ));
  }
}
