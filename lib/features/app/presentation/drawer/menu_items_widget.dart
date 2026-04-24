import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:zheeta/core/constants/color.dart';
import 'package:zheeta/router/app_router.dart';
import 'package:zheeta/router/app_router.gr.dart';

Widget buildMenuItems(BuildContext context) {
  return LayoutBuilder(
    builder: (context, constraints) {
      final itemWidth = (constraints.maxWidth - 20) / 2; // dynamic width
      final itemHeight = itemWidth * 0.55; // maintain aspect ratio

      final menuItems = [
        _buildMenuItem(
          context,
          'Wallet',
          "assets/images/icons/wallet.svg",
          WalletRoute(),
          itemWidth,
          itemHeight,
        ),
        _buildMenuItem(
          context,
          'My Friend Request',
          "assets/images/icons/request.svg",
          FriendRequestsRoute(),
          itemWidth,
          itemHeight,
        ),
        _buildMenuItem(
          context,
          'My Buddy Events',
          "assets/images/icons/buddy-events.svg",
          MyBuddyEventsRoute(),
          itemWidth,
          itemHeight,
        ),
        _buildMenuItem(
          context,
          'Zheeta Charges',
          "assets/images/icons/charges.svg",
          ChargeListRoute(),
          itemWidth,
          itemHeight,
        ),
        // _buildMenuItem(
        //   context,
        //   'Gift Shop',
        //   "assets/images/icons/shop.svg",
        //   GiftShopRoute(),
        //   itemWidth,
        //   itemHeight,
        // ),
        // _buildMenuItem(
        //   context,
        //   'My Gifts',
        //   "assets/images/icons/gifts.svg",
        //   MyGiftRoute(),
        //   itemWidth,
        //   itemHeight,
        // ),
        _buildMenuItem(
          context,
          'My Downlines',
          "assets/images/icons/referees.svg",
          RefereeListRoute(),
          itemWidth,
          itemHeight,
        ),
        // _buildMenuItem(
        //   context,
        //   'Nearby Users',
        //   "assets/images/icons/nearby.svg",
        //   NearbySearchRoute(),
        //   itemWidth,
        //   itemHeight,
        // ),
        _buildMenuItem(
          context,
          'User Finder',
          "assets/images/icons/manage.svg",
          UserFinderRoute(),
          itemWidth,
          itemHeight,
        ),
        _buildMenuItem(
          context,
          'Subscription Plan',
          "assets/images/icons/subscription.svg",
          MembershipSubscriptionRoute(),
          itemWidth,
          itemHeight,
        ),
      ];

      return Wrap(
        runSpacing: 12,
        spacing: 15,
        children: menuItems,
      );
    },
  );
}

GestureDetector _buildMenuItem(
  BuildContext context,
  String title,
  String icon,
  PageRouteInfo? page,
  double width,
  double height, {
  VoidCallback? onTapCustom,
}) {
  final fontSize = MediaQuery.of(context).size.width * 0.035; // scale font

  return GestureDetector(
    onTap: () {
      Scaffold.of(context).closeDrawer();
      if (page != null) {
        router.push(page);
      } else if (onTapCustom != null) {
        onTapCustom();
      }
    },
    child: Container(
      width: width,
      height: height,
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(icon, width: width * 0.15), // scale icon
          SizedBox(height: 12),
          Flexible(
            child: Text(
              title,
              style: TextStyle(
                color: AppColors.darkText,
                fontSize: fontSize.clamp(10, 16), // safe bounds
                fontWeight: FontWeight.w400,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    ),
  );
}
