import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:zheeta/payment_and_subscriptions/data/model/subscription_model.dart';
import 'package:zheeta/payment_and_subscriptions/domain/usecase/get_subscriptions_usecase.dart';


part 'subscription_state.dart';

@prod
@LazySingleton()
class SubscriptionCubit extends Cubit<SubscriptionState> {
  GetAllSubscriptions getAllSubscriptions;

  SubscriptionCubit({required this.getAllSubscriptions})
      : super(SubscriptionInitial());

  Future<SubscriptionListModel?> getAllSubscriptionCubit() async {
    emit(SubscriptionsLoading());
    var result = await getAllSubscriptions();
    SubscriptionListModel? data;
    result.fold(
      (fail) {
        emit(SubscriptionsError(fail.message));
      },
      (success) {
        emit(SubscriptionsSuccess(success));
        data = success;
      },
    );
    return data;
  }
}
