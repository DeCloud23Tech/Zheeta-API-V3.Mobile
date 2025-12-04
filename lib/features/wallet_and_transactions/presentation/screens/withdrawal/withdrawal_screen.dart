import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zheeta/core/constants/color.dart';
import 'package:zheeta/core/mixin/validation_mixin.dart';
import 'package:zheeta/core/utils/extensions/double_extension.dart';
import 'package:zheeta/core/utils/extensions/string_extension.dart';
import 'package:zheeta/core/utils/notify.dart';
import 'package:zheeta/di/di.dart';
import 'package:zheeta/features/wallet_and_transactions/presentation/cubits/wallet_cubit/wallet_cubit.dart';
import 'package:zheeta/features/wallet_and_transactions/presentation/cubits/withdrawal_cubit/withdrawal_cubit.dart';
import 'package:zheeta/features/wallet_and_transactions/presentation/screens/withdrawal/withdrawal_success_screen.dart';
import 'package:zheeta/shared/widgets/back_button.dart';
import 'package:zheeta/shared/widgets/input_field.dart';
import 'package:zheeta/shared/widgets/primary_button.dart';
import 'package:zheeta/shared/widgets/reusable_container.dart';

@RoutePage()
class WithdrawalScreen extends StatefulWidget {
  final String account;
  final String accountNumber;

  const WithdrawalScreen({
    super.key,
    required this.account,
    required this.accountNumber,
  });

  @override
  State<WithdrawalScreen> createState() => _WithdrawalScreenState();
}

class _WithdrawalScreenState extends State<WithdrawalScreen> with Validator {
  WithdrawalCubit withdrawalCubit = locator<WithdrawalCubit>();
  WalletCubit walletCubit = locator<WalletCubit>();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondaryLight,
      appBar: AppBar(
        backgroundColor: AppColors.secondaryLight,
        elevation: 0.0,
        leading: AppBackButton(),
        title: Text(
          'Withdrawal',
          style: TextStyle(
            color: AppColors.grayscale,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: BlocListener<WithdrawalCubit, WithdrawalState>(
        listener: (context, state) {
          if (state is WithdrawalRateLoaded) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (_) => const WithdrawalSuccessScreen(),
              ),
            );
          } else if (state is WithdrawalFailure) {
            NotifyUser.showSnackBar(state.errorMessage ?? '');
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ListView(
            children: [
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    SizedBox(height: 30),
                    ReusableCustomContainer(
                      child: Padding(
                        padding: const EdgeInsets.all(14.0),
                        child: Row(mainAxisSize: MainAxisSize.min, children: [
                          Text(
                            'Available balance: ',
                            style: TextStyle(
                              fontSize: 14,
                              color: AppColors.black,
                            ),
                          ),
                          SvgPicture.asset(
                            "assets/images/icons/zheeta-coin.svg",
                            height: 8,
                          ),
                          Text(
                            walletCubit.state is WalletLoaded
                                ? ((walletCubit.state as WalletLoaded)
                                        .walletCounters
                                        .balance)
                                    .toFormattedCurrency()
                                : 'Loading...',
                            style: TextStyle(
                              fontSize: 14,
                              color: AppColors.black,
                            ),
                          ),
                        ]),
                      ),
                    ),
                    SizedBox(height: 30),
                    ReusableCustomContainer(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.wallet_outlined,
                                  size: 20,
                                  color: AppColors.primaryDark,
                                ),
                                const SizedBox(width: 6),
                                // Spacing between icon and text
                                Text(
                                  'Account: ${widget.accountNumber}',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: AppColors.black,
                                  ),
                                ),
                              ],
                            ),
                            Icon(
                              Icons.check_circle,
                              color: AppColors.primaryDark,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 30),
                    InputField(
                      controller: _amountController,
                      hintText: 'Amount',
                      keyboardType: TextInputType.number,
                      validator: (value) => isValidAmount(value ?? ''),
                    ),
                    InputField(
                      controller: _messageController,
                      hintText: 'Message (optional)',
                      minLine: 4,
                      maxLine: 4,
                      validator: validateMessage,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              PrimaryButton(
                title: 'Proceed',
                action: () {
                  if (_formKey.currentState!.validate()) {
                    withdrawalCubit.processPayoutCubit(
                      coinAmount: _amountController.text.toDouble,
                      payOutAccountId: widget.account,
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
