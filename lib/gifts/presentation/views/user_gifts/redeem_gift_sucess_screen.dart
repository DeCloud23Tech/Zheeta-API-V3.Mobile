import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:zheeta/app/common/color.dart';
import 'package:zheeta/app/router/app_router.gr.dart';
import 'package:zheeta/widgets/primary_button.dart';
import 'package:zheeta/widgets/reusable_container.dart';
import 'package:zheeta/widgets/text_row.dart';

class RedeemGiftSuccessScreen extends StatefulWidget {
  const RedeemGiftSuccessScreen({super.key});

  @override
  _RedeemGiftSuccessScreenState createState() =>
      _RedeemGiftSuccessScreenState();
}

class _RedeemGiftSuccessScreenState extends State<RedeemGiftSuccessScreen>
    with SingleTickerProviderStateMixin {
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
      appBar: AppBar(
        backgroundColor: AppColors.secondaryLight,
        automaticallyImplyLeading: false, // This prevents showing the back button
        elevation: 0.0,
        title: Text(
          'Transaction Successful',
          style: TextStyle(
              color: AppColors.grayscale,
              fontSize: 24,
              fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      body: WillPopScope(
        onWillPop: () async {
          // Return false to prevent back navigation
          return false;
        },
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ScaleTransition(
                  scale: _animation,
                  child: Image.asset('assets/images/redeem-success.png'),
                ),
                SizedBox(height: 25),
                Text(
                  'You have successfully redeemed your gift',
                  style: TextStyle(
                      color: AppColors.primaryDark,
                      fontSize: 28,
                      fontWeight: FontWeight.w600),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                // ReusableCustomContainer(
                //   child: Column(
                //     children: [
                //       TextRow(
                //         leftText: 'Balance in the wallet:',
                //         rightText: '',
                //       ),
                //       TextRow(
                //         leftText: 'Transaction ID:',
                //         rightText: '',
                //       ),
                //     ],
                //   ),
                // ),
                SizedBox(height: 20),
                PrimaryButton(
                  title: 'Go to My Gifts',
                  action: () {
                    context.router.popUntil(
                            (route) => route.settings.name == HomeRoute.name);
                    context.router.push(const MyGiftRoute());
                  },
                ),
                SizedBox(height: 20),
                PrimaryButton(
                  title: 'Go to Gift Store',
                  action: () {
                    context.router.popUntil(
                        (route) => route.settings.name == HomeRoute.name);
                    context.router.push(const GiftShopRoute());
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
