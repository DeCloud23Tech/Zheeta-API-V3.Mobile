import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:zheeta/app/common/color.dart';
import 'package:zheeta/app/router/app_router.dart';
import 'package:zheeta/widgets/primary_button.dart';

import '../../../widgets/reusable_container.dart';
import '../../../widgets/text_row.dart';


class GiftRequestSuccessScreen extends StatelessWidget {
  const GiftRequestSuccessScreen({super.key});

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
            )),
        title: Text(
          'Request Successful',
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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'You have successfully requested gift delivery',
                style: TextStyle(
                    color: AppColors.primaryDark,
                    fontSize: 28,
                    fontWeight: FontWeight.w600),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              ReusableCustomContainer(
                child: Column(
                  children: [
                    TextRow(
                      leftText: 'Address',
                      rightText: '1 shade long street, Lagos, Nigeria',
                    ),
                    TextRow(
                      leftText: 'City',
                      rightText: 'Ikeja',
                    ),
                    TextRow(
                      leftText: 'State',
                      rightText: 'Lagos',
                    ),
                    TextRow(
                      leftText: 'Postal code/Zip code',
                      rightText: '234456',
                    ),
                    TextRow(
                      leftText: 'Country',
                      rightText: 'Nigeria',
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              PrimaryButton(title: 'Go to Gift Store', action: () {})
            ],
          ),
        ),
      ),
    );
  }
}
