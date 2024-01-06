import 'package:flutter/material.dart';
import 'package:zheeta/app/common/color.dart';
import 'package:zheeta/app/router/app_router.dart';
import 'package:zheeta/app/router/app_router.gr.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onTap: () => Navigator.pop(context),
      onTap: () {
        router.push(SignInRoute());
      },
      child: Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(color: AppColors.white, borderRadius: BorderRadius.circular(100)),
        child: Center(
            child: Padding(
          padding: const EdgeInsets.only(left: 6.0),
          child: Icon(Icons.arrow_back_ios, size: 18, color: AppColors.grey.withOpacity(0.4)),
        )),
      ),
    );
  }
}
