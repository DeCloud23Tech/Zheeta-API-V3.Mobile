import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:zheeta/app/common/color.dart';
import 'package:zheeta/app/injection/di.dart';
import 'package:zheeta/profile/presentation/bloc/profile_cubit/profile_cubit.dart';
import 'package:zheeta/widgets/back_button.dart';

import '../../../app/common/param/pagination_param.dart';
import '../../../app/router/app_router.gr.dart';
import '../../../profile/data/model/blocked_user_model.dart';
import '../../../widgets/loading_screen.dart';
import '../../../widgets/primary_button.dart';
import '../../data/model/all_friends_model.dart';
import '../bloc/friends_cubit.dart';

@RoutePage()
class FriendScreen extends StatefulWidget {
  const FriendScreen({super.key});

  @override
  State<FriendScreen> createState() => _FriendScreenState();
}

class _FriendScreenState extends State<FriendScreen> {
  int activeTab = 1;
  FriendsCubit friendsCubit = locator<FriendsCubit>();
  ProfileCubit profileCubit = locator<ProfileCubit>();

  @override
  void initState() {
    super.initState();
    friendsCubit.fetchFriends();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondaryLight,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: AppColors.secondaryLight,
        surfaceTintColor: AppColors.secondaryLight,
        scrolledUnderElevation: 0.5,
        shadowColor: Colors.grey,
        leadingWidth: MediaQuery.of(context).size.width * 0.2,
        leading: Row(
          children: [
            AppBackButton(),
          ],
        ),
        title: Text(
          'Friends',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
        actions: [
          SvgPicture.asset('assets/images/icons/search.svg'),
          SizedBox(width: 16),
        ],
      ),
      body: Column(
        children: [
          _buildTabBar(),
          Expanded(child: _buildTabContent()),
        ],
      ),
    );
  }

  Widget _buildTabBar() {
    return Container(
      height: 40,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: AppColors.white,
        border: Border(),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildTabButton(1, "My Friends"),
          _buildTabButton(2, "Blocked Users"),
        ],
      ),
    );
  }

  Widget _buildTabButton(int tabIndex, String text) {
    return GestureDetector(
      onTap: () {
        setState(() {
          activeTab = tabIndex;
        });
        if (activeTab == 2) {
          profileCubit
              .getBlockedUsersCubit(PaginationParam(pageNo: 1, pageSize: 10));
        }
      },
      child: Container(
        color: Colors.transparent,
        child: Column(
          children: [
            Container(
              height: 3,
              width: MediaQuery.of(context).size.width * 0.44,
              decoration: BoxDecoration(
                color: activeTab == tabIndex
                    ? AppColors.primaryDark
                    : Colors.transparent,
                border: Border(),
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            SizedBox(height: 5),
            Text(
              text,
              style: TextStyle(
                color: activeTab == tabIndex
                    ? AppColors.grayscale
                    : AppColors.grey,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTabContent() {
    if (activeTab == 1) {
      return BlocBuilder<FriendsCubit, FriendsState>(
        builder: (context, state) {
          if (state is FriendsLoading) {
            return LoadingScreen(
              backgroundColor: AppColors.secondaryLight,
              indicatorColor: AppColors.primaryDark,
            );
          } else if (state is FriendsSuccess) {
            return _buildFriendsList(state.friends);
          } else {
            return SizedBox.shrink();
          }
        },
      );
    } else if (activeTab == 2) {
      return BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) {
          if (state is ProfileLoadingCompositeState) {
            return LoadingScreen(
              backgroundColor: AppColors.secondaryLight,
              indicatorColor: AppColors.primaryDark,
            );
          } else if (state is ProfileCompositeState) {
            if (state.allBlockedUsers == null ||
                state.allBlockedUsers!.data.isEmpty) {
              return Center(child: Text('No blocked users found'));
            }
            return _buildBlockedUsersList(state.allBlockedUsers!);
          } else {
            return SizedBox.shrink();
          }
        },
      );
    }
    return activeTab == 1
        ? Center(child: Text('No friends found'))
        : Center(child: Text('No blocked users found'));
  }

  Widget _buildFriendsList(FriendsListModel friends) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: friends.data.map((friend) {
          return Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(15.0),
                            image: DecorationImage(
                              image: NetworkImage(friend.friendProfilePicture),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(width: 8),
                        Text(
                          '@${friend.friendUsername}',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: AppColors.primaryDark),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Visibility(
                        visible: !friend.friendBlockStatus,
                        child: SizedBox(
                          height: 28,
                          child: PrimaryButton(
                            invert: true,
                            showBorder: true,
                            fontSize: 11.5,
                            color: AppColors.secondaryLight,
                            title: 'Block',
                            action: () {
                              profileCubit.blockAccountCubit(
                                  blockOrUnBlockId: friend.friendId,
                                  userId: friend.userAId);
                            },
                          ),
                        ),
                      ),
                      SizedBox(width: 8),
                      SizedBox(
                        height: 28,
                        child: PrimaryButton(
                          title: 'View Profile',
                          fontSize: 11.5,
                          action: () {
                            context.router.push(
                                ProfileViewRoute(profileId: friend.friendId));
                          },
                        ),
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(height: 10),
            ],
          );
        }).toList(),
      ),
    );
  }

  Widget _buildBlockedUsersList(BlockedUsersResponse? blockedUsers) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: blockedUsers!.data.map((blockedUser) {
          return Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(15.0),
                          image: DecorationImage(
                            image: NetworkImage(blockedUser.profilePhotoURL),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(width: 8),
                      Text(
                        '${blockedUser.fullName}',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: AppColors.primaryDark),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 30,
                child: PrimaryButton(
                  title: 'Unblock',
                  fontSize: 14,
                  action: () {
                    // TODO: get the user Id
                    profileCubit.unBlockAccountCubit(
                        blockOrUnBlockId: blockedUser.blockedUserId,
                        userId: 'c4eb5953-6250-41c1-9e17-b46342ae1229');
                  },
                ),
              ),
              SizedBox(height: 10),
            ],
          );
        }).toList(),
      ),
    );
  }
}
