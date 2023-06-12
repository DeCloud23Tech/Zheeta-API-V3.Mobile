import 'package:flutter/material.dart';
import 'package:otp/otp.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TwoFAEnterCode extends StatefulWidget {
  const TwoFAEnterCode({Key? key}) : super(key: key);

  @override
  State<TwoFAEnterCode> createState() => _TwoFAEnterCodeState();
}

class _TwoFAEnterCodeState extends State<TwoFAEnterCode> {
  final TextEditingController inputController = TextEditingController();
  String secKey = '';
  bool isActive = false;

  check2FA() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    setState(() {
      isActive = localStorage.getBool('activate2FA')!;
    });
  }

  getKey() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    secKey = localStorage.getString('secKey')!;
  }

  validateCode() {
    final code = inputController.text;
    final generatedCode = OTP.generateTOTPCodeString(
        secKey, DateTime.now().millisecondsSinceEpoch,
        algorithm: Algorithm.SHA1, isGoogle: true);
    if (code == generatedCode) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Code verified'),
      ));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Code verification failed'),
      ));
    }
  }

  @override
  void initState() {
    super.initState();
    check2FA();
    getKey();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: isActive
            ? ElevatedButton(
                onPressed: () {},
                child: const Text('Enable 2FA'),
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        hintText: 'Enter your 2FA code OR recovery phrase',
                      ),
                      controller: inputController,
                    ),
                  ),
                  const Divider(),
                  Row(mainAxisSize: MainAxisSize.min, children: [
                    ElevatedButton(
                      onPressed: () => validateCode(),
                      child: const Text('Verify 2FA'),
                    ),
                  ]),
                ],
              ));
  }
}
