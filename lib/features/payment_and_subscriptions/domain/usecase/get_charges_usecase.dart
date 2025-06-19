import 'package:injectable/injectable.dart';
import 'package:zheeta/common/constants/type_def.dart';
import 'package:zheeta/common/usecase/usecases.dart';
import 'package:zheeta/features/payment_and_subscriptions/data/model/charges_model.dart';
import 'package:zheeta/features/payment_and_subscriptions/domain/repository/subscription_repository.dart';



@prod
@LazySingleton()
class GetAllCharges extends UsecaseWithoutParams<ChargesListModel> {
  const GetAllCharges(this._repo);

  final SubscriptionRepository _repo;

  @override
  ResultFuture<ChargesListModel> call() async => await _repo.getAllCharges();
}
