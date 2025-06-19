import 'package:injectable/injectable.dart';
import 'package:zheeta/common/constants/type_def.dart';
import 'package:zheeta/common/usecase/usecases.dart';
import 'package:zheeta/features/payment_and_subscriptions/data/model/payment_types_model.dart';
import 'package:zheeta/features/payment_and_subscriptions/domain/repository/payment_repository.dart';

@prod
@LazySingleton()
class GetAllPaymentTypes extends UsecaseWithoutParams<List<PaymentType>> {
  const GetAllPaymentTypes(this._repo);

  final PaymentRepository _repo;

  @override
  ResultFuture<List<PaymentType>> call() async => await _repo.getPaymentTypes();
}
