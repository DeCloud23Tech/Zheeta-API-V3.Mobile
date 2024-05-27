import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zheeta/app/common/color.dart';
import 'package:zheeta/app/common/extensions/string_extension.dart';
import 'package:zheeta/app/router/app_router.dart';
import 'package:zheeta/app/router/app_router.gr.dart';
import 'package:zheeta/profile/presentation/viewmodel/user_profile_viewmodel.dart';
import 'package:zheeta/widgets/primary_button.dart';

import '../app/injection/di.dart';
import '../profile/data/model/user_profile_model.dart';
import '../profile/presentation/bloc/profile_cubit.dart';

class SideDrawer extends StatefulWidget {
  const SideDrawer({super.key});

  @override
  State<SideDrawer> createState() => _SideDrawerState();
}

class _SideDrawerState extends State<SideDrawer> {
  late UserProfileViewModel userProfileViewModel;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(builder: (context, state) {
      if (state is! ProfileGotSingleUserState) {
        // Handle other states (e.g., loading, error, etc.)
        userProfileViewModel = locator<UserProfileViewModel>();
        userProfileViewModel.getSingleUserProfile(context);
        return Center(
          child: CircularProgressIndicator(color: AppColors.primaryDark),
        );
      }
      final data = state.data.data;

      return Container(
        width: MediaQuery.of(context).size.width,
        child: Drawer(
          elevation: 0.0,
          child: Container(
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(color: AppColors.primaryDark),
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(19),
                          child: Image.network(
                            '${data.profile?.profilePhotoURL}',
                            height: 57,
                            width: 57,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(width: 15),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(height: 20),
                            Row(
                              children: [
                                if (data.user?.isFullyVerified ?? false)
                                  Image.asset(
                                    'assets/images/badge.png',
                                    width: 19,
                                    height: 19,
                                  ),
                                SizedBox(width: 5),
                                Text(
                                  "${data.profile?.firstName} ${data.profile?.lastName}",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                SizedBox(height: 5),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  "@${data.user?.userName}",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                SizedBox(width: 10),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 3, horizontal: 6),
                                  decoration: BoxDecoration(
                                    color: AppColors.primaryDark,
                                    gradient: const LinearGradient(
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                      colors: [
                                        AppColors.primaryLight,
                                        AppColors.primaryDark,
                                      ],
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Row(
                                    children: [
                                      SvgPicture.asset(
                                        'assets/images/female.svg',
                                        width: 10,
                                      ),
                                      SizedBox(width: 3),
                                      Text(
                                        '${data.profile?.dateOfBirth.toString().dateToAge}',
                                        style: const TextStyle(
                                          color: AppColors.white,
                                          fontSize: 9,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(width: 6),
                                Container(
                                  width: 24,
                                  height: 19,
                                  padding: EdgeInsets.all(1),
                                  decoration: BoxDecoration(
                                    color: data.profile?.gender
                                                .toString()
                                                .getFirstLetter ==
                                            'M'
                                        ? Color(0xff07C35D)
                                        : AppColors.primaryLight,
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                  child: Center(
                                    child: Text(
                                      '${data.profile?.gender.toString().getFirstLetter}',
                                      style: const TextStyle(
                                        color: AppColors.white,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 20),
                          ],
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        Scaffold.of(context).closeDrawer();
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(5),
                        child: Container(
                          padding: EdgeInsets.all(10),
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            color: AppColors.white.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: SvgPicture.asset(
                            'assets/images/icons/close.svg',
                            width: 30,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          router.push(FriendRoute());
                        },
                        child: Column(
                          children: [
                            Text(
                              "${data.profileCounters?.friendsCount}",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Text(
                              "Friends",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Column(
                          children: [
                            Text(
                              "${data.profileCounters?.refereesCount}",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Text(
                              "Referees",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Column(
                          children: [
                            Text(
                              "${data.profileCounters?.postCount}",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Text(
                              "Posts",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 40,
                  child: PrimaryButton(
                    invert: true,
                    icon: "assets/images/icons/manage.svg",
                    title: 'Manage User',
                    action: () {
                      router.push(ProfileEditRoute());
                    },
                  ),
                ),
                SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "My Communities",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      "View All",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Container(
                      width: 50,
                      height: 70,
                      padding: EdgeInsets.all(14),
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: SvgPicture.asset("assets/images/icons/plus.svg"),
                    ),
                    SizedBox(width: 10),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.77,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            for (var i = 0; i < 6; i++)
                              community(
                                context,
                                "Community 1",
                                "assets/images/comm.png",
                                PendingRequestRoute(),
                              ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Wrap(
                  runSpacing: 10,
                  spacing: 15,
                  children: [
                    menu(
                      context,
                      'Wallet',
                      "assets/images/icons/manage.svg",
                      PendingRequestRoute(),
                    ),
                    menu(
                      context,
                      'My Friend Request',
                      "assets/images/icons/request.svg",
                      PendingRequestRoute(),
                    ),
                    menu(
                      context,
                      'Gift Shop',
                      "assets/images/icons/shop.svg",
                      GiftShopRoute(),
                    ),
                    menu(
                      context,
                      'My Gifts',
                      "assets/images/icons/gifts.svg",
                      MyGiftRoute(),
                    ),
                    menu(
                      context,
                      'Bank Account',
                      "assets/images/icons/bank.svg",
                      BankAccountRoute(),
                    ),
                    menu(
                      context,
                      'Subscription Plan',
                      "assets/images/icons/subscription.svg",
                      PendingRequestRoute(),
                    ),
                    menu(
                      context,
                      'My Referees',
                      "assets/images/icons/referees.svg",
                      RefereeRoute(),
                    ),
                    menu(
                      context,
                      'Nearby Users',
                      "assets/images/icons/nearby.svg",
                      NearbySearchRoute(),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Container(
                  height: 100,
                  padding: EdgeInsets.only(left: 15, top: 15, right: 15),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Z- \$ Rate in my Local Currency",
                        style: TextStyle(
                          color: AppColors.darkText,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(height: 10),
                      Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: AppColors.secondaryLight,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "1 USD",
                              style: TextStyle(
                                color: AppColors.darkText,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Container(
                              color: AppColors.primaryDark,
                              height: 15,
                              width: 1,
                            ),
                            Text(
                              "740.00 NGN",
                              style: TextStyle(
                                color: AppColors.darkText,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                SizedBox(
                  height: 40,
                  child: PrimaryButton(
                    invert: true,
                    icon: "assets/images/icons/logout.svg",
                    title: 'Logout',
                    action: () {
                      Scaffold.of(context).closeDrawer();
                      router.replace(SignInRoute());
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }

  GestureDetector menu(
    BuildContext context,
    String title,
    String icon,
    PageRouteInfo page,
  ) {
    return GestureDetector(
      onTap: () {
        Scaffold.of(context).closeDrawer();
        router.push(page);
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

  GestureDetector community(
    BuildContext context,
    String title,
    String icon,
    PageRouteInfo page,
  ) {
    return GestureDetector(
      onTap: () {
        Scaffold.of(context).closeDrawer();
        router.push(page);
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 6.0, right: 6.0),
        child: Column(
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Image.asset(icon),
            ),
            SizedBox(height: 5),
            Text(
              title,
              style: TextStyle(
                color: AppColors.white,
                fontSize: 10,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
