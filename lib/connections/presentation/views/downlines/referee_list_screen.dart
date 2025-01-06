import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:zheeta/app/common/color.dart';
import 'package:zheeta/app/router/app_router.gr.dart';
import 'package:zheeta/connections/presentation/widgets/link_text.dart';
import 'package:zheeta/connections/presentation/widgets/stepper_container.dart';
import 'package:zheeta/profile/data/model/user_profile_model.dart';
import 'package:zheeta/profile/presentation/bloc/profile_cubit/profile_cubit.dart';
import 'package:zheeta/widgets/reusable_container.dart';

@RoutePage()
class RefereeListScreen extends StatelessWidget {
  String formatDate(dynamic date) {
    if (date == null) return 'Unknown date';

    DateTime parsedDate;
    try {
      parsedDate = date is String ? DateTime.parse(date) : date as DateTime;
    } catch (e) {
      return 'Invalid date format';
    }

    String daySuffix(int day) {
      if (day >= 11 && day <= 13) return 'th';
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
      appBar: _buildAppBar(context),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
          child: ListView(
            children: [
              _buildTitleSection(),
              const SizedBox(height: 20),
              _buildHowItWorksSection(),
              const SizedBox(height: 20),
              _buildReferralLinkSection(),
              const SizedBox(height: 20),
              _buildAffiliateUserSection(),
              const SizedBox(height: 40),
              _buildViewAllDownlinesLink(context),
              const SizedBox(height: 10),
              _buildDownlineListSection(),
            ],
          ),
        ),
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.secondaryLight,
      elevation: 0.0,
      leading: GestureDetector(
        onTap: () => Navigator.of(context).pop(),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(100),
            ),
            child: const Icon(Icons.arrow_back_ios_new, color: AppColors.grey),
          ),
        ),
      ),
      title: const Text(
        'Referee List',
        style: TextStyle(
          color: AppColors.grayscale,
          fontSize: 24,
          fontWeight: FontWeight.w600,
        ),
      ),
      centerTitle: true,
    );
  }

  Widget _buildTitleSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          'Refer a friend',
          style: TextStyle(
            color: AppColors.grayscale,
            fontSize: 26,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 8),
        Text(
          'And you can earn Affiliate Commissions whenever they Earn or Subscribe',
          style: TextStyle(
            color: AppColors.grayscale,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }

  Widget _buildHowItWorksSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            SvgPicture.asset('assets/images/icons/info.svg'),
            const SizedBox(width: 15),
            const Text(
              'How it works',
              style: TextStyle(
                color: AppColors.primaryDark,
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        ..._buildSteps(),
      ],
    );
  }

  List<Widget> _buildSteps() {
    const steps = [
      {
        'text': '1',
        'title': 'Invite your friends',
        'subTitle': 'By sharing your link'
      },
      {
        'text': '2',
        'title': 'Then get paid',
        'subTitle': 'Whenever they subscribe or earn on Zheeta'
      },
      {
        'text': '3',
        'title': 'You make 10%',
        'subTitle': 'From every of their Transaction'
      },
    ];

    return List<Widget>.generate(
      steps.length,
      (index) => CircularTextContainer(
        text: steps[index]['text']!,
        title: steps[index]['title']!,
        subTitle: steps[index]['subTitle']!,
        showVerticalDivider: index != steps.length - 1,
      ),
    );
  }

  Widget _buildReferralLinkSection() {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        if (state is ProfileCompositeState && state.userProfile != null) {
          final referralLink =
              state.userProfile!.data?.referralInfo?.referralLink ??
                  'No referral link available';
          return ReusableCustomContainer(
            child: LinkText(linkText: referralLink),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }

  Widget _buildAffiliateUserSection() {
    return ReusableCustomContainer(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset('assets/images/icons/group.svg',
                    height: 30, width: 30),
                const SizedBox(width: 15),
                BlocBuilder<ProfileCubit, ProfileState>(
                  builder: (context, state) {
                    if (state is ProfileCompositeState &&
                        state.userProfile != null) {
                      final refereesCount = state.userProfile!.data
                              ?.profileCounters?.downlinesCount ??
                          0;
                      return Text(
                        '$refereesCount',
                        style: const TextStyle(
                          color: AppColors.grayscale,
                          fontSize: 38,
                          fontWeight: FontWeight.w600,
                        ),
                      );
                    }
                    return const SizedBox.shrink();
                  },
                ),
              ],
            ),
            const SizedBox(height: 8),
            const Text(
              'Affiliate Users / Downline',
              style: TextStyle(
                color: AppColors.grey,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildViewAllDownlinesLink(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        if (state is ProfileCompositeState && state.userProfile != null) {
          return GestureDetector(
            onTap: () => context.router.push(DownLinesRoute()),
            child: const Text(
              'View My Downlines',
              style: TextStyle(
                color: AppColors.primaryDark,
                fontSize: 16,
                fontWeight: FontWeight.w300,
              ),
            ),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }

  Widget _buildDownlineListSection() {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        if (state is ProfileCompositeState && state.userProfile != null) {
          final downlines = state.userProfile!.data?.userDownlines ?? [];
          return _buildDownlineList(downlines);
        }
        return const SizedBox.shrink();
      },
    );
  }

  Widget _buildDownlineList(List<UserDownlines> downlines) {
    final itemCount = downlines.length < 3 ? downlines.length : 3;

    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: itemCount,
      itemBuilder: (context, index) {
        final profile = downlines[index];
        return ListTile(
          contentPadding: const EdgeInsets.symmetric(vertical: 4),
          leading: Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(15.0),
              image: DecorationImage(
                image: NetworkImage(profile.profilePhotoURL!),
                fit: BoxFit.cover,
              ),
            ),
          ),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Your new referral signed up ${formatDate(profile.createdDate)}',
                style: const TextStyle(
                  color: AppColors.grayscale,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Text(
                '@${profile.userName}',
                style: const TextStyle(
                  color: AppColors.grayscale,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
