import 'package:zheeta/core/constants/type_def.dart';
import 'package:zheeta/features/payment_and_subscriptions/data/models/charges_model.dart';
import 'package:zheeta/features/payment_and_subscriptions/data/models/subscription_model.dart';

abstract class ISubscriptionRepository {
  ResultFuture<ChargesListModel> getAllCharges();
  ResultFuture<SubscriptionListModel> getAllSubscriptions();
}
