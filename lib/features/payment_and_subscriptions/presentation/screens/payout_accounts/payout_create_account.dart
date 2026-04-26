import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zheeta/core/constants/color.dart';
import 'package:zheeta/core/mixin/validation_mixin.dart';
import 'package:zheeta/core/utils/notify.dart';
import 'package:zheeta/di/di.dart';
import 'package:zheeta/features/payment_and_subscriptions/data/models/payment_banks_model.dart';
import 'package:zheeta/features/payment_and_subscriptions/data/models/payment_countries_model.dart';
import 'package:zheeta/features/payment_and_subscriptions/domain/usecases/payout_usecase.dart';
import 'package:zheeta/features/payment_and_subscriptions/presentation/cubits/payout_cubit/payout_cubit.dart';
import 'package:zheeta/router/app_router.gr.dart';
import 'package:zheeta/shared/widgets/back_button.dart';
import 'package:zheeta/shared/widgets/input_field.dart';
import 'package:zheeta/shared/widgets/loader.dart';
import 'package:zheeta/shared/widgets/primary_button.dart';

@RoutePage()
class PayoutCreateAccount extends StatefulWidget {
  const PayoutCreateAccount({super.key});

  @override
  State<PayoutCreateAccount> createState() => _PayoutCreateAccountState();
}

class _PayoutCreateAccountState extends State<PayoutCreateAccount>
    with Validator {
  final PayoutCubit payoutCubit = locator<PayoutCubit>();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _accountNumberController =
      TextEditingController();

  String? selectedCountry;
  String? selectedCurrency;
  String? selectedPaymentOption;
  BankProvider? selectedProvider;

  @override
  void initState() {
    payoutCubit.fetchPayoutCountries();
    super.initState();
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _accountNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondaryLight,
      appBar: AppBar(
        backgroundColor: AppColors.secondaryLight,
        elevation: 0.0,
        leading: AppBackButton(
          onTap: () {
            payoutCubit.fetchAllAccounts();
            if (Navigator.of(context).canPop()) {
              Navigator.of(context).pop();
            }
          },
        ),
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
        listener: (context, state) {
          if (state is PayoutSuccess) {
            NotifyUser.showSnackBar(state.message);
            context.router.pushAndPopUntil(
              const WalletRoute(),
              predicate: (route) => false,
            );
          } else if (state is PayoutError) {
            NotifyUser.showSnackBar(state.message);
          }
        },
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
                      items: state.countries.map((e) => e.name).toList(),
                      onChanged: (value) {
                        setState(() {
                          selectedCountry = value;
                          selectedCurrency = null;
                          selectedPaymentOption = null;
                          selectedProvider = null;

                          if (value != null) {
                            final countryData = state.countries
                                .firstWhere((e) => e.name == value);
                            selectedCurrency = countryData.currency;
                            payoutCubit
                                .fetchPayoutMethods(countryData.currency);
                            payoutCubit.fetchBanks(countryData.currency);
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
                    if (state.payoutMethods.isNotEmpty)
                      DropdownInputField(
                        value: selectedPaymentOption,
                        hintText: 'Select Payment Option',
                        items: state.payoutMethods,
                        onChanged: (value) {
                          setState(() {
                            selectedPaymentOption = value;
                          });
                        },
                        validator: (value) => isValidInput(value),
                      ),
                    if (state.banks.isNotEmpty)
                      DropdownInputField(
                        value: selectedProvider?.name,
                        hintText: selectedPaymentOption == 'Mobile-Money'
                            ? 'Select Provider'
                            : 'Select Bank',
                        items: state.banks.map((e) => e.name).toList(),
                        onChanged: (value) {
                          setState(() {
                            selectedProvider = state.banks
                                .firstWhere((e) => e.name == value);
                          });
                        },
                        validator: (value) => isValidInput(value),
                      ),
                    const SizedBox(height: 24),
                    InputField(
                      controller: _firstNameController,
                      hintText: 'First Name',
                      validator: (value) => isValidInput(value),
                    ),
                    InputField(
                      controller: _lastNameController,
                      hintText: 'Last Name',
                      validator: (value) => isValidInput(value),
                    ),
                    InputField(
                      controller: _accountNumberController,
                      hintText: selectedPaymentOption == 'Mobile-Money'
                          ? 'Mobile Money Number'
                          : 'Account Number',
                      validator: (value) => isValidInput(value),
                    ),
                    const SizedBox(height: 24),
                    // Submit Button
                    PrimaryButton(
                      title: 'Save and proceed',
                      action: () {
                        if (_formKey.currentState!.validate()) {
                          // Ensure a payment option is selected
                          if (state.payoutMethods.isNotEmpty &&
                              selectedPaymentOption == null) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content:
                                      Text("Please select a payment option.")),
                            );
                            return;
                          }
                          if (state.payoutMethods.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text(
                                      "No payment options available for the selected country.")),
                            );
                            return;
                          }
                          if (selectedProvider == null) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text("Please select a provider.")),
                            );
                            return;
                          }

                          final type = _getPayoutType(selectedPaymentOption);
                          if (type == null) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text(
                                      "Invalid payment option selected.")),
                            );
                            return;
                          }

                          payoutCubit.createPayoutAccountMethod(
                            CreatePayoutAccountParams(
                              firstName: _firstNameController.text.trim(),
                              lastName: _lastNameController.text.trim(),
                              countryCode: _getCountryCode(state.countries),
                              currency: selectedCurrency!,
                              providerCode: selectedProvider!.code,
                              providerName: selectedProvider!.name,
                              providerAccountNumber:
                                  _accountNumberController.text.trim(),
                              type: type,
                            ),
                          );
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
  String _getCountryCode(List<CountryData> countries) {
    if (selectedCountry == null) return '';
    final country = countries.firstWhere(
      (e) => e.name == selectedCountry,
      orElse: () => const CountryData(
        code: '',
        code2Iso: '',
        name: '',
        phoneCode: null,
        currency: '',
      ),
    );
    return country.code;
  }

  int? _getPayoutType(String? option) {
    if (option == null) return null;
    switch (option) {
      case 'Bank-Transfer':
        return 1;
      case 'Mobile-Money':
        return 2;
      default:
        return null;
    }
  }
}
