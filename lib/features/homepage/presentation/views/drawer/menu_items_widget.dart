// import 'package:auto_route/auto_route.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:zheeta/app/common/color.dart';
// import 'package:zheeta/app/router/app_router.dart';
// import 'package:zheeta/app/router/app_router.gr.dart';
// import 'package:zheeta/profile/presentation/bloc/profile_cubit/profile_cubit.dart';
//
// Widget buildMenuItems(BuildContext context) {
//   final menuItems = [
//     _buildMenuItem(
//       context,
//       'Wallet',
//       "assets/images/icons/manage.svg",
//       WalletRoute(),
//     ),
//     _buildMenuItem(
//       context,
//       'My Friend Request',
//       "assets/images/icons/request.svg",
//       FriendRequestsRoute(),
//     ),
//     _buildMenuItem(
//       context,
//       'My Buddy  events',
//       "assets/images/icons/buddy-events.svg",
//       MyBuddyEventsRoute(),
//     ),
//     _buildMenuItem(
//       context,
//       'Zheeta Charges',
//       "assets/images/icons/charges.svg",
//       ChargesList(),
//     ),
//     _buildMenuItem(
//       context,
//       'Gift Shop',
//       "assets/images/icons/shop.svg",
//       GiftShopRoute(),
//     ),
//     _buildMenuItem(
//       context,
//       'My Gifts',
//       "assets/images/icons/gifts.svg",
//       MyGiftRoute(),
//     ),
//     _buildMenuItem(
//       context,
//       'My Downlines',
//       "assets/images/icons/referees.svg",
//       DownLinesRoute(),
//     ),
//     _buildMenuItem(
//       context,
//       'Nearby Users',
//       "assets/images/icons/nearby.svg",
//       NearbySearchRoute(),
//     ),
//     _buildMenuItem(
//       context,
//       'WhatsApp support',
//       "assets/images/icons/support.svg",
//       BankAccountRoute(),
//     ),
//     _buildMenuItem(
//       context,
//       'Subscription Plan',
//       "assets/images/icons/subscription.svg",
//       MembershipSubscriptionRoute(),
//     ),
//   ];
//
//   return Wrap(
//     runSpacing: 10,
//     spacing: 15,
//     children: menuItems,
//   );
// }
//
// GestureDetector _buildMenuItem(
//     BuildContext context, String title, String icon, PageRouteInfo page) {
//   return GestureDetector(
//     onTap: () {
//       Scaffold.of(context).closeDrawer();
//       router.push(page);
//     },
//     child: Container(
//       width: MediaQuery.of(context).size.width * 0.44,
//       height: 70,
//       padding: EdgeInsets.only(left: 15, top: 15),
//       decoration: BoxDecoration(
//         color: AppColors.white,
//         borderRadius: BorderRadius.circular(8),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           SvgPicture.asset(icon),
//           SizedBox(height: 5),
//           Text(
//             title,
//             style: TextStyle(
//               color: AppColors.darkText,
//               fontSize: 14,
//               fontWeight: FontWeight.w400,
//             ),
//           ),
//         ],
//       ),
//     ),
//   );
// }
