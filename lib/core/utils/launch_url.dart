import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> customLaunchUrl(BuildContext context, String url) async {
  final uri = Uri.tryParse(url);

  if (uri == null) {
    debugPrint('Invalid URL: $url');
    return;
  }

  // // Show loading indicator (user can dismiss manually)
  // showDialog(
  //   context: context,
  //   barrierDismissible: true, // allow user to close
  //   builder: (_) => const Center(
  //     child: CircularProgressIndicator(),
  //   ),
  // );

  try {
    if (!await canLaunchUrl(uri)) {
      debugPrint('Cannot launch URL: $url');
      return;
    }

    await launchUrl(
      uri,
      mode: LaunchMode.externalApplication,
    );
  } catch (e, stack) {
    debugPrint('Error launching URL: $e\n$stack');
  }

  // Do NOT pop the loading dialog automatically
}
