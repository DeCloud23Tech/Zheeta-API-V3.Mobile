import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:zheeta/app/router/app_router.gr.dart';

import '../../../app/common/color.dart';
import '../../../app/router/app_router.dart';
import '../../../profile/data/model/user_profile_model.dart';
import '../../../profile/presentation/bloc/profile_cubit/profile_cubit.dart';
import '../../../widgets/reusable_container.dart';
import '../widgets/link_text.dart';
import '../widgets/stepper_container.dart';

@RoutePage()
class RefereeListScreen extends StatelessWidget {
  const RefereeListScreen({super.key});

  String formatDate(dynamic date) {
    DateTime parsedDate;

    if (date is String) {
      try {
        parsedDate = DateTime.parse(date);
      } catch (e) {
        return 'Invalid date format';
      }
    } else if (date is DateTime) {
      parsedDate = date;
    } else {
      return 'Unsupported date type';
    }

    String daySuffix(int day) {
      if (day >= 11 && day <= 13) {
        return 'th';
      }
      switch (day % 10) {
        case 1:
          return 'st';
        case 2:
          return 'nd';
        case 3:
          return 'rd';
        default:
          return 'th';
      }
    }

    final day = parsedDate.day;
    final suffix = daySuffix(day);
    final month = DateFormat('MMM').format(parsedDate);
    final year = parsedDate.year;

    return '$day$suffix $month $year';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondaryLight,
      appBar: AppBar(
        backgroundColor: AppColors.secondaryLight,
        elevation: 0.0,
        leading: GestureDetector(
          onTap: () => router.pop(),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              padding: EdgeInsets.all(5),
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(100),
              ),
              child: Icon(Icons.arrow_back_ios_new, color: AppColors.grey),
            ),
          ),
        ),
        title: Text(
          'Referee List',
          style: TextStyle(
              color: AppColors.grayscale,
              fontSize: 24,
              fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
          child: ListView(
            children: [
              Text(
                'Refer a friend',
                style: TextStyle(
                    color: AppColors.grayscale,
                    fontSize: 26,
                    fontWeight: FontWeight.w600),
              ),
              Text(
                'And you can earn Affiliate Commissions whenever they Earn or Subscribe',
                style: TextStyle(
                    color: AppColors.grayscale,
                    fontSize: 18,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  SvgPicture.asset('assets/images/icons/info.svg'),
                  SizedBox(width: 15),
                  Text(
                    'How it works',
                    style: TextStyle(
                        color: AppColors.primaryDark,
                        fontSize: 16,
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
              SizedBox(height: 20),
              CircularTextContainer(
                text: '1',
                title: 'Invite your friends',
                subTitle: 'By sharing your link',
                showVerticalDivider: true,
              ),
              CircularTextContainer(
                text: '2',
                title: 'Then get paid',
                subTitle: 'Whenever they subscribe or earn on Zheeta',
                showVerticalDivider: true,
              ),
              CircularTextContainer(
                text: '3',
                title: 'You make 10%',
                subTitle: 'From every of their Transaction',
                showVerticalDivider: false,
              ),
              SizedBox(height: 20),
              BlocBuilder<ProfileCubit, ProfileState>(
                builder: (context, state) {
                  if (state is ProfileCompositeState) {
                    return ReusableCustomContainer(
                      child: LinkText(
                        linkText:
                            state.userProfile!.data.referralInfo!.referralLink,
                      ),
                    );
                  } else {
                    return SizedBox.shrink();
                  }
                },
              ),
              SizedBox(height: 20),
              ReusableCustomContainer(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            'assets/images/icons/group.svg',
                            height: 30,
                            width: 30,
                          ),
                          SizedBox(width: 15),
                          BlocBuilder<ProfileCubit, ProfileState>(
                            builder: (context, state) {
                              if (state is ProfileCompositeState) {
                                return Text(
                                  '${state.userProfile!.data.profileCounters?.refereesCount}',
                                  style: TextStyle(
                                      color: AppColors.grayscale,
                                      fontSize: 38,
                                      fontWeight: FontWeight.w600),
                                );
                              } else {
                                return SizedBox.shrink();
                              }
                            },
                          ),
                        ],
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Affiliate Users / Downline  ',
                        style: TextStyle(
                            color: AppColors.grey,
                            fontSize: 14,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 40),
              GestureDetector(
                onTap: () {
                  router.push(
                    DownLinesRoute(),
                  );
                },
                child: Text(
                  'View All Downlines',
                  style: TextStyle(
                      color: AppColors.primaryDark,
                      fontSize: 16,
                      fontWeight: FontWeight.w300),
                ),
              ),
              SizedBox(height: 20),
              BlocBuilder<ProfileCubit, ProfileState>(
                builder: (context, state) {
                  if (state is ProfileCompositeState) {
                    return _buildDownlineList(
                        state.userProfile!.data.userDownlines);
                  } else {
                    return SizedBox.shrink();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDownlineList(List<UserDownlines>? downlines) {
    int itemCount = downlines!.length < 3 ? downlines.length : 3;
    double listHeight = itemCount * 70.0;

    return SizedBox(
      height: listHeight,
      child: ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        itemCount: itemCount,
        itemBuilder: (context, index) {
          final profile = downlines[index];
          return ListTile(
            contentPadding: EdgeInsets.symmetric(vertical: 4),
            leading: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(15.0),
                image: DecorationImage(
                  image: NetworkImage(profile.profilePhotoURL),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Your new referral signed up ${formatDate(profile.createdDate)}',
                  style: TextStyle(
                      color: AppColors.grayscale,
                      fontSize: 14,
                      fontWeight: FontWeight.w400),
                ),
                Text(
                  '@${profile.userName}',
                  style: TextStyle(
                      color: AppColors.grayscale,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
