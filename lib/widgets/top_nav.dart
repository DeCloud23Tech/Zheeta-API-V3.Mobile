import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zheeta/app/common/color.dart';
import 'package:zheeta/app/common/enums/others.dart';
import 'package:zheeta/app/router/app_router.dart';
import 'package:zheeta/app/router/app_router.gr.dart';
import 'package:zheeta/discover/presentation/widgets/criteria_filter_bottomsheet.dart';
import 'package:zheeta/notification/presentation/viewmodel/notification_viewmodel.dart';

class TopNavBtn2 extends ConsumerWidget {
  final IconType iconType;
  const TopNavBtn2({super.key, required this.iconType});

  @override
  Widget build(BuildContext context, ref) {
    final notificationState = ref.watch(notificationViewModelProvider);

    String icon;
    if (iconType == IconType.menu) {
      icon = 'assets/images/icons/menu.svg';
    } else if (iconType == IconType.filter) {
      icon = 'assets/images/icons/filter.svg';
    } else if (iconType == IconType.bell) {
      icon = 'assets/images/icons/bell.svg';
    } else {
      throw AssertionError('Invalid icon type');
    }
    return GestureDetector(
      onTap: () {
        if (iconType == IconType.menu) {
          Scaffold.of(context).openDrawer();
        } else if (iconType == IconType.filter) {
          criteriaFilterBottomSheet(context);
        } else if (iconType == IconType.bell) {
          router.push(NotificationRoute());
        }
      },
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: iconType == IconType.bell &&
                (notificationState.unreadNotificationsCountState.data ?? 0) > 0
            ? Stack(
                children: [
                  Container(
                    padding: EdgeInsets.all(10),
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      color: AppColors.grey.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: SvgPicture.asset(
                      icon,
                      width: 30,
                      colorFilter:
                          ColorFilter.mode(AppColors.grey, BlendMode.srcIn),
                    ),
                  ),
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
                        '${notificationState.unreadNotificationsCountState.data}',
                        style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w700,
                            color: AppColors.white),
                      ),
                    ),
                  ),
                ],
              )
            : Container(
                padding: EdgeInsets.all(10),
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  color: AppColors.grey.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(100),
                ),
                child: SvgPicture.asset(
                  icon,
                  width: 30,
                  colorFilter:
                      ColorFilter.mode(AppColors.grey, BlendMode.srcIn),
                ),
              ),
      ),
    );
  }
}

class TopNavBtn extends ConsumerWidget {
  final IconType iconType;
  const TopNavBtn({super.key, required this.iconType});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notificationState = ref.watch(notificationViewModelProvider);

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
      onTap: () {
        if (iconType == IconType.menu) {
          Scaffold.of(context).openDrawer();
        } else if (iconType == IconType.filter) {
          criteriaFilterBottomSheet(context);
        } else if (iconType == IconType.bell) {
          router.push(NotificationRoute());
        }
      },
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: iconType == IconType.bell &&
                (notificationState.unreadNotificationsCountState.data ?? 0) > 0
            ? Stack(
                children: [
                  Container(
                    padding: EdgeInsets.all(10),
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      color: AppColors.white.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: SvgPicture.asset(
                      icon,
                      width: 30,
                    ),
                  ),
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
                        '${notificationState.unreadNotificationsCountState.data}',
                        style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w700,
                            color: AppColors.white),
                      ),
                    ),
                  ),
                ],
              )
            : Container(
                padding: EdgeInsets.all(10),
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  color: AppColors.white.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(100),
                ),
                child: SvgPicture.asset(
                  icon,
                  width: 30,
                ),
              ),
      ),
    );
  }
}
