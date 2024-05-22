import 'package:flutter/material.dart';
import 'package:zheeta/app/common/color.dart';
import 'package:zheeta/app/router/app_router.dart';

class AppCloseButton extends StatelessWidget {
  const AppCloseButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        router.pop();
      },
      child: Container(
        width: 40,
        height: 40,
        alignment: Alignment.center,
        margin: EdgeInsets.only(left: 5, right: 5, bottom: 5, top: 5),
        decoration: BoxDecoration(color: AppColors.white, borderRadius: BorderRadius.circular(100)),
        child: Center(
          child: Icon(Icons.close, size: 25, color: AppColors.grey.withOpacity(0.4)),
        ),
      ),
    );
  }
}
