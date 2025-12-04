import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:zheeta/core/utils/extensions/date_time_extension.dart';
import 'package:zheeta/router/app_router.gr.dart';
import 'package:zheeta/core/constants/color.dart';
import 'package:zheeta/features/connections/presentation/widgets/link_text.dart';
import 'package:zheeta/features/connections/presentation/widgets/stepper_container.dart';
import 'package:zheeta/features/profile/data/models/user_profile_model.dart';
import 'package:zheeta/features/profile/presentation/cubits/profile_cubit/profile_cubit.dart';
import 'package:zheeta/shared/widgets/back_button.dart';
import 'package:zheeta/shared/widgets/reusable_container.dart';

@RoutePage()
class RefereeListScreen extends StatelessWidget {
  const RefereeListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textScale = MediaQuery.of(context).textScaleFactor;

    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        final profile =
            state is ProfileLoadedState ? state.profile?.data : null;
        final downlines = profile?.userDownlines ?? [];
        final referralLink =
            profile?.referralInfo?.referralLink ?? 'No referral link available';
        final downlinesCount = profile?.profileCounters?.downlinesCount ?? 0;

        return Scaffold(
          backgroundColor: AppColors.secondaryLight,
          appBar: _buildAppBar(),
          body: SafeArea(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              children: [
                _buildTitleSection(textScale),
                const SizedBox(height: 20),
                _buildHowItWorksSection(),
                const SizedBox(height: 20),
                ReusableCustomContainer(
                    child: LinkText(linkText: referralLink)),
                const SizedBox(height: 20),
                _buildAffiliateUserSection(downlinesCount),
                const SizedBox(height: 40),
                if (downlines.isNotEmpty) _buildViewAllDownlinesLink(context),
                const SizedBox(height: 10),
                _buildDownlineListSection(downlines, textScale),
              ],
            ),
          ),
        );
      },
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: AppColors.secondaryLight,
      elevation: 0,
      leading: AppBackButton(),
      title: const Text(
        'Direct downlines',
        style: TextStyle(
          color: AppColors.grayscale,
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
      ),
      centerTitle: true,
    );
  }

  Widget _buildTitleSection(double textScale) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Refer a friend',
          style: TextStyle(
            color: AppColors.grayscale,
            fontSize: 24 * textScale,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'And you can earn Affiliate Commissions whenever they Earn or Subscribe',
          style: TextStyle(
            color: AppColors.grayscale,
            fontSize: 16 * textScale,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }

  Widget _buildHowItWorksSection() {
    return ExpansionTile(
      childrenPadding: const EdgeInsets.all(16),
      backgroundColor: Colors.transparent,
      collapsedBackgroundColor: AppColors.secondaryLight,
      leading: SvgPicture.asset('assets/images/icons/info.svg'),
      title: const Text(
        'How it works',
        style: TextStyle(
          color: AppColors.primaryDark,
          fontSize: 16,
          fontWeight: FontWeight.w400,
        ),
      ),
      children: _buildSteps(),
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
        'subTitle': 'From every of their transactions'
      },
    ];

    return List.generate(
      steps.length,
      (index) => CircularTextContainer(
        text: steps[index]['text']!,
        title: steps[index]['title']!,
        subTitle: steps[index]['subTitle']!,
        showVerticalDivider: index != steps.length - 1,
      ),
    );
  }

  Widget _buildAffiliateUserSection(int downlinesCount) {
    return ReusableCustomContainer(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  'assets/images/icons/group.svg',
                  height: 30,
                  width: 30,
                ),
                const SizedBox(width: 15),
                Text(
                  '$downlinesCount',
                  style: const TextStyle(
                    color: AppColors.grayscale,
                    fontSize: 38,
                    fontWeight: FontWeight.w600,
                  ),
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
    return GestureDetector(
      onTap: () {
        context.router.push(DownlinesRoute());
      },
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

  Widget _buildDownlineListSection(
      List<UserDownlines> downlines, double textScale) {
    final displayCount = downlines.length < 3 ? downlines.length : 3;

    return Column(
      children: List.generate(displayCount, (index) {
        final profile = downlines[index];
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 4),
          child: ListTile(
            contentPadding: EdgeInsets.zero,
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.network(
                profile.profilePhotoURL ?? '',
                width: 50,
                height: 50,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => Container(
                  width: 50,
                  height: 50,
                  color: AppColors.secondaryLight,
                  child: const Icon(Icons.person, color: AppColors.grayscale),
                ),
              ),
            ),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Your new referral signed up ${profile.createdDate.toReadableDate()}',
                  style: TextStyle(
                    color: AppColors.grayscale,
                    fontSize: 14 * textScale,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  '@${profile.userName}',
                  style: TextStyle(
                    color: AppColors.grayscale,
                    fontSize: 16 * textScale,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
