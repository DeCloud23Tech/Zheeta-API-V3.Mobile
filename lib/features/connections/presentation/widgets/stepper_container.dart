import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:zheeta/common/constants/color.dart';

class CircularTextContainer extends StatelessWidget {
  final String text;
  final String title;
  final String subTitle;
  final Color backgroundColor;
  final Color textColor;
  final double size;
  final double fontSize;
  final bool showVerticalDivider;

  const CircularTextContainer({super.key,
    required this.text,
    this.backgroundColor = AppColors.white,
    this.textColor = AppColors.primaryDark,
    this.size = 50.0,
    this.fontSize = 24.0,
    required this.title,
    required this.subTitle,
    required this.showVerticalDivider,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            Container(
              width: size,
              height: size,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: backgroundColor,
              ),
              child: Center(
                child: Text(
                  text,
                  style: TextStyle(
                      color: textColor,
                      fontSize: fontSize,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
            if (showVerticalDivider)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: List.generate(
                  4,
                  (index) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    child: Container(
                      width: 2.0,
                      height: 8.0,
                      decoration: BoxDecoration(
                        border: Border(
                          right: BorderSide(
                            color: AppColors.grayscale,
                            width: 2.0,
                            style: BorderStyle.solid,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              )
          ],
        ),
        SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                    color: AppColors.grayscale,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              Text(
                subTitle,
                style: TextStyle(
                    color: AppColors.grey,
                    fontSize: 16,
                    fontWeight: FontWeight.w400),
              ),
            ],
          ),
        )
      ],
    );
  }
}
