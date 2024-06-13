import '../../../app/common/type_def.dart';
import '../../data/model/subscription_model.dart';


abstract class SubscriptionRepository {
  ResultFuture<SubscriptionListModel> getAllSubscriptions();
}