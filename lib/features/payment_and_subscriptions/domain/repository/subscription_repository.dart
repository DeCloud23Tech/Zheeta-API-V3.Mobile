import 'package:zheeta/common/constants/type_def.dart';
import 'package:zheeta/features/payment_and_subscriptions/data/model/charges_model.dart';
import 'package:zheeta/features/payment_and_subscriptions/data/model/subscription_model.dart';


abstract class SubscriptionRepository {
  ResultFuture<ChargesListModel> getAllCharges();
  ResultFuture<SubscriptionListModel> getAllSubscriptions();
}