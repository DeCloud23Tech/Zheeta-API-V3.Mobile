import 'package:injectable/injectable.dart';
import 'package:zheeta/core/common/usecase/usecases.dart';
import 'package:zheeta/core/constants/type_def.dart';
import 'package:zheeta/features/payment_and_subscriptions/data/models/subscription_model.dart';
import 'package:zheeta/features/payment_and_subscriptions/domain/repositories/subscription_repository.dart';

@prod
@LazySingleton()
class GetAllSubscriptions extends UsecaseWithoutParams<SubscriptionListModel> {
  const GetAllSubscriptions(this._repo);

  final ISubscriptionRepository _repo;

  @override
  ResultFuture<SubscriptionListModel> call() async =>
      await _repo.getAllSubscriptions();
}
