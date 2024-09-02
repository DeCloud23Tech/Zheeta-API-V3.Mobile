import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zheeta/app/common/color.dart';
import 'package:zheeta/app/router/app_router.gr.dart';
import 'package:zheeta/profile/presentation/viewmodel/user_profile_viewmodel.dart';
import 'package:zheeta/widgets/primary_button.dart';
import '../app/common/storage/token_storage/i_token_storage.dart';
import '../app/injection/di.dart';
import '../app/router/app_router.dart';
import '../profile/presentation/bloc/profile_cubit/profile_cubit.dart';

class SideDrawer extends StatefulWidget {
  const SideDrawer({super.key});

  @override
  State<SideDrawer> createState() => _SideDrawerState();
}

class _SideDrawerState extends State<SideDrawer> {
  final ITokenStorage tokenStorage = locator<ITokenStorage>();
  final userProfileViewModel = locator<UserProfileViewModel>();

  void _logout(BuildContext context) {
    tokenStorage.clear().then((_) {
      ScaffoldMessenger.of(context).clearSnackBars();
      router.replaceAll([const SignInRoute()]);
    }).catchError((error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to logout. Please try again.'),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
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
              _buildUserProfile(context),
              Padding(
                padding: const EdgeInsets.all(15),
                child: _buildProfileCounters(context),
              ),
              SizedBox(
                height: 35,
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
              _buildCommunitiesSection(context),
              SizedBox(height: 12),
              _buildCommunities(context),
              SizedBox(height: 15),
              _buildMenuItems(context),
              SizedBox(height: 15),
              _buildCurrencyInfo(),
              SizedBox(height: 30),
              SizedBox(
                height: 40,
                child: PrimaryButton(
                    invert: true,
                    icon: "assets/images/icons/logout.svg",
                    title: 'Logout',
                    action: () {
                      _logout(context);
                    }),
              ),
              SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildUserProfile(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BlocBuilder<ProfileCubit, ProfileState>(
            builder: (context, state) {
              if (state is ProfileCompositeState) {
                final data = state.userProfile!.data;
                return Row(
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
                    SizedBox(width: 8),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            if (data.user?.isFullyVerified ?? false)
                              Image.asset(
                                'assets/images/badge.png',
                                height: 18,
                                width: 18,
                              ),
                            if (data.user?.isFullyVerified ?? false)
                              SizedBox(width: 8),
                            Text(
                              "${data.profile?.firstName} ${data.profile?.lastName}",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 5),
                        Row(
                          children: [
                            Text(
                              "@${data.user?.userName}",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
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
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: Row(
                                children: [
                                  Text(
                                    '${data.profile?.age}',
                                    style: const TextStyle(
                                        color: AppColors.white,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(width: 6),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 3, horizontal: 6),
                              decoration: BoxDecoration(
                                color: data.profile?.gender == 1
                                    ? Color(0xff07C35D)
                                    : AppColors.primaryLight,
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: Center(
                                child: Text(
                                  '${data.profile?.gender == 1 ? 'M' : 'F'}',
                                  style: const TextStyle(
                                    color: AppColors.white,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              margin: EdgeInsets.symmetric(horizontal: 8),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Color(0xffFEB237),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.3),
                                    spreadRadius: 0,
                                    blurRadius: 2,
                                    offset: Offset(0, 1),
                                  ),
                                ],
                              ),
                              child: Text(
                                data.subscription?.name,
                                style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                );
              } else {
                return SizedBox.shrink();
              }
            },
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
    );
  }

  Widget _buildProfileCounters(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        if (state is ProfileCompositeState) {
          final data = state.userProfile!.data;
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildCounter(context, "Friends",
                  "${data.profileCounters?.friendsCount}", FriendRoute()),
              _buildCounter(context, "Referees",
                  "${data.profileCounters?.refereesCount}", null),
              _buildCounter(
                  context, "Posts", "${data.profileCounters?.postCount}", null),
            ],
          );
        } else {
          return SizedBox.shrink();
        }
      },
    );
  }

  GestureDetector _buildCounter(
      BuildContext context, String title, String count, PageRouteInfo? route) {
    return GestureDetector(
      onTap: route != null
          ? () {
              Scaffold.of(context).closeDrawer();
              router.push(route);
            }
          : null,
      child: Column(
        children: [
          Text(
            count,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
          Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCommunitiesSection(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "My Communities",
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        Text(
          "View All",
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }

  Widget _buildCommunities(BuildContext context) {
    return Row(
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
              children: List.generate(
                  6,
                  (index) => _buildCommunity(context, "Community 1",
                      "assets/images/comm.png", PendingRequestRoute())),
            ),
          ),
        ),
      ],
    );
  }

  GestureDetector _buildCommunity(
      BuildContext context, String title, String icon, PageRouteInfo page) {
    return GestureDetector(
      onTap: () {
        Scaffold.of(context).closeDrawer();
        router.push(page);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
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
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItems(BuildContext context) {
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
        PendingRequestRoute(),
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
        'Bank Account',
        "assets/images/icons/bank.svg",
        BankAccountRoute(),
      ),
      _buildMenuItem(
        context,
        'Subscription Plan',
        "assets/images/icons/subscription.svg",
        MembershipSubscriptionRoute(),
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
    ];

    return Wrap(
      runSpacing: 10,
      spacing: 15,
      children: menuItems,
    );
  }

  GestureDetector _buildMenuItem(
      BuildContext context, String title, String icon, PageRouteInfo page) {
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

  Widget _buildCurrencyInfo() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
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
              fontSize: 16,
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
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Container(
                  color: AppColors.black,
                  height: 15,
                  width: 2,
                ),
                Text(
                  "740.00 NGN",
                  style: TextStyle(
                    color: AppColors.darkText,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
