import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:zheeta/common/constants/color.dart';
import 'package:zheeta/common/constants/constansts.dart';
import 'package:zheeta/core/router/app_router.dart';
import 'package:zheeta/core/router/app_router.gr.dart';
import 'package:zheeta/utils/launch_url.dart';

Widget buildMenuItems(BuildContext context) {
  final menuItems = [
    _buildMenuItem(
      context,
      'Wallet',
      "assets/images/icons/manage.svg",
      WalletRoute(),
    ),
    _buildMenuItem(
      context,
      'My Friend Request',
      "assets/images/icons/request.svg",
      FriendRequestsRoute(),
    ),
    _buildMenuItem(
      context,
      'My Buddy Events',
      "assets/images/icons/buddy-events.svg",
      MyBuddyEventsRoute(),
    ),
    _buildMenuItem(
      context,
      'Zheeta Charges',
      "assets/images/icons/charges.svg",
      ChargeListRoute(),
    ),
    _buildMenuItem(
      context,
      'Gift Shop',
      "assets/images/icons/shop.svg",
      GiftShopRoute(),
    ),
    _buildMenuItem(
      context,
      'My Gifts',
      "assets/images/icons/gifts.svg",
      MyGiftRoute(),
    ),
    _buildMenuItem(
      context,
      'My Downlines',
      "assets/images/icons/referees.svg",
      RefereeListRoute(),
    ),
    _buildMenuItem(
      context,
      'Nearby Users',
      "assets/images/icons/nearby.svg",
      NearbySearchRoute(),
    ),
    _buildMenuItem(
      context,
      'WhatsApp Support',
      "assets/images/icons/support.svg",
      null,
      onTapCustom: () => customLaunchUrl(launchWhatsApp),
    ),
    _buildMenuItem(
      context,
      'Subscription Plan',
      "assets/images/icons/subscription.svg",
      MembershipSubscriptionRoute(),
    ),
  ];

  return Wrap(
    runSpacing: 10,
    spacing: 15,
    children: menuItems,
  );
}

GestureDetector _buildMenuItem(
    BuildContext context, String title, String icon, PageRouteInfo? page,
    {VoidCallback? onTapCustom}) {
  return GestureDetector(
    onTap: () {
      Scaffold.of(context).closeDrawer();
      if (page != null) {
        router.push(page);
      } else if (onTapCustom != null) {
        onTapCustom(); // Execute custom function if provided
      }
    },
    child: Container(
      width: MediaQuery.of(context).size.width * 0.44,
      height: 70,
      padding: EdgeInsets.only(left: 15, top: 15),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SvgPicture.asset(icon),
          SizedBox(height: 5),
          Text(
            title,
            style: TextStyle(
              color: AppColors.darkText,
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    ),
  );
}
