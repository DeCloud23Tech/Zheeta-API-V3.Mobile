import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:zheeta/app/common/color.dart';
import 'package:zheeta/app/router/app_router.dart';
import 'package:zheeta/widgets/primary_button.dart';

import '../../../widgets/input_field.dart';

class GiftDeliveryScreen extends StatelessWidget {
  const GiftDeliveryScreen({super.key});

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
          'Delivery Address',
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
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              InputField(
                hintText: 'Address',
                onChanged: (value) {},
              ),
              InputField(
                hintText: 'City',
                onChanged: (value) {},
              ),
              InputField(
                hintText: 'State/Province',
                onChanged: (value) {},
              ),
              InputField(
                hintText: 'Postal code/Zip code',
                onChanged: (value) {},
              ),
              DropdownInputField(
                items: ['option 1', 'option 2', 'option 3'],
                hintText: 'Select Country',
                onChanged: (value) {
                  print(value);
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please select country';
                  }
                  return null;
                },
              ),
              SizedBox(height: 50),
              PrimaryButton(title: 'Confirm', action: () {})
            ],
          ),
        ),
      ),
    );
  }
}
