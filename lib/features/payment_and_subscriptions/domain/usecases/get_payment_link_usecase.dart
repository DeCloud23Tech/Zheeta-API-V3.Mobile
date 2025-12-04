import 'package:injectable/injectable.dart';
import 'package:zheeta/core/common/usecase/usecases.dart';
import 'package:zheeta/core/constants/type_def.dart';
import 'package:zheeta/features/payment_and_subscriptions/data/models/generate_payment_link_model.dart';
import 'package:zheeta/features/payment_and_subscriptions/domain/repositories/payment_repository.dart';

@prod
@LazySingleton()
class GetPaymentLink
    extends UsecaseWithParams<GeneratePaymentLinkData, GetPaymentLinkParams> {
  const GetPaymentLink(this._repo);

  final IPaymentRepository _repo;

  @override
  ResultFuture<GeneratePaymentLinkData> call(
          GetPaymentLinkParams params) async =>
      await _repo.generatePaymentLink(
        userId: params.userId,
        payInType: params.payInType,
        amount: params.amount,
        currency: params.currency,
      );
}

class GetPaymentLinkParams {
  final String userId;
  final int payInType;
  final double amount;
  final String currency;

  GetPaymentLinkParams({
    required this.userId,
    required this.payInType,
    required this.amount,
    required this.currency,
  });
}
