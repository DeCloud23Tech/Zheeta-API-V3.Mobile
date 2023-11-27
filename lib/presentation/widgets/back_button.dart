import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:zheeta/core/constants/color.dart';
import 'package:zheeta/presentation/authentication/pages/signin.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onTap: () => Navigator.pop(context),
      onTap: () {
        Navigator.push(context,
            PageTransition(type: PageTransitionType.fade, child: SignIn()));
      },
      child: Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
            color: white, borderRadius: BorderRadius.circular(100)),
        child: Center(
            child: Padding(
          padding: const EdgeInsets.only(left: 6.0),
          child: Icon(Icons.arrow_back_ios,
              size: 18, color: grey.withOpacity(0.4)),
        )),
      ),
    );
  }
}
