import '../model/subscription_model.dart';

abstract class SubscriptionDataSource {
  Future<SubscriptionListModel> getAllSubscriptions();
}
