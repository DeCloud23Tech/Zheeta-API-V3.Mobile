import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:zheeta/core/constants/color.dart';
import 'package:zheeta/core/utils/notify.dart';

class LinkText extends StatelessWidget {
  final String linkText;

  const LinkText({super.key, required this.linkText});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 34,
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              child: Text(
                linkText,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: AppColors.primaryDark,
                  fontSize: 12,
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Clipboard.setData(ClipboardData(text: linkText));
              NotifyUser.showSnackBar('Link copied to clipboard');
            },
            child: Container(
              width: 62,
              height: double.infinity,
              decoration: const BoxDecoration(
                color: Color(0xFFFFF4F8),
                border: Border(
                  left: BorderSide(color: Color(0xFFF3D9E4)),
                ),
              ),
              child: const Center(
                child: Text(
                  'Copy',
                  style: TextStyle(
                    color: AppColors.primaryDark,
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
