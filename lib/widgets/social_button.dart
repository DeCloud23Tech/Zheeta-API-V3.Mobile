import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:zheeta/common/constants/color.dart';
import 'package:zheeta/utils/launch_url.dart';

class SocialButton extends StatelessWidget {
  final String icon;
  final double height;
  final double? width;
  final String? text;
  final Color? color;
  final String? link;

  const SocialButton({
    super.key,
    required this.icon,
    this.height = 24,
    this.width,
    this.text,
    this.color = Colors.black,
    this.link,
  });



  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: link != null
          ? () async {
        await customLaunchUrl(link!);
      }
          : null,
      child: Container(
        width: width ?? MediaQuery.of(context).size.width, // Use screen width if not provided
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: AppColors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center, // Center content horizontally
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              height: height,
              child: Image.asset(icon, fit: BoxFit.scaleDown),
            ),
            if (text != null) ...[
              const SizedBox(width: 8), // Space between icon and text
              Text(
                text!,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: color,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
