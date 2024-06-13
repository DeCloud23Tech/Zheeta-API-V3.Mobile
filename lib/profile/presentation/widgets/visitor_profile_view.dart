import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:zheeta/profile/presentation/widgets/profile_posts.dart';
import 'package:zheeta/profile/presentation/widgets/recent-downlines.dart';
import 'package:zheeta/profile/presentation/widgets/tab_button.dart';
import 'package:zheeta/profile/presentation/widgets/user_bio.dart';

import '../../../app/common/color.dart';
import '../../../app/common/enums/others.dart';
import '../../../app/router/app_router.dart';
import '../../../app/router/app_router.gr.dart';
import '../../../widgets/primary_button.dart';
import '../../../widgets/top_nav.dart';
import '../../data/model/user_profile_model.dart';
import '../bloc/profile_cubit.dart';
import '../viewmodel/user_profile_viewmodel.dart';
import 'counter.dart';
import 'intrests_tile.dart';

Widget buildVisitorProfileView({
  ScrollController? controller,
  UserProfileDataModel? theUser,
  UserProfileViewModel? userProfileViewModel,
  required int current,
  required int carouselCount,
  required int activeTab,
  required bool showFullBio,
  required Function(int) updateActiveTab,
  required Function(int) updateCurrentIndex,
  required VoidCallback toggleBio,
}) {
  return BlocConsumer<ProfileCubit, ProfileState>(
    listener: (context, state) {},
    builder: (context, state) {
      print(theUser?.subscription?.name);
      return CustomScrollView(
        controller: controller,
        slivers: <Widget>[
          SliverAppBar(
            elevation: 0,
            centerTitle: true,
            backgroundColor: AppColors.secondaryLight,
            surfaceTintColor: AppColors.secondaryLight,
            scrolledUnderElevation: 0.5,
            shadowColor: Colors.grey,
            automaticallyImplyLeading: false,
            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TopNavBtn(iconType: IconType.menu),
                  TopNavBtn(iconType: IconType.bell)
                ],
              ),
              SizedBox(width: 16),
            ],
            pinned: true,
            expandedHeight: MediaQuery.of(context).size.height * 0.55,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              background: Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  CarouselSlider.builder(
                    itemCount: theUser?.userCarousels?.length != 0
                        ? theUser?.userCarousels?.length
                        : 1,
                    itemBuilder: (BuildContext context, int itemIndex,
                        int pageViewIndex) {
                      if (theUser?.userCarousels?.length != 0)
                        return ClipRRect(
                          child: Image.network(
                              theUser
                                  ?.userCarousels?[itemIndex].carouselPhotoUrl,
                              fit: BoxFit.cover,
                              height: MediaQuery.of(context).size.height * 0.55,
                              width: double.infinity),
                        );
                      return ClipRRect(
                        child: Image.network(theUser?.profile?.profilePhotoURL,
                            fit: BoxFit.cover,
                            height: MediaQuery.of(context).size.height * 0.55,
                            width: double.infinity),
                      );
                    },
                    options: CarouselOptions(
                      autoPlay: false,
                      height: MediaQuery.of(context).size.height * 0.65,
                      // enlargeCenterPage: true,
                      viewportFraction: 1.0,
                      // aspectRatio: 2.0,
                      initialPage: 0,
                      onPageChanged: (index, reason) {
                        updateCurrentIndex(index);
                      },
                    ),
                  ),
                  Positioned(
                    bottom: 75,
                    left: 10,
                    child: TopNavBtn(iconType: IconType.photo),
                  ),
                  Positioned(
                    bottom: 30,
                    child: Row(
                      children: [
                        for (var i = 0; i < carouselCount; i++)
                          Padding(
                            padding: const EdgeInsets.all(3),
                            child: Container(
                              height: 10,
                              width: 10,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color: current == i
                                    ? AppColors.white
                                    : AppColors.white.withOpacity(0.2),
                              ),
                            ),
                          )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              <Widget>[
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    // if (theUser?.user?.isFullyVerified)
                                      Image.asset('assets/images/badge.png',
                                          width: 19, height: 19),
                                    SizedBox(width: 8),
                                    Image.asset('assets/images/share.png',
                                        width: 19, height: 19),
                                    SizedBox(width: 8),
                                    if (theUser?.subscription?.name == "Gold ")
                                      Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10, vertical: 5),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            color: Color(0xffFEB237),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.black
                                                    .withOpacity(0.3),
                                                spreadRadius: 0,
                                                blurRadius: 2,
                                                offset: Offset(0, 1),
                                              ),
                                            ]),
                                        child: Text(
                                          'Premium',
                                          style: TextStyle(
                                              fontSize: 10,
                                              fontWeight: FontWeight.w600,
                                              color: AppColors.white),
                                        ),
                                      ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 5.0),
                                      child: Text(
                                        '${theUser?.profile?.firstName} ${theUser?.profile?.lastName}',
                                        style: const TextStyle(
                                          color: AppColors.darkText,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 24,
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 20),
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
                                            AppColors.primaryDark
                                          ],
                                        ),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Row(
                                        children: [
                                          SvgPicture.asset(
                                            'assets/images/female.svg',
                                            width: 11,
                                          ),
                                          SizedBox(width: 3),
                                          Text(
                                            '${theUser?.profile?.age}',
                                            style: const TextStyle(
                                              color: AppColors.white,
                                              fontSize: 12,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                  '${theUser?.residentialAddress?.city}, ${theUser?.residentialAddress?.country}(2 miles away)',
                                  style: const TextStyle(
                                    color: AppColors.grey,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              router.push(ProfileEditRoute());
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(5),
                              child: Container(
                                padding: EdgeInsets.all(10),
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                  color: AppColors.white,
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                child: SvgPicture.asset(
                                  'assets/images/icons/dots.svg',
                                  width: 30,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 20),
                      Container(
                        padding: EdgeInsets.all(22),
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            buildCounterWidget(
                              count: theUser?.profileCounters?.friendsCount,
                              label: 'Friends',
                            ),
                            buildCounterWidget(
                              count: theUser?.profileCounters?.refereesCount,
                              label: 'Referees',
                            ),
                            buildCounterWidget(
                              count: theUser?.profileCounters?.postCount,
                              label: 'Posts',
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20),
                      PrimaryButton(
                        icon: 'assets/images/icons/rocket.svg',
                        invert: false,
                        title: 'Boost Profile',
                        action: () {
                          router.push(ProfileBoostRoute());
                        },
                      ),
                      SizedBox(height: 20),
                      Container(
                        height: 40,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TabButton(
                              title: 'Bio',
                              tabIndex: 1,
                              activeTab: activeTab,
                              onTabSelected: updateActiveTab,
                            ),
                            TabButton(
                              title: 'Post',
                              tabIndex: 2,
                              activeTab: activeTab,
                              onTabSelected: updateActiveTab,
                            ),
                          ],
                        ),
                      ),
                      activeTab == 1
                          ? Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // UserBioWidget(
                                //   user: theUser,
                                //   showFullBio: showFullBio,
                                //   toggleBio: toggleBio,
                                // ),
                                RecentDownlinesWidget(
                                  userDownlines: theUser?.userDownlines,
                                  onViewAll: () {
                                    /* Handle View All */
                                  },
                                ),
                                Text(
                                  "Interest",
                                  style: TextStyle(
                                    color: AppColors.grayscale,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                SizedBox(height: 10),
                                Wrap(
                                  runSpacing: 10,
                                  spacing: 10,
                                  children: theUser?.interests
                                          ?.map((e) =>
                                              InterestWidget(title: e.title))
                                          .toList() ??
                                      [],
                                ),
                              ],
                            )
                          : PostsWidget(
                              medias:
                                  userProfileViewModel?.userActivityModel?.data,
                            ),
                      SizedBox(height: 200),
                      // Assuming this is placed outside the conditional rendering
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      );
    },
  );
}
