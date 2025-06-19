import 'package:zheeta/features/payment_and_subscriptions/data/model/charges_model.dart';
import 'package:zheeta/features/payment_and_subscriptions/data/model/subscription_model.dart';

abstract class SubscriptionDataSource {
  Future<ChargesListModel> getAllCharges();
  Future<SubscriptionListModel> getAllSubscriptions();
}
