import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:zheeta/app/common/color.dart';
import 'package:zheeta/app/common/strings.dart';
import 'package:zheeta/app/router/app_router.dart';
import 'package:zheeta/app/router/app_router.gr.dart';
import 'package:zheeta/widgets/primary_button.dart';

@RoutePage()
class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryDark,
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        welcomeTitle,
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 32.0),
                      ),
                      Padding(padding: EdgeInsets.only(top: 20)),
                      Text(
                        welcomeSubtitle,
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            // fontWeight: FontWeight.bold,
                            fontSize: 15.0,
                            color: Colors.white),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 40),
                Image.asset("assets/images/welcome.png"),
                const SizedBox(height: 40),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: SizedBox(
              width: double.infinity,
              child: PrimaryButton(
                title: 'Proceed',
                action: () {
                  router.replace(const HomeRoute());

                  // router.pushAndPopUntil(const SignInRoute(),
                  //     predicate: (route) => false);
                },
                invert: true,
              ),
            ),
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }
}
