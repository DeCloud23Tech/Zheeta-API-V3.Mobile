import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zheeta/common/constants/color.dart';
import 'package:zheeta/common/notify/notify_user.dart';
import 'package:zheeta/core/injection/di.dart';
import 'package:zheeta/features/wallet_and_transactions/presentation/bloc/wallet/wallet_cubit.dart';
import 'package:zheeta/features/wallet_and_transactions/presentation/views/wallet-transfer/send_coin_success_screen.dart';
import 'package:zheeta/widgets/back_button.dart';
import 'package:zheeta/widgets/primary_button.dart';
import 'package:zheeta/widgets/reusable_container.dart';
import 'package:zheeta/widgets/text_row.dart';

@RoutePage()
class SendCoinDetailsScreen extends StatelessWidget {
  final String receiverId;
  final String receiverUsername;
  final double amount;
  final String message;

  const SendCoinDetailsScreen({
    super.key,
    required this.receiverId,
    required this.receiverUsername,
    required this.amount,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    WalletCubit walletCubit = locator<WalletCubit>();

    double transactionFee = 0.0; // Example 2% fee
    double totalAmount = amount + transactionFee;

    return Scaffold(
      backgroundColor: AppColors.secondaryLight,
      appBar: AppBar(
        backgroundColor: AppColors.secondaryLight,
        elevation: 0.0,
        leading: const AppBackButton(),
        title: const Text(
          'Transaction Details',
          style: TextStyle(
            color: AppColors.grayscale,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: BlocListener<WalletCubit, WalletState>(
        listener: (context, state) {
          if (state is WalletTransferSuccess) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (_) => const SendCoinSuccessScreen(),
              ),
            );
          } else if (state is WalletError) {
            NotifyUser.showSnackBar(state.message);
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              ReusableCustomContainer(
                child: Column(
                  children: [
                    TextRow(
                        leftText: 'Transfer to:', rightText: receiverUsername),
                    TextRow(leftText: 'User ID:', rightText: receiverId),
                    TextRow(leftText: 'Amount:', rightText: '$amount'),
                    TextRow(leftText: 'Transaction fee:', rightText: 'Free'),
                    TextRow(leftText: 'Total:', rightText: '$totalAmount'),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              BlocBuilder<WalletCubit, WalletState>(
                builder: (context, state) {
                  return PrimaryButton(
                    title: state is WalletTransferLoading
                        ? 'Processing...'
                        : 'Confirm',
                    action: state is WalletTransferLoading
                        ? null
                        : () {
                            walletCubit.transferFundsCubit(
                                receiverUsername: receiverUsername,
                                amount: amount,
                                message: message);
                          },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
