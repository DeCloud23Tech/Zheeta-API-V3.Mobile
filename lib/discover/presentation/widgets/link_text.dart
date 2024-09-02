import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:zheeta/app/common/color.dart'; // For Clipboard

class LinkText extends StatelessWidget {
  final String linkText;

  LinkText({required this.linkText});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            linkText,
            style: TextStyle(
              color: AppColors.primaryDark,
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            // Copy link text to clipboard
            Clipboard.setData(ClipboardData(text: linkText));
            // Show a snackbar to indicate the link is copied
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Link copied to clipboard')),
            );
          },
          child: Text(
            'Copy',
            style: TextStyle(
              color: AppColors.primaryDark,
              fontWeight: FontWeight.w600
            ),
          ),
        ),
      ],
    );
  }
}
