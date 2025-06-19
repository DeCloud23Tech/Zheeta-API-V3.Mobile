import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zheeta/common/constants/color.dart';
import 'package:zheeta/common/mixins/validation_helper.dart';
import 'package:zheeta/core/injection/di.dart';
import 'package:zheeta/features/payment_and_subscriptions/domain/usecase/payout_usecase.dart';
import 'package:zheeta/features/payment_and_subscriptions/presentation/bloc/payout/payout_cubit.dart';
import 'package:zheeta/widgets/back_button.dart';
import 'package:zheeta/widgets/input_field.dart';
import 'package:zheeta/widgets/loader.dart';
import 'package:zheeta/widgets/primary_button.dart';

@RoutePage()
class PayoutCreateAccount extends StatefulWidget {
  const PayoutCreateAccount({super.key});

  @override
  State<PayoutCreateAccount> createState() => _PayoutCreateAccountState();
}

class _PayoutCreateAccountState extends State<PayoutCreateAccount>
    with ValidationHelperMixin {
  final PayoutCubit payoutCubit = locator<PayoutCubit>();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // Store controllers for dynamic fields
  final Map<String, TextEditingController> _fieldControllers = {};

  String? selectedCountry;
  String? selectedCurrency;
  String? selectedPaymentOption;
  List<String> paymentOptions = [];
  List<String> mandatoryFields = [];

  @override
  void initState() {
    payoutCubit.fetchPayoutCountries();
    super.initState();
  }

  @override
  void dispose() {
    // Dispose all controllers when widget is disposed
    for (var controller in _fieldControllers.values) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondaryLight,
      appBar: AppBar(
        backgroundColor: AppColors.secondaryLight,
        elevation: 0.0,
        leading: AppBackButton(),
        title: Text(
          'New Payout Account',
          style: TextStyle(
            color: AppColors.grayscale,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: BlocConsumer<PayoutCubit, PayoutState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is PayoutCountriesLoaded) {
            return Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: ListView(
                  children: [
                    // Country Dropdown
                    DropdownInputField(
                      value: selectedCountry,
                      hintText: 'Select Country',
                      items: state.countries
                          .map((e) => e.countryName ?? 'Unknown')
                          .toList(),
                      onChanged: (value) {
                        setState(() {
                          selectedCountry = value;
                          selectedCurrency = null;
                          paymentOptions = [];
                          selectedPaymentOption = null;
                          mandatoryFields = [];

                          // Clear existing controllers when country changes
                          _fieldControllers.clear();

                          if (value != null) {
                            final countryData = state.countries
                                .firstWhere((e) => e.countryName == value);
                            selectedCurrency = countryData.countryCurrency;
                            paymentOptions = countryData.paymentOptions
                                .map((opt) => opt.payment)
                                .toList();
                          }
                        });
                      },
                      validator: (value) => isValidInput(value),
                    ),
                    // Currency Display
                    if (selectedCurrency != null) ...[
                      InputField(
                        hintText: selectedCurrency,
                        readonly: true,
                      ),
                    ],
                    // Payment Option Dropdown
                    if (paymentOptions.isNotEmpty)
                      DropdownInputField(
                        value: selectedPaymentOption,
                        hintText: 'Select Payment Option',
                        items: paymentOptions,
                        onChanged: (value) {
                          setState(() {
                            selectedPaymentOption = value;
                            if (value != null && selectedCountry != null) {
                              final countryData = state.countries.firstWhere(
                                  (e) => e.countryName == selectedCountry);
                              final paymentData = countryData.paymentOptions
                                  .firstWhere((opt) => opt.payment == value);
                              mandatoryFields = paymentData.mandatory;

                              // Initialize controllers for new mandatory fields
                              for (var field in mandatoryFields) {
                                if (!_fieldControllers.containsKey(field)) {
                                  _fieldControllers[field] =
                                      TextEditingController();
                                }
                              }
                            }
                          });
                        },
                        validator: (value) => isValidInput(value),
                      ),
                    const SizedBox(height: 24),
                    // Dynamic Mandatory Fields
                    ...mandatoryFields.map((field) => InputField(
                          key: ValueKey(field), // Important for rebuilding
                          controller: _fieldControllers[field],
                          hintText: field,
                          validator: (value) => isValidInput(value),
                        )),
                    const SizedBox(height: 24),
                    // Submit Button
                    PrimaryButton(
                      title: 'Save and proceed',
                      action: () {
                        if (_formKey.currentState!.validate()) {
                          // Ensure a payment option is selected
                          if (selectedPaymentOption == null) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content:
                                      Text("Please select a payment option.")),
                            );
                            return;
                          }

                          // Collect all field values
                          final collectedValues = <String, String>{};
                          for (var field in mandatoryFields) {
                            collectedValues[field] =
                                _fieldControllers[field]?.text.trim() ?? '';
                          }

                          print(selectedPaymentOption);
                          print(selectedCountry);
                          // Determine which method to call based on payment option
                          switch (selectedPaymentOption) {
                            case "Bank-Account":
                              print(collectedValues["Bank Account Number"]);
                              print(collectedValues["FirstName"]);
                              print(collectedValues["LastName"]);
                              // payoutCubit.addBankAccountMethod(
                              //   AddBankAccountParams(
                              //     currency: selectedCurrency!,
                              //     accountNumber: collectedValues["Bank Account Number"] ?? '',
                              //     bankName: collectedValues["Bank Name"] ?? '',
                              //     swiftCode: collectedValues["Swift Code"] ?? '',
                              //     routingNumber: collectedValues["Routing Number"] ?? '',
                              //     bankCode: collectedValues["Bank Code"] ?? '',
                              //     userId: 'userId_placeholder',
                              //     firstName: collectedValues["FirstName"] ?? '',
                              //     lastName: collectedValues["LastName"] ?? '',
                              //     countryIso2Code: _getCountryCode(state.countries),
                              //     bankId: collectedValues["Bank Code"] ?? '',
                              //     branchCode: collectedValues["Destination Branch Code"] ?? '',
                              //   ),
                              // );
                              break;
                            case "Mobile-Money":
                              payoutCubit.addMobileMoneyAccountMethod(
                                AddMobileMoneyAccountParams(
                                  currency: selectedCurrency!,
                                  userId: 'userId_placeholder',
                                  firstName: collectedValues["FirstName"] ?? '',
                                  lastName: collectedValues["LastName"] ?? '',
                                  countryIso2Code:
                                      _getCountryCode(state.countries),
                                  mobileMoneyProvider: collectedValues[
                                          "Mobile Money Provider"] ??
                                      '',
                                  mobileMoneyAccount:
                                      collectedValues["Mobile Money Number"] ??
                                          '',
                                ),
                              );
                              break;
                            case "Paypal":
                              payoutCubit.addPaypalAccountMethod(
                                AddPaypalAccountParams(
                                  currency: selectedCurrency!,
                                  userId: 'userId_placeholder',
                                  firstName: collectedValues["FirstName"] ?? '',
                                  lastName: collectedValues["LastName"] ?? '',
                                  countryIso2Code:
                                      _getCountryCode(state.countries),
                                  paypalAddress:
                                      collectedValues["Email Address"] ?? '',
                                ),
                              );
                              break;
                            default:
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text(
                                        "Invalid payment option selected.")),
                              );
                          }
                        }
                      },
                    ),
                  ],
                ),
              ),
            );
          }
          return loadingIndicator();
        },
      ),
    );
  }

  // Helper method to get country code
  String _getCountryCode(List<dynamic> countries) {
    if (selectedCountry == null) return '';
    final country = countries.firstWhere(
      (e) => e.countryName == selectedCountry,
      orElse: () => {'countryCode': ''},
    );
    return country['countryCode'] ?? '';
  }
}
