import 'dart:async';

import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:zheeta/constants/color.dart';
import 'package:zheeta/screens/authentication/pages/welcome.dart';
import 'package:zheeta/screens/widgets/back_button.dart';
import 'package:zheeta/screens/widgets/input_field.dart';
import 'package:zheeta/screens/widgets/location_bottomsheet.dart';
import 'package:zheeta/screens/widgets/primary_button.dart';

class Location extends StatefulWidget {
  const Location({super.key});

  @override
  State<Location> createState() => _LocationState();
}

enum sexSelectRadio { male, female, nspecified }

class _LocationState extends State<Location> {
  final TextEditingController _address = TextEditingController();
  final TextEditingController _city = TextEditingController();
  final TextEditingController _postcode = TextEditingController();
  final TextEditingController _country = TextEditingController();
  final TextEditingController _state = TextEditingController();

  var sexSelect; //for radio selections
  var sex;

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 0), () {
      locationBottomSheet(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: secondaryLight,
        body: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: 60),
                CustomBackButton(),
                SizedBox(height: 40),
                InputField(controller: _address, label: 'Enter Address'),
                InputField(controller: _city, label: 'City'),
                InputField(controller: _postcode, label: 'Zip/Postcode'),
                SizedBox(height: 32),
                SizedBox(
                    width: double.infinity,
                    child: PrimaryButton(
                        title: 'Continue',
                        action: () {
                          Navigator.push(
                              context,
                              PageTransition(
                                  type: PageTransitionType.rightToLeft,
                                  child: AuthWelcome()));
                        }))
              ],
            ),
          ),
        ));
  }
}
