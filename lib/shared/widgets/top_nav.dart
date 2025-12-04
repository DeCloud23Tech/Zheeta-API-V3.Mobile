import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zheeta/core/constants/color.dart';
import 'package:zheeta/router/app_router.gr.dart';
import 'package:zheeta/shared/bottom_sheets/match_filter_bottom_sheet.dart';
import 'package:zheeta/shared/enums/icon_type_enum.dart';

class TopNavBtn extends StatelessWidget {
  final IconType iconType;
  final Color color;
  final int badgeCount;

  const TopNavBtn({
    super.key,
    required this.iconType,
    this.color = Colors.transparent,
    this.badgeCount = 0,
  });

  // Map IconType to asset path
  String get _iconAsset {
    switch (iconType) {
      case IconType.menu:
        return 'assets/images/icons/menu.svg';
      case IconType.filter:
        return 'assets/images/icons/filter.svg';
      case IconType.bell:
        return 'assets/images/icons/bell.svg';
      case IconType.photo:
        return 'assets/images/icons/camera.svg';
    }
  }

  // Handle tap logic
  void _handleTap(BuildContext context) {
    switch (iconType) {
      case IconType.menu:
        Scaffold.of(context).openDrawer();
        break;
      case IconType.filter:
        matchCriteriaBottomSheetView(context);
        break;
      case IconType.bell:
        context.router.push(NotificationRoute());
        break;
      case IconType.photo:
        context.router.push(ProfileEditCarouselRoute());
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: InkWell(
        borderRadius: BorderRadius.circular(100),
        onTap: () => _handleTap(context),
        child: SizedBox(
          height: 40,
          width: 40,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(100),
                ),
                padding: const EdgeInsets.all(10),
                child: SvgPicture.asset(
                  _iconAsset,
                  width: 20,
                  height: 20,
                ),
              ),

              // Badge for notifications
              if (iconType == IconType.bell && badgeCount > 0)
                Positioned(
                  top: -2,
                  right: -2,
                  child: Container(
                    constraints: const BoxConstraints(minWidth: 14),
                    height: 14,
                    padding: const EdgeInsets.symmetric(horizontal: 3),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: AppColors.red,
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: Text(
                      '$badgeCount',
                      style: const TextStyle(
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
      ),
    );
  }
}
