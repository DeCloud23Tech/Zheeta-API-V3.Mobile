import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:zheeta/constants/color.dart';
import 'package:zheeta/screens/authentication/pages/welcome.dart';
import 'package:zheeta/screens/widgets/primary_button.dart';

Future<dynamic> locationBottomSheet(BuildContext context) {
  return showModalBottomSheet(
    context: context,
    backgroundColor: Colors.transparent,
    builder: (context) => Container(
      padding: EdgeInsets.all(20),
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15), topRight: Radius.circular(15))),
      child: SingleChildScrollView(
        child: Column(children: [
          SizedBox(height: 20),
          Icon(Icons.location_pin, color: primaryDark, size: 32.0),
          SizedBox(height: 10),
          Text("Location Services",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: primaryDark)),
          SizedBox(height: 15),
          Text('We need to know where you’re in order\nto find nearby friends',
              style: TextStyle(
                  color: grayscale,
                  fontSize: 14,
                  fontWeight: FontWeight.normal),
              textAlign: TextAlign.center),
          SizedBox(height: 32),
          SizedBox(
              width: double.infinity,
              child: PrimaryButton(
                  title: 'Enable location services',
                  action: () {
                    Navigator.push(
                        context,
                        PageTransition(
                            type: PageTransitionType.rightToLeft,
                            child: AuthWelcome()));
                  })),
          SizedBox(height: 20),
          SizedBox(
              width: double.infinity,
              child: PrimaryButton(
                  invert: true,
                  color: secondaryLight,
                  title: 'Skip',
                  action: () {
                    Navigator.pop(context);
                  })),
          SizedBox(height: 20),
        ]),
      ),
    ),
  );
}
