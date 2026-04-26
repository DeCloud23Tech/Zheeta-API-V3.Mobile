import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zheeta/core/constants/color.dart';
import 'package:zheeta/core/mixin/scroll_listener_mixin.dart';
import 'package:zheeta/core/mixin/tabstate_mixin.dart';
import 'package:zheeta/di/di.dart';
import 'package:zheeta/features/profile/data/models/user_profile_model.dart';
import 'package:zheeta/features/profile/presentation/cubits/profile_cubit/profile_cubit.dart';
import 'package:zheeta/features/profile/presentation/screens/profile/profile_info_section.dart';
import 'package:zheeta/features/profile/presentation/widgets/carousel_slider.dart';
import 'package:zheeta/shared/enums/icon_type_enum.dart';
import 'package:zheeta/shared/widgets/error_page.dart';
import 'package:zheeta/shared/widgets/top_nav.dart';

@RoutePage()
class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>
    with ScrollListenerMixin, TabStateMixin {
  final ProfileCubit profileCubit = locator<ProfileCubit>();

  Future<void> _refreshProfile() async {
    await profileCubit.getSingleUserProfileCubit(isRefresh: true);
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;

    return BlocConsumer<ProfileCubit, ProfileState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is ProfileLoadedState) {
          final theUser = state.profile?.data;
          if (theUser == null) return const SizedBox.shrink();

          return RefreshIndicator(
            color: AppColors.primaryDark,
            onRefresh: _refreshProfile,
            child: CustomScrollView(
              controller: scrollController,
              physics: const AlwaysScrollableScrollPhysics(),
              slivers: [
                buildTopNavigation(theUser, screenHeight),
                SliverToBoxAdapter(
                  child: BuildUserInfo(theUser: theUser),
                ),
              ],
            ),
          );
        } else {
          return ErrorPage(
            onTryAgain: () =>
                profileCubit.getSingleUserProfileCubit(isRefresh: true),
          );
        }
      },
    );
  }

  Widget buildTopNavigation(UserProfileDataModel theUser, double screenHeight) {
    return SliverAppBar(
      elevation: 0,
      backgroundColor: AppColors.secondaryLight,
      pinned: true,
      automaticallyImplyLeading: false,
      expandedHeight: screenHeight * 0.55,
      actions: [
        TopNavBtn(
          iconType: IconType.menu,
          color: AppColors.grayscale.withValues(alpha: 0.4),
        ),
        TopNavBtn(
          iconType: IconType.bell,
          color: AppColors.grayscale.withValues(alpha: 0.4),
        ),
        const SizedBox(width: 16),
      ],
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          fit: StackFit.expand,
          children: [
            // Carousel
            CarouselSliderWidget(
              theUser: theUser,
              updateCurrentIndex: (index) =>
                  setState(() => currentIndex = index),
            ),

            // Photo button at bottom-left
            Positioned(
              bottom: 65,
              left: 16,
              child: TopNavBtn(
                iconType: IconType.photo,
                color: AppColors.grayscale.withValues(alpha: 0.3),
              ),
            ),

            // Carousel indicators at bottom-center
            Positioned(
              bottom: 20,
              left: 0,
              right: 0,
              child: Center(
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.black.withValues(alpha: 0.3),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: List.generate(
                      theUser.userCarousels?.length ?? 0,
                      (index) => AnimatedContainer(
                        duration: const Duration(milliseconds: 250),
                        margin: const EdgeInsets.symmetric(horizontal: 3),
                        height: currentIndex == index ? 10 : 8,
                        width: currentIndex == index ? 10 : 8,
                        decoration: BoxDecoration(
                          color: currentIndex == index
                              ? AppColors.white
                              : AppColors.white.withValues(alpha: 0.5),
                          shape: BoxShape.circle, // keep circular
                        ),
                      ),
                    ),
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
