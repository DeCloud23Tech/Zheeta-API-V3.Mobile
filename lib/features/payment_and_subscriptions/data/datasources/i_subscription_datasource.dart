import 'package:zheeta/features/payment_and_subscriptions/data/models/charges_model.dart';
import 'package:zheeta/features/payment_and_subscriptions/data/models/subscription_model.dart';

abstract class ISubscriptionDataSource {
  Future<ChargesListModel> getAllCharges();
  Future<SubscriptionListModel> getAllSubscriptions();
}
