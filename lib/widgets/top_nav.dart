import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zheeta/common/constants/color.dart';
import 'package:zheeta/common/enums/others.dart';
import 'package:zheeta/core/router/app_router.gr.dart';
import 'package:zheeta/features/discover/presentation/widgets/match_filter_bottom_sheet.dart';

class TopNavBtn extends StatelessWidget {
  final IconType iconType;
  final Color color;

  const TopNavBtn({
    super.key,
    required this.iconType,
    this.color = Colors.transparent,
  });

  @override
  Widget build(BuildContext context) {
    String icon;
    if (iconType == IconType.menu) {
      icon = 'assets/images/icons/menu.svg';
    } else if (iconType == IconType.filter) {
      icon = 'assets/images/icons/filter.svg';
    } else if (iconType == IconType.bell) {
      icon = 'assets/images/icons/bell.svg';
    } else if (iconType == IconType.photo) {
      icon = 'assets/images/icons/camera.svg';
    } else {
      throw AssertionError('Invalid icon type');
    }

    return GestureDetector(
      onTap: () async {
        if (iconType == IconType.menu) {
          Scaffold.of(context).openDrawer();
        } else if (iconType == IconType.filter) {
          // Open the bottom sheet and await the result
          matchCriteriaBottomSheetView(context);
        } else if (iconType == IconType.bell) {
          context.router.push(NotificationRoute());
        } else if (iconType == IconType.photo) {
          context.router.push(ProfileEditCarouselRoute());
        }
      },
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: Stack(
          children: [
            Container(
              padding: EdgeInsets.all(10),
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(100),
              ),
              child: SvgPicture.asset(
                icon,
                width: 30,
              ),
            ),
            if (iconType == IconType.bell)
              Positioned(
                top: 5,
                right: 6,
                child: Container(
                  constraints: BoxConstraints(minWidth: 14),
                  height: 14,
                  padding: EdgeInsets.symmetric(horizontal: 3),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: AppColors.red,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Text(
                    '',
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w700,
                      color: AppColors.white,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
