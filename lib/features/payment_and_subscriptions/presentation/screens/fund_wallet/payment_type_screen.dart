import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zheeta/core/constants/color.dart';
import 'package:zheeta/core/constants/lists.dart';
import 'package:zheeta/core/mixin/validation_mixin.dart';
import 'package:zheeta/core/utils/notify.dart';
import 'package:zheeta/core/utils/token_utils.dart';
import 'package:zheeta/di/di.dart';
import 'package:zheeta/features/payment_and_subscriptions/data/models/payment_types_model.dart';
import 'package:zheeta/features/payment_and_subscriptions/domain/usecases/get_payment_link_usecase.dart';
import 'package:zheeta/features/payment_and_subscriptions/presentation/cubits/payment_cubit/payment_cubit.dart';
import 'package:zheeta/router/app_router.gr.dart';
import 'package:zheeta/shared/widgets/back_button.dart';
import 'package:zheeta/shared/widgets/input_field.dart';
import 'package:zheeta/shared/widgets/loader.dart';
import 'package:zheeta/shared/widgets/primary_button.dart';

@RoutePage()
class PaymentTypeScreen extends StatefulWidget {
  const PaymentTypeScreen({super.key});

  @override
  State<PaymentTypeScreen> createState() => _PaymentTypeScreenState();
}

class _PaymentTypeScreenState extends State<PaymentTypeScreen> with Validator {
  final PaymentCubit paymentCubit = locator<PaymentCubit>();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _amountController = TextEditingController();

  String _selectedCurrency = AppLists.currencies.first;
  PaymentType? _selectedPaymentType;

  @override
  void initState() {
    super.initState();
    paymentCubit.resetPaymentLink();
    paymentCubit.fetchPaymentTypes(_selectedCurrency);
  }

  @override
  void dispose() {
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondaryLight,
      appBar: AppBar(
        backgroundColor: AppColors.secondaryLight,
        elevation: 0.0,
        leading: const AppBackButton(),
        title: const Text(
          'Add Funds',
          style: TextStyle(
            color: AppColors.grayscale,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: BlocConsumer<PaymentCubit, PaymentState>(
        listener: (context, state) {
          if (state.paymentLinkStatus == PaymentLinkStatus.success &&
              state.paymentLinkData != null) {
            context.router.push(
              PaymentLinkRoute(paymentLinkData: state.paymentLinkData),
            );
          } else if (state.paymentLinkStatus == PaymentLinkStatus.failure) {
            NotifyUser.showSnackBar(
              state.errorMessage ?? 'Failed to generate payment link',
            );
          } else if (state.paymentTypeStatus == PaymentTypeStatus.failure) {
            NotifyUser.showSnackBar(
              state.errorMessage ?? 'Failed to load payment options',
            );
          }
        },
        builder: (context, state) {
          if (state.paymentTypeStatus == PaymentTypeStatus.loading &&
              (state.paymentTypes == null || state.paymentTypes!.isEmpty)) {
            return loadingIndicator();
          }

          final paymentTypes = state.paymentTypes ?? [];

          return Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListView(
                children: [
                  DropdownInputField(
                    value: _selectedCurrency,
                    hintText: 'Select Currency',
                    items: AppLists.currencies,
                    onChanged: (value) {
                      if (value == null) return;
                      setState(() {
                        _selectedCurrency = value;
                        _selectedPaymentType = null;
                      });
                      paymentCubit.fetchPaymentTypes(value);
                    },
                    validator: (value) => isValidInput(value),
                  ),
                  if (paymentTypes.isNotEmpty)
                    DropdownInputField(
                      value: _selectedPaymentType?.name,
                      hintText: 'Select Payment Option',
                      items: paymentTypes.map((e) => e.name).toList(),
                      onChanged: (value) {
                        setState(() {
                          _selectedPaymentType = paymentTypes
                              .firstWhere((e) => e.name == value);
                        });
                      },
                      validator: (value) => isValidInput(value),
                    )
                  else
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(
                        'No payment options available for $_selectedCurrency',
                        style: TextStyle(color: AppColors.grayscale),
                      ),
                    ),
                  InputField(
                    controller: _amountController,
                    hintText: 'Amount',
                    keyboardType:
                        const TextInputType.numberWithOptions(decimal: true),
                    validator: (value) =>
                        isValidAmount(value ?? '', minLength: 1),
                  ),
                  const SizedBox(height: 20),
                  PrimaryButton(
                    title: state.paymentLinkStatus == PaymentLinkStatus.loading
                        ? 'Processing...'
                        : 'Proceed',
                    action: state.paymentLinkStatus == PaymentLinkStatus.loading
                        ? null
                        : () async {
                            if (!_formKey.currentState!.validate()) return;
                            if (_selectedPaymentType == null) {
                              NotifyUser.showSnackBar(
                                  'Please select a payment option');
                              return;
                            }
                            final amount =
                                double.tryParse(_amountController.text) ?? 0;
                            if (amount <= 0) {
                              NotifyUser.showSnackBar(
                                  'Please enter a valid amount');
                              return;
                            }

                            final userId = await TokenUtil.getUserId();
                            if (userId == null || userId.isEmpty) {
                              NotifyUser.showSnackBar(
                                  'User ID not found, please login again');
                              return;
                            }

                            paymentCubit.generatePaymentLink(
                              GetPaymentLinkParams(
                                userId: userId,
                                payInType: _selectedPaymentType!.id,
                                amount: amount,
                                currency: _selectedCurrency,
                              ),
                            );
                          },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
