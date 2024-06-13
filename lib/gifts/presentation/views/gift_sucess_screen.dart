import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:zheeta/app/common/color.dart';
import 'package:zheeta/app/router/app_router.dart';
import 'package:zheeta/app/router/app_router.gr.dart';
import 'package:zheeta/widgets/primary_button.dart';

@RoutePage()
class GiftSuccessScreen extends StatelessWidget {
  const GiftSuccessScreen({super.key});

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
              Spacer(),
              Text(
                'Successful',
                style: TextStyle(
                    color: AppColors.primaryDark,
                    fontSize: 32,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 20),
              Text(
                'Gift has been sent successfully',
                style: TextStyle(
                    color: AppColors.grayscale,
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 25),
              Image.asset('assets/images/gift-success.png'),
              Spacer(
                flex: 2,
              ),
              PrimaryButton(
                title: 'Go to Gift Store',
                action: () {
                  router.popUntil((route) => route.settings.name == HomeRoute.name);
                  router.push(GiftShopRoute());
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
