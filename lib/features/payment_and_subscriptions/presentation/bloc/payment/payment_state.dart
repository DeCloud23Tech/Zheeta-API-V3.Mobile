part of 'payment_cubit.dart';

// Enums for specific operations
enum PaymentTypeStatus { initial, loading, success, failure }
enum PaymentLinkStatus { initial, loading, success, failure }

class PaymentState extends Equatable {
  final PaymentTypeStatus paymentTypeStatus;
  final PaymentLinkStatus paymentLinkStatus;
  final List<PaymentType>? paymentTypes;
  final GeneratePaymentLinkData? paymentLinkData;
  final String? errorMessage;

  const PaymentState({
    this.paymentTypeStatus = PaymentTypeStatus.initial,
    this.paymentLinkStatus = PaymentLinkStatus.initial,
    this.paymentTypes,
    this.paymentLinkData,
    this.errorMessage,
  });

  PaymentState copyWith({
    PaymentTypeStatus? paymentTypeStatus,
    PaymentLinkStatus? paymentLinkStatus,
    List<PaymentType>? paymentTypes,
    GeneratePaymentLinkData? paymentLinkData,
    String? errorMessage,
  }) {
    return PaymentState(
      paymentTypeStatus: paymentTypeStatus ?? this.paymentTypeStatus,
      paymentLinkStatus: paymentLinkStatus ?? this.paymentLinkStatus,
      paymentTypes: paymentTypes ?? this.paymentTypes,
      paymentLinkData: paymentLinkData ?? this.paymentLinkData,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props =>
      [paymentTypeStatus, paymentLinkStatus, paymentTypes, paymentLinkData, errorMessage];
}
