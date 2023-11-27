import 'package:flutter/material.dart';
import 'package:zheeta/core/constants/color.dart';

class SocialButton extends StatelessWidget {
  final icon;
  const SocialButton({super.key, this.icon});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        height: 48,
        width: 48,
        padding: EdgeInsets.all(10),
        decoration:
            BoxDecoration(borderRadius: BorderRadius.circular(8), color: white),
        child: Image.asset(icon),
      ),
    );
  }
}
