import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:otp/otp.dart';
import 'package:bip39/bip39.dart' as bip39;
import 'package:qr_flutter/qr_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TwoFAGenerateCode extends StatefulWidget {
  final String appName;
  final String email;
  const TwoFAGenerateCode(
      {Key? key, required this.appName, required this.email})
      : super(key: key);

  @override
  State<TwoFAGenerateCode> createState() => _TwoFAGenerateCodeState();
}

class _TwoFAGenerateCodeState extends State<TwoFAGenerateCode> {
  String secKey = '';
  String recoveryPhrase = '';

  generateCode() {
    recoveryPhrase = bip39.generateMnemonic();
    secKey = OTP.randomSecret();
    setState(() {});
  }

  activate2FA() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    localStorage.setString('secKey', secKey);
    localStorage.setBool('activate2FA', true);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: secKey.isEmpty
            ? ElevatedButton(
                onPressed: () => generateCode(),
                child: const Text('Enable 2FA'),
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  QrImage(
                    data:
                        'otpauth://totp/${widget.appName}:${widget.email}?secret=$secKey&issuer=${widget.appName}&algorithm=SHA1',
                    version: QrVersions.auto,
                    size: 260,
                  ),
                  const SizedBox(height: 20),
                  const Divider(),
                  Text(
                    'Secret Key',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SelectableText(secKey),
                      const SizedBox(width: 10),
                      GestureDetector(
                        onTap: () {
                          Clipboard.setData(ClipboardData(text: secKey));
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('copied secret key!')),
                          );
                        },
                        child: const Icon(Icons.copy),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  Text(
                    'Recovery Phrase',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                          width: MediaQuery.of(context).size.width * 0.8,
                          child: SelectableText(recoveryPhrase)),
                      GestureDetector(
                        onTap: () {
                          Clipboard.setData(
                              ClipboardData(text: recoveryPhrase));
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('copied recovery phrase!')),
                          );
                        },
                        child: const Icon(Icons.copy),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        activate2FA();
                      });
                    },
                    child: const Text('Activate 2FA'),
                  )
                ],
              ));
  }
}
