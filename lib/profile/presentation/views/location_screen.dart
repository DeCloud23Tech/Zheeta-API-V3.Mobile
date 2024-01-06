import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:zheeta/app/common/color.dart';
import 'package:zheeta/app/router/app_router.dart';
import 'package:zheeta/app/router/app_router.gr.dart';
import 'package:zheeta/widgets/back_button.dart';
import 'package:zheeta/widgets/input_field.dart';
import 'package:zheeta/widgets/location_bottomsheet.dart';
import 'package:zheeta/widgets/primary_button.dart';

@RoutePage()
class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

enum sexSelectRadio { male, female, nspecified }

class _LocationScreenState extends State<LocationScreen> {
  final TextEditingController _address = TextEditingController();
  final TextEditingController _city = TextEditingController();
  final TextEditingController _postcode = TextEditingController();

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
        backgroundColor: AppColors.secondaryLight,
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
                      router.push(ProfilePhotoRoute());
                    },
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
