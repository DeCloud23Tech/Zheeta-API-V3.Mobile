import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:zheeta/features/payment_and_subscriptions/data/models/generate_payment_link_model.dart';
import 'package:zheeta/features/payment_and_subscriptions/data/models/payment_types_model.dart';
import 'package:zheeta/features/payment_and_subscriptions/domain/usecases/get_payment_link_usecase.dart';
import 'package:zheeta/features/payment_and_subscriptions/domain/usecases/get_payment_types_usecase.dart';

part 'payment_state.dart';

@prod
@LazySingleton()
class PaymentCubit extends Cubit<PaymentState> {
  final GetAllPaymentTypes getAllPaymentTypes;
  final GetPaymentLink getPaymentLink;

  PaymentCubit({required this.getAllPaymentTypes, required this.getPaymentLink})
      : super(const PaymentState());

  // Fetch payment types
  Future<void> fetchPaymentTypes() async {
    emit(state.copyWith(paymentTypeStatus: PaymentTypeStatus.loading));
    final result = await getAllPaymentTypes();

    result.fold(
      (failure) {
        emit(state.copyWith(
          paymentTypeStatus: PaymentTypeStatus.failure,
          errorMessage: failure.message,
        ));
      },
      (paymentTypes) {
        emit(state.copyWith(
          paymentTypeStatus: PaymentTypeStatus.success,
          paymentTypes: paymentTypes,
        ));
      },
    );
  }

  // Generate payment link
  Future<void> generatePaymentLink(GetPaymentLinkParams request) async {
    emit(state.copyWith(paymentLinkStatus: PaymentLinkStatus.loading));
    final result = await getPaymentLink(request);

    result.fold(
      (failure) {
        emit(state.copyWith(
          paymentLinkStatus: PaymentLinkStatus.failure,
          errorMessage: failure.message,
        ));
      },
      (paymentLinkData) {
        emit(state.copyWith(
          paymentLinkStatus: PaymentLinkStatus.success,
          paymentLinkData: paymentLinkData,
        ));
      },
    );
  }
}
