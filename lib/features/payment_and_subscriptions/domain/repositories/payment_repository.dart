import 'package:zheeta/core/constants/type_def.dart';
import 'package:zheeta/features/payment_and_subscriptions/data/models/generate_payment_link_model.dart';
import 'package:zheeta/features/payment_and_subscriptions/data/models/payment_types_model.dart';

abstract class IPaymentRepository {
  ResultFuture<List<PaymentType>> getPaymentTypes(String currency);

  ResultFuture<GeneratePaymentLinkData> generatePaymentLink({
    required String userId,
    required int payInType,
    required double amount,
    required String currency,
  });
}
