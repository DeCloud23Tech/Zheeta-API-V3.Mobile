import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zheeta/app/common/color.dart';
import 'package:zheeta/app/common/enums/others.dart';
import 'package:zheeta/app/router/app_router.gr.dart';

// class TopNavBtn2 extends StatelessWidget {
//   final IconType iconType;
//
//   const TopNavBtn2({super.key, required this.iconType});
//
//   @override
//   Widget build(BuildContext context) {
//     String icon;
//     if (iconType == IconType.menu) {
//       icon = 'assets/images/icons/menu.svg';
//     } else if (iconType == IconType.filter) {
//       icon = 'assets/images/icons/filter.svg';
//     } else if (iconType == IconType.bell) {
//       icon = 'assets/images/icons/bell.svg';
//     } else {
//       throw AssertionError('Invalid icon type');
//     }
//
//     return GestureDetector(
//       onTap: () {
//         if (iconType == IconType.menu) {
//           Scaffold.of(context).openDrawer();
//         } else if (iconType == IconType.filter) {
//           // Handle filter action, if needed
//         } else if (iconType == IconType.bell) {
//           context.router.push(NotificationRoute());
//         }
//       },
//       child: Padding(
//         padding: const EdgeInsets.all(5),
//         child: Stack(
//           children: [
//             Container(
//               padding: EdgeInsets.all(10),
//               height: 40,
//               width: 40,
//               decoration: BoxDecoration(
//                 color: AppColors.grey.withOpacity(0.1),
//                 borderRadius: BorderRadius.circular(100),
//               ),
//               child: SvgPicture.asset(
//                 icon,
//                 width: 30,
//                 colorFilter: ColorFilter.mode(AppColors.grey, BlendMode.srcIn),
//               ),
//             ),
//             if (iconType == IconType.bell)
//               Positioned(
//                 top: 5,
//                 right: 6,
//                 child: Container(
//                   constraints: BoxConstraints(minWidth: 14),
//                   height: 14,
//                   padding: EdgeInsets.symmetric(horizontal: 3),
//                   alignment: Alignment.center,
//                   decoration: BoxDecoration(
//                     color: AppColors.red,
//                     borderRadius: BorderRadius.circular(100),
//                   ),
//                   child: Text(
//                     '',
//                     style: TextStyle(
//                       fontSize: 10,
//                       fontWeight: FontWeight.w700,
//                       color: AppColors.white,
//                     ),
//                   ),
//                 ),
//               ),
//           ],
//         ),
//       ),
//     );
//   }
// }

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
      onTap: () {
        if (iconType == IconType.menu) {
          Scaffold.of(context).openDrawer();
        } else if (iconType == IconType.filter) {
          // Handle filter action, if needed
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
