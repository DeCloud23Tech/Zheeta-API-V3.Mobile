import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zheeta/core/constants/color.dart';
import 'package:zheeta/core/mixin/scroll_listener_mixin.dart';
import 'package:zheeta/core/mixin/tabstate_mixin.dart';
import 'package:zheeta/di/di.dart';
import 'package:zheeta/features/connections/presentation/cubits/block_account_cubit/block_account_cubit.dart';
import 'package:zheeta/features/profile/data/models/user_profile_model.dart';
import 'package:zheeta/features/profile/data/models/view_profile_model.dart';
import 'package:zheeta/features/profile/presentation/cubits/profile_view_cubit/profile_view_cubit.dart';
import 'package:zheeta/features/profile/presentation/screens/profile_view/profile_view_info_section.dart';
import 'package:zheeta/features/profile/presentation/widgets/carousel_slider.dart';
import 'package:zheeta/features/profile/presentation/widgets/profile_add_or_like.dart';
import 'package:zheeta/shared/widgets/back_button.dart';
import 'package:zheeta/shared/widgets/drawer.dart';
import 'package:zheeta/shared/widgets/error_page.dart';
import 'package:zheeta/shared/widgets/loader.dart';

@RoutePage()
class ProfileViewScreen extends StatefulWidget {
  final String profileId;
  final String? blockOrUnBlockId;
  final String? userId;

  const ProfileViewScreen({
    super.key,
    required this.profileId,
    this.blockOrUnBlockId,
    this.userId,
  });

  @override
  State<ProfileViewScreen> createState() => _ProfileViewScreenState();
}

class _ProfileViewScreenState extends State<ProfileViewScreen>
    with ScrollListenerMixin, TabStateMixin {
  final ProfileViewCubit profileViewCubit = locator<ProfileViewCubit>();
  final BlockAccountCubit blockAccountCubit = locator<BlockAccountCubit>();

  @override
  void initState() {
    super.initState();
    _loadProfileData();
  }

  void _loadProfileData() {
    profileViewCubit.visitUserProfileCubit(widget.profileId);
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.secondaryLight,
        leading: AppBackButton(),
      ),
      body: BlocBuilder<ProfileViewCubit, ProfileViewState>(
        builder: (context, state) {
          if (state is ProfileViewLoading) {
            return loadingIndicator();
          } else if (state is ProfileViewLoadedState) {
            final theUser = state.profileData!.profile;
            final profileData = state.profileData!;
            return CustomScrollView(
              controller: scrollController,
              slivers: [
                _buildSliverAppBar(theUser, profileData, screenHeight),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 100),
                    child: BlocListener<BlockAccountCubit, BlockAccountState>(
                      listener: (context, state) {
                        if (state.status == BlockStatus.loading) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text("Blocking user...")),
                          );
                        } else if (state.status == BlockStatus.success) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                                content: Text(state.message ?? "User blocked")),
                          );
                        } else if (state.status == BlockStatus.failure) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                                content: Text(
                                    state.message ?? "Failed to block user")),
                          );
                        }
                      },
                      child: BuildViewUserInfo(
                        theUser: theUser,
                        profileData: profileData,
                        profileId: widget.profileId,
                        blockOrUnBlockId: widget.blockOrUnBlockId,
                        userId: widget.userId,
                      ),
                    ),
                  ),
                ),
              ],
            );
          } else if (state is ProfileViewErrorState) {
            return ErrorPage(
              onTryAgain: _loadProfileData,
            );
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }

  Widget _buildSliverAppBar(UserProfileDataModel theUser,
      ViewProfileModel profileData, double screenHeight) {
    return SliverAppBar(
      elevation: 0,
      backgroundColor: AppColors.secondaryLight,
      pinned: true,
      expandedHeight: screenHeight * 0.55,
      automaticallyImplyLeading: false,
      actions: [
        // Optional: Add menu or notifications here
      ],
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          fit: StackFit.expand,
          children: [
            // Carousel images
            CarouselSliderWidget(
              theUser: theUser,
              updateCurrentIndex: (index) =>
                  setState(() => currentIndex = index),
            ),

            // Carousel indicators at bottom-center
            Positioned(
              bottom: 70,
              left: 0,
              right: 0,
              child: Center(
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.3),
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
                              : AppColors.white.withOpacity(0.5),
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),

            // Like/Add buttons overlay
            ProfileAddOrLike(visitProfile: profileData),
          ],
        ),
      ),
    );
  }
}
