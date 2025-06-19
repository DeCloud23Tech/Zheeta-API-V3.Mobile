import 'package:injectable/injectable.dart';
import 'package:zheeta/common/constants/type_def.dart';
import 'package:zheeta/common/usecase/usecases.dart';
import 'package:zheeta/features/payment_and_subscriptions/data/model/subscription_model.dart';
import 'package:zheeta/features/payment_and_subscriptions/domain/repository/subscription_repository.dart';

@prod
@LazySingleton()
class GetAllSubscriptions extends UsecaseWithoutParams<SubscriptionListModel> {
  const GetAllSubscriptions(this._repo);

  final SubscriptionRepository _repo;

  @override
  ResultFuture<SubscriptionListModel> call() async => await _repo.getAllSubscriptions();
}
