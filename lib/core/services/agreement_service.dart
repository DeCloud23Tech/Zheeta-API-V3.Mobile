import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:zheeta/core/constants/color.dart';
import 'package:zheeta/core/storage/storage/i_storage.dart';

class AgreementService {
  static const String _agreementShownKey =
      'agreement_shown_for_current_session';

  final IStorage _storage;

  AgreementService(this._storage);

  /// Checks if the agreement dialog needs to be shown and displays it if necessary.
  Future<void> checkAndShowAgreementDialog(BuildContext context) async {
    final bool agreementShownForSession =
        await _storage.getBool(_agreementShownKey) ?? false;

    if (!agreementShownForSession) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _showAgreementDialog(context);
      });
    }
  }

  /// Displays the agreement dialog to the user.
  Future<void> _showAgreementDialog(BuildContext context) async {
    bool eulaAgreed = false;
    bool privacyPolicyAgreed = false;
    bool disclaimerAgreed = false;
    String? errorMessage; // State variable for the error message

    await showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext dialogContext) {
        return StatefulBuilder(
          builder: (BuildContext innerContext, StateSetter setState) {
            return AlertDialog(
              backgroundColor: AppColors.white,
              contentPadding: const EdgeInsets.all(20),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              title: const Text(
                'Welcome to Zheeta',
                style: TextStyle(
                    color: AppColors.black, fontWeight: FontWeight.bold),
              ),
              content: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    const Text(
                      'Please review and accept our terms to continue using Zheeta.',
                      style: TextStyle(color: AppColors.black),
                    ),
                    const SizedBox(height: 16),
                    TextButton(
                      onPressed: () {
                        launchUrl(
                            Uri.parse('https://www.zheeta.com/policy/eula'));
                      },
                      child: const Text(
                        'Read the Zheeta EULA',
                        style: TextStyle(color: AppColors.primaryDark),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        launchUrl(Uri.parse(
                            'https://www.zheeta.com/policy/privacy-policy'));
                      },
                      child: const Text(
                        'Read the Privacy Policy',
                        style: TextStyle(color: AppColors.primaryDark),
                      ),
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      'Important Summary:',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      '• By using this app, you agree to abide by our terms.\n'
                      '• Zheeta strictly prohibits objectionable content, including hate speech, nudity, harassment, illegal activities, and spam.\n'
                      '• We enforce a zero-tolerance policy: violating these terms can result in content removal, account suspension, or permanent bans.',
                      style: TextStyle(color: Colors.black87, fontSize: 13),
                    ),
                    const SizedBox(height: 20),
                    CheckboxListTile(
                      controlAffinity: ListTileControlAffinity.leading,
                      activeColor: AppColors.primaryDark,
                      checkColor: AppColors.white,
                      title: const Text(
                        'I have read and agree to the EULA.',
                        style: TextStyle(color: AppColors.black, fontSize: 13),
                      ),
                      value: eulaAgreed,
                      onChanged: (bool? value) {
                        setState(() {
                          eulaAgreed = value ?? false;
                          errorMessage =
                              null; // Clear error when a checkbox is toggled
                        });
                      },
                    ),
                    CheckboxListTile(
                      controlAffinity: ListTileControlAffinity.leading,
                      activeColor: AppColors.primaryDark,
                      checkColor: AppColors.white,
                      title: const Text(
                        'I agree to the Privacy Policy.',
                        style: TextStyle(color: AppColors.black, fontSize: 13),
                      ),
                      value: privacyPolicyAgreed,
                      onChanged: (bool? value) {
                        setState(() {
                          privacyPolicyAgreed = value ?? false;
                          errorMessage =
                              null; // Clear error when a checkbox is toggled
                        });
                      },
                    ),
                    CheckboxListTile(
                      controlAffinity: ListTileControlAffinity.leading,
                      activeColor: AppColors.primaryDark,
                      checkColor: AppColors.white,
                      title: const Text(
                        'I acknowledge the content guidelines and zero-tolerance policy.',
                        maxLines: 3,
                        style: TextStyle(color: AppColors.black, fontSize: 13),
                      ),
                      value: disclaimerAgreed,
                      onChanged: (bool? value) {
                        setState(() {
                          disclaimerAgreed = value ?? false;
                          errorMessage =
                              null; // Clear error when a checkbox is toggled
                        });
                      },
                    ),
                    // Display the error message if present
                    if (errorMessage != null) ...[
                      const SizedBox(height: 16),
                      Text(
                        errorMessage!,
                        style: const TextStyle(color: Colors.red, fontSize: 14),
                      ),
                    ],
                  ],
                ),
              ),
              actions: <Widget>[
                TextButton(
                  onPressed: () async {
                    if (eulaAgreed && privacyPolicyAgreed && disclaimerAgreed) {
                      await _storage.setBool(_agreementShownKey, true);
                      if (dialogContext.mounted) {
                        Navigator.of(dialogContext).pop();
                      }
                    } else {
                      setState(() {
                        errorMessage = 'Please agree to all terms to continue.';
                      });
                    }
                  },
                  child: const Text(
                    'AGREE',
                    style: TextStyle(color: AppColors.primaryDark),
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }

  /// Resets the agreement status in SharedPreferences.
  Future<void> resetAgreementStatus() async {
    await _storage.setBool(_agreementShownKey, false);
  }

  /// Optional: A method to check if the user has generally agreed
  Future<bool> hasAgreed() async {
    return await _storage.getBool(_agreementShownKey) ?? false;
  }
}
