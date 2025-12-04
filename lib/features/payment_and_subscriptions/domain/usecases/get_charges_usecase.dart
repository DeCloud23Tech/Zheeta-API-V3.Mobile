import 'package:injectable/injectable.dart';
import 'package:zheeta/core/common/usecase/usecases.dart';
import 'package:zheeta/core/constants/type_def.dart';
import 'package:zheeta/features/payment_and_subscriptions/data/models/charges_model.dart';
import 'package:zheeta/features/payment_and_subscriptions/domain/repositories/subscription_repository.dart';

@prod
@LazySingleton()
class GetAllCharges extends UsecaseWithoutParams<ChargesListModel> {
  const GetAllCharges(this._repo);

  final ISubscriptionRepository _repo;

  @override
  ResultFuture<ChargesListModel> call() async => await _repo.getAllCharges();
}
