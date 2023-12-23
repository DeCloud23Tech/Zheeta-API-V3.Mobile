import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:zheeta/app/color.dart';
import 'package:zheeta/app/router/app_router.dart';
import 'package:zheeta/app/router/app_router.gr.dart';
import 'package:zheeta/app/strings.dart';
import 'package:zheeta/widgets/primary_button.dart';

@RoutePage()
class AuthWelcomeScreen extends StatelessWidget {
  const AuthWelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryDark,
      body: Container(
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 60),
              Text(
                authWelcomeTitle,
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 28),
              ),
              SizedBox(height: 20),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.7,
                child: Text(
                  authWelcomeSubtitle,
                  textAlign: TextAlign.start,
                  style: TextStyle(fontSize: 15.0, color: Colors.white),
                ),
              ),
              SizedBox(height: 60),
              Image.asset('assets/images/welcome.png')
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(left: 20.0, right: 20.0, bottom: 50.0),
        child: PrimaryButton(
          invert: true,
          title: 'Proceed',
          action: () {
            router.push(ProfilePhotoRoute());
          },
        ),
      ),
    );
  }
}
