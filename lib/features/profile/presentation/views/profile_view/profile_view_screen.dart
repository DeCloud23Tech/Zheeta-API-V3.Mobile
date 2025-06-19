import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zheeta/common/constants/color.dart';
import 'package:zheeta/common/mixins/scroll_listener_mixin.dart';
import 'package:zheeta/common/mixins/tabstate_mixin.dart';
import 'package:zheeta/core/injection/di.dart';
import 'package:zheeta/features/profile/data/model/user_profile_model.dart';
import 'package:zheeta/features/profile/data/model/view_profile_model.dart';
import 'package:zheeta/features/profile/presentation/bloc/profile_view_cubit/profile_view_cubit.dart';
import 'package:zheeta/features/profile/presentation/views/profile_view/profile_view_info_section.dart';
import 'package:zheeta/features/profile/presentation/widgets/carousel_slider.dart';
import 'package:zheeta/features/profile/presentation/widgets/profile_add_or_like.dart';
import 'package:zheeta/widgets/back_button.dart';
import 'package:zheeta/widgets/drawer.dart';
import 'package:zheeta/widgets/error_page.dart';
import 'package:zheeta/widgets/loader.dart';

@RoutePage()
class ProfileViewScreen extends StatefulWidget {
  final String profileId;
  final String? blockOrUnBlockId;
  final String? userId;

  const ProfileViewScreen(
      {super.key, required this.profileId, this.blockOrUnBlockId, this.userId});

  @override
  State<ProfileViewScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileViewScreen>
    with ScrollListenerMixin, TabStateMixin {
  ProfileViewCubit profileViewCubit = locator<ProfileViewCubit>();

  @override
  void initState() {
    super.initState();
    _loadProfileData();
  }

  void _loadProfileData() {
    context.read<ProfileViewCubit>().visitUserProfileCubit(widget.profileId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideDrawer(),
      body: BlocBuilder<ProfileViewCubit, ProfileViewState>(
        builder: (context, state) {
          if (state is ProfileViewLoading) {
            return loadingIndicator();
          } else if (state is ProfileViewLoadedState) {
            final theUser = state.profileData!.profile;
            final profileData = state.profileData!;
            return CustomScrollView(
              controller: scrollController,
              slivers: <Widget>[
                buildTopNavigation(theUser, profileData),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 100),
                    // Add bottom padding to ensure scrolling
                    child: BuildViewUserInfo(
                      theUser: theUser,
                      profileData: profileData,
                      profileId: widget.profileId,
                      blockOrUnBlockId: widget.blockOrUnBlockId,
                      userId: widget.userId,
                    ),
                  ),
                ),
              ],
            );
          } else if (state is ProfileViewErrorState) {
            return ErrorPage();
          } else {
            return SizedBox.shrink();
          }
        },
      ),
    );
  }

  Widget buildTopNavigation(
      UserProfileDataModel theUser, ViewProfileModel profileData) {
    return SliverAppBar(
      elevation: 0,
      centerTitle: true,
      backgroundColor: AppColors.secondaryLight,
      surfaceTintColor: AppColors.secondaryLight,
      scrolledUnderElevation: 0.5,
      shadowColor: Colors.grey,
      leadingWidth: MediaQuery.of(context).size.width * 0.4,
      leading: Row(
        children: [
          SizedBox(width: 16),
          CustomBackButton(
            greyBackground: true,
            isOpaque: true,
          ),
        ],
      ),
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
              updateCurrentIndex: updateCurrentIndex,
            ),
            Positioned(
              bottom: 65,
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
            ProfileAddOrLike(
              visitProfile: profileData,
            ),
          ],
        ),
      ),
    );
  }
}
