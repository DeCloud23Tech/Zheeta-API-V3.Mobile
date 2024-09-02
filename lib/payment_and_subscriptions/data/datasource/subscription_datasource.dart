import 'package:zheeta/payment_and_subscriptions/data/model/charges_model.dart';

import '../model/subscription_model.dart';

abstract class SubscriptionDataSource {
  Future<ChargesListModel> getAllCharges();
  Future<SubscriptionListModel> getAllSubscriptions();
}
