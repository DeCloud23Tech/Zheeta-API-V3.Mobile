import 'package:injectable/injectable.dart';
import 'package:zheeta/app/common/type_def.dart';
import 'package:zheeta/app/common/usecase/usecases.dart';
import 'package:zheeta/payment_and_subscriptions/data/model/charges_model.dart';

import '../../data/model/subscription_model.dart';
import '../repository/subscription_repository.dart';

@prod
@LazySingleton()
class GetAllCharges extends UsecaseWithoutParams<ChargesListModel> {
  const GetAllCharges(this._repo);

  final SubscriptionRepository _repo;

  @override
  ResultFuture<ChargesListModel> call() async => await _repo.getAllCharges();
}
