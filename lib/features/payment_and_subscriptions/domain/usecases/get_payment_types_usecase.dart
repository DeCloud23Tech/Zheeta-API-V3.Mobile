import 'package:injectable/injectable.dart';
import 'package:zheeta/core/common/usecase/usecases.dart';
import 'package:zheeta/core/constants/type_def.dart';
import 'package:zheeta/features/payment_and_subscriptions/data/models/payment_types_model.dart';
import 'package:zheeta/features/payment_and_subscriptions/domain/repositories/payment_repository.dart';

@prod
@LazySingleton()
class GetAllPaymentTypes extends UsecaseWithParams<List<PaymentType>, String> {
  const GetAllPaymentTypes(this._repo);

  final IPaymentRepository _repo;

  @override
  ResultFuture<List<PaymentType>> call(String currency) async =>
      await _repo.getPaymentTypes(currency);
}
