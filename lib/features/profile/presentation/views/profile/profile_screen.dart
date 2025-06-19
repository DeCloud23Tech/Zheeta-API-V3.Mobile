import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zheeta/common/constants/color.dart';
import 'package:zheeta/common/enums/others.dart';
import 'package:zheeta/common/mixins/scroll_listener_mixin.dart';
import 'package:zheeta/common/mixins/tabstate_mixin.dart';
import 'package:zheeta/core/injection/di.dart';
import 'package:zheeta/features/profile/data/model/user_profile_model.dart';
import 'package:zheeta/features/profile/presentation/bloc/profile_cubit/profile_cubit.dart';
import 'package:zheeta/features/profile/presentation/views/profile/profile_info_section.dart';
import 'package:zheeta/features/profile/presentation/widgets/carousel_slider.dart';
import 'package:zheeta/widgets/error_page.dart';
import 'package:zheeta/widgets/top_nav.dart';

@RoutePage()
class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>
    with ScrollListenerMixin, TabStateMixin {
  ProfileCubit profileCubit = locator<ProfileCubit>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileCubit, ProfileState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is ProfileLoadedState) {
          final theUser = state.profile?.data;
          return CustomScrollView(
            controller: scrollController, // From mixin
            slivers: [
              buildTopNavigation(theUser!),
              SliverToBoxAdapter(
                child: BuildUserInfo(theUser: theUser),
              ),
            ],
          );
        } else if (state is ProfileErrorState) {
          return ErrorPage(
            onTryAgain: () => profileCubit.getSingleUserProfileCubit(),
          );
        } else {
          return ErrorPage(
            onTryAgain: () => profileCubit.getSingleUserProfileCubit(),
          );
        }
      },
    );
  }

  Widget buildTopNavigation(UserProfileDataModel theUser) {
    return SliverAppBar(
      elevation: 0,
      centerTitle: true,
      backgroundColor: AppColors.secondaryLight,
      leading: null,
      scrolledUnderElevation: 0.5,
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TopNavBtn(
                iconType: IconType.menu,
                color: AppColors.grayscale.withOpacity(0.4)),
            TopNavBtn(
                iconType: IconType.bell,
                color: AppColors.grayscale.withOpacity(0.4)),
          ],
        ),
        const SizedBox(width: 16),
      ],
      automaticallyImplyLeading: false,
      pinned: true,
      expandedHeight: MediaQuery.of(context).size.height * 0.55,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        background: Stack(
          fit: StackFit.expand,
          alignment: AlignmentDirectional.center,
          children: [
            CarouselSliderWidget(
              theUser: theUser,
              updateCurrentIndex: updateCurrentIndex, // Using mixin method
            ),
            Positioned(
              bottom: 65,
              left: 10,
              child: TopNavBtn(
                  iconType: IconType.photo,
                  color: AppColors.grayscale.withOpacity(0.3)),
            ),
            Positioned(
              bottom: 30,
              child: Row(
                children: List.generate(
                  theUser.userCarousels!.length,
                  (index) => Padding(
                    padding: const EdgeInsets.all(3),
                    child: Container(
                      height: 10,
                      width: 10,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: currentIndex == index
                            ? AppColors.white
                            : AppColors.white.withOpacity(0.2),
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
