import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zheeta/core/constants/color.dart';
import 'package:zheeta/core/utils/pagination_controller.dart';
import 'package:zheeta/core/utils/token_utils.dart';
import 'package:zheeta/di/di.dart';
import 'package:zheeta/features/connections/data/models/all_friends_model.dart';
import 'package:zheeta/features/connections/presentation/cubits/all_friends_cubit/all_friends_cubit.dart';
import 'package:zheeta/features/connections/presentation/cubits/block_account_cubit/block_account_cubit.dart';
import 'package:zheeta/features/connections/presentation/cubits/blocked_users_cubit/blocked_users_cubit.dart';
import 'package:zheeta/features/profile/data/models/blocked_user_model.dart';
import 'package:zheeta/features/profile/presentation/cubits/profile_cubit/profile_cubit.dart';
import 'package:zheeta/router/app_router.gr.dart';
import 'package:zheeta/shared/widgets/back_button.dart';
import 'package:zheeta/shared/widgets/loader.dart';
import 'package:zheeta/shared/widgets/primary_button.dart';

@RoutePage()
class FriendScreen extends StatefulWidget {
  const FriendScreen({super.key});

  @override
  State<FriendScreen> createState() => _FriendScreenState();
}

class _FriendScreenState extends State<FriendScreen> {
  late AllFriendsCubit _friendsCubit;
  late BlockedUsersCubit _blockedUsersCubit;
  late BlockAccountCubit _blockAccountCubit;

  final ScrollController _friendsScrollController = ScrollController();
  final ScrollController _blockedUsersScrollController = ScrollController();

  int activeTab = 1;

  @override
  void initState() {
    super.initState();
    _friendsCubit = locator<AllFriendsCubit>();
    _blockedUsersCubit = locator<BlockedUsersCubit>();
    _blockAccountCubit = locator<BlockAccountCubit>();

    _friendsCubit.reset();
    _blockedUsersCubit.reset();

    _friendsScrollController.addListener(() {
      if (_isFriendsBottom) _friendsCubit.loadNextPage();
    });

    _blockedUsersScrollController.addListener(() {
      if (_isBlockedUsersBottom) _blockedUsersCubit.loadNextPage();
    });
  }

  bool get _isFriendsBottom {
    if (!_friendsScrollController.hasClients) return false;
    final maxScroll = _friendsScrollController.position.maxScrollExtent;
    final currentScroll = _friendsScrollController.position.pixels;
    return currentScroll >= (maxScroll * 0.9);
  }

  bool get _isBlockedUsersBottom {
    if (!_blockedUsersScrollController.hasClients) return false;
    final maxScroll = _blockedUsersScrollController.position.maxScrollExtent;
    final currentScroll = _blockedUsersScrollController.position.pixels;
    return currentScroll >= (maxScroll * 0.9);
  }

  @override
  void dispose() {
    _friendsScrollController.dispose();
    _blockedUsersScrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<BlockAccountCubit, BlockAccountState>(
      bloc: _blockAccountCubit,
      listener: (context, state) {
        if (state.status == BlockStatus.success) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message ?? "Action successful")),
          );
          // 🔄 refresh lists after block/unblock
          _friendsCubit.refreshFriends();
          _blockedUsersCubit.refreshBlockedUsers();
        } else if (state.status == BlockStatus.failure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message ?? "Something went wrong")),
          );
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.secondaryLight,
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          backgroundColor: AppColors.secondaryLight,
          leading: AppBackButton(),
          title: Text(
            'Friends',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              _buildTabBar(),
              SizedBox(height: 10),
              Expanded(child: _buildTabContent()),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTabBar() {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        color: AppColors.white,
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
    return activeTab == 1 ? _buildFriendsList() : _buildBlockedUsersList();
  }

  Widget _buildFriendsList() {
    return BlocBuilder<AllFriendsCubit, PaginationState<FriendModel>>(
      bloc: _friendsCubit,
      builder: (context, state) {
        if (state.isLoading && state.items.isEmpty) {
          return loadingIndicator();
        } else if (state.items.isEmpty) {
          return Center(child: Text('No friends found.'));
        }

        return ListView.builder(
          controller: _friendsScrollController,
          itemCount:
              state.hasMore ? state.items.length + 1 : state.items.length,
          itemBuilder: (context, index) {
            if (index >= state.items.length) {
              return state.hasMore ? loadingIndicator() : SizedBox.shrink();
            }

            final friend = state.items[index];
            return _buildFriendItem(friend);
          },
        );
      },
    );
  }

  Widget _buildBlockedUsersList() {
    return BlocBuilder<BlockedUsersCubit, PaginationState<BlockedUser>>(
      bloc: _blockedUsersCubit,
      builder: (context, state) {
        if (state.isLoading && state.items.isEmpty) {
          return loadingIndicator();
        } else if (state.items.isEmpty) {
          return Center(child: Text('No blocked users found.'));
        }

        return ListView.builder(
          controller: _blockedUsersScrollController,
          itemCount:
              state.hasMore ? state.items.length + 1 : state.items.length,
          itemBuilder: (context, index) {
            if (index >= state.items.length) {
              return state.hasMore ? loadingIndicator() : SizedBox.shrink();
            }

            final blockedUser = state.items[index];
            return _buildBlockedUserItem(blockedUser);
          },
        );
      },
    );
  }

  Widget _buildFriendItem(FriendModel friend) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 25,
                backgroundImage: NetworkImage(friend.friendProfilePicture),
              ),
              SizedBox(width: 10),
              ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width * 0.25,
                ),
                child: Text(
                  '@${friend.friendUsername}',
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          Row(
            children: [
              if (!friend.friendBlockStatus)
                SizedBox(
                  height: 28,
                  child: PrimaryButton(
                    invert: true,
                    showBorder: true,
                    fontSize: 11.5,
                    title: 'Block',
                    action: () {
                      _blockAccountCubit.blockUser(
                        friend.userId,
                        friend.friendId,
                      );
                    },
                  ),
                ),
              SizedBox(width: 8),
              // subtitle: Text('${user.isFullyVerified ?? 'N/A'}'),

              SizedBox(
                height: 28,
                child: PrimaryButton(
                  title: 'View Profile',
                  fontSize: 11.5,
                  action: () {
                    context.router.push(
                      ProfileViewRoute(
                        profileId: friend.friendId,
                        blockOrUnBlockId: friend.friendId,
                        userId: friend.userId,
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildBlockedUserItem(BlockedUser blockedUser) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 25,
                backgroundImage: NetworkImage(blockedUser.profilePhotoURL),
              ),
              SizedBox(width: 10),
              Text(blockedUser.fullName),
            ],
          ),
          SizedBox(
            height: 28,
            child: PrimaryButton(
              title: 'Unblock',
              action: () async {
                final userId = await TokenUtil.getUserId();
                if (userId != null) {
                  _blockAccountCubit.unblockUser(
                    userId,
                    blockedUser.blockedUserId,
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
