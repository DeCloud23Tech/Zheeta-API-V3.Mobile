import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:zheeta/common/constants/color.dart';
import 'package:zheeta/core/injection/di.dart';
import 'package:zheeta/features/wallet_and_transactions/presentation/bloc/wallet/wallet_cubit.dart';
import 'package:zheeta/widgets/primary_button.dart';

class SendCoinSuccessScreen extends StatefulWidget {
  const SendCoinSuccessScreen({super.key});

  @override
  SendCoinSuccessScreenState createState() => SendCoinSuccessScreenState();
}

class SendCoinSuccessScreenState extends State<SendCoinSuccessScreen>
    with SingleTickerProviderStateMixin {
  WalletCubit walletCubit = locator<WalletCubit>();
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.elasticOut,
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondaryLight,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Spacer(),
              const Text(
                'Transaction Successful',
                style: TextStyle(
                  color: AppColors.primaryDark,
                  fontSize: 32,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Coins have been sent successfully',
                style: TextStyle(
                  color: AppColors.grayscale,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 25),
              ScaleTransition(
                scale: _animation,
                child: Image.asset('assets/images/success.png'),
              ),
              const Spacer(flex: 2),
              PrimaryButton(
                title: 'Go to Wallet',
                action: () {
                  context.router.popUntil((route) => route.settings.name == 'WalletRoute');
                  walletCubit.fetchWalletCounters();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
