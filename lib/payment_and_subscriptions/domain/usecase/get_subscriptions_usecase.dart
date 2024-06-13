import 'package:injectable/injectable.dart';
import 'package:zheeta/app/common/type_def.dart';
import 'package:zheeta/app/common/usecase/usecases.dart';

import '../../data/model/subscription_model.dart';
import '../repository/subscription_repository.dart';

@prod
@LazySingleton()
class GetAllSubscriptions extends UsecaseWithoutParams<SubscriptionListModel> {
  const GetAllSubscriptions(this._repo);

  final SubscriptionRepository _repo;

  @override
  ResultFuture<SubscriptionListModel> call() async => await _repo.getAllSubscriptions();
}
