import 'package:flutter/material.dart';
import 'package:zheeta/core/constants/color.dart';
import 'package:zheeta/core/constants/strings.dart';
import 'package:zheeta/presentation/widgets/primary_button.dart';



class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: primaryDark,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
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
            Container(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: SizedBox(
                    width: double.infinity,
                    child: PrimaryButton(
                      title: 'Proceed',
                      action: () {},
                      invert: true,
                    )))
          ],
        ));
  }
}
