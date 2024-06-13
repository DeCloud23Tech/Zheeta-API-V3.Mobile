import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:zheeta/app/common/color.dart';
import 'package:zheeta/app/router/app_router.dart';
import 'package:zheeta/widgets/primary_button.dart';
import 'package:zheeta/widgets/reusable_container.dart';

import '../../../widgets/text_row.dart';

@RoutePage()
class RedeemGiftDetailScreen extends StatelessWidget {
  final double totalAmount;
  const RedeemGiftDetailScreen({super.key, required this.totalAmount});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondaryLight,
      appBar: AppBar(
        backgroundColor: AppColors.secondaryLight,
        elevation: 0.0,
        leading: GestureDetector(
          onTap: () => router.pop(),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
                padding: EdgeInsets.all(5),
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(100)),
                child: Icon(Icons.arrow_back_ios_new, color: AppColors.grey)),
          ),
        ),
        title: Text(
          'Transaction Details',
          style: TextStyle(
              color: AppColors.grayscale,
              fontSize: 24,
              fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
          child: Column(
            children: [
              ReusableCustomContainer(
                child: Column(
                  children: [
                    TextRow(
                      leftText: 'Amount of money:',
                      rightText: 'N$totalAmount',
                    ),
                    TextRow(
                      leftText: 'Transaction fee:',
                      rightText: 'Free',
                    ),
                    TextRow(
                      leftText: 'Total:',
                      rightText: '\$$totalAmount',
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              PrimaryButton(title: 'Confirm', action: () {})
            ],
          ),
        ),
      ),
    );
  }
}
