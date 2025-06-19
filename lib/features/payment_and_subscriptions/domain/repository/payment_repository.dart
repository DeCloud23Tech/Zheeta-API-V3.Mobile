import 'package:zheeta/common/constants/type_def.dart';
import 'package:zheeta/features/payment_and_subscriptions/data/model/generate_payment_link_model.dart';
import 'package:zheeta/features/payment_and_subscriptions/data/model/payment_types_model.dart';

abstract class PaymentRepository {

  ResultFuture<List<PaymentType>> getPaymentTypes();

  ResultFuture<GeneratePaymentLinkData> generatePaymentLink({
    required String userId,
    required int payInType,
    required double amount,
    required String currency,
  });
}
