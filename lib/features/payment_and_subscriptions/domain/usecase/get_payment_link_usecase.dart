import 'package:injectable/injectable.dart';
import 'package:zheeta/common/constants/type_def.dart';
import 'package:zheeta/common/usecase/usecases.dart';
import 'package:zheeta/features/payment_and_subscriptions/data/model/generate_payment_link_model.dart';
import 'package:zheeta/features/payment_and_subscriptions/domain/repository/payment_repository.dart';

@prod
@LazySingleton()
class GetPaymentLink
    extends UsecaseWithParams<GeneratePaymentLinkData, GetPaymentLinkParams> {
  const GetPaymentLink(this._repo);

  final PaymentRepository _repo;

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
