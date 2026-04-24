import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zheeta/core/constants/color.dart';
import 'package:zheeta/core/utils/notify.dart';
import 'package:zheeta/core/utils/pagination_controller.dart';
import 'package:zheeta/di/di.dart';
import 'package:zheeta/features/app/presentation/widgets/general_footer_nav.dart';
import 'package:zheeta/features/connections/data/requests/friend_request_model.dart';
import 'package:zheeta/features/connections/data/models/get_pending_friends_model.dart';
import 'package:zheeta/features/connections/presentation/cubits/friends_cubit/friends_cubit.dart';
import 'package:zheeta/features/connections/presentation/cubits/pending_friends_cubit/pending_friends_cubit.dart';
import 'package:zheeta/shared/widgets/back_button.dart';
import 'package:zheeta/shared/widgets/gender_indicator.dart';
import 'package:zheeta/shared/widgets/loader.dart';
import 'package:zheeta/shared/widgets/pill_container.dart';
import 'package:zheeta/shared/widgets/primary_button.dart';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zheeta/core/constants/color.dart';
import 'package:zheeta/core/utils/notify.dart';
import 'package:zheeta/core/utils/pagination_controller.dart';
import 'package:zheeta/di/di.dart';
import 'package:zheeta/features/connections/data/requests/friend_request_model.dart';
import 'package:zheeta/features/connections/data/models/get_pending_friends_model.dart';
import 'package:zheeta/features/connections/presentation/cubits/friends_cubit/friends_cubit.dart';
import 'package:zheeta/features/connections/presentation/cubits/pending_friends_cubit/pending_friends_cubit.dart';
import 'package:zheeta/shared/widgets/back_button.dart';
import 'package:zheeta/shared/widgets/pill_container.dart';
import 'package:zheeta/shared/widgets/loader.dart';
import 'package:zheeta/shared/widgets/primary_button.dart';

@RoutePage()
class FriendRequestsScreen extends StatefulWidget {
  const FriendRequestsScreen({super.key});

  @override
  State<FriendRequestsScreen> createState() => _FriendRequestsScreenState();
}

class _FriendRequestsScreenState extends State<FriendRequestsScreen> {
  final ScrollController _scrollController = ScrollController();
  late PendingFriendsCubit pendingFriendsCubit;
  late FriendsCubit friendsCubit;

  @override
  void initState() {
    super.initState();
    pendingFriendsCubit = locator<PendingFriendsCubit>();
    friendsCubit = locator<FriendsCubit>();

    // Load first page
    pendingFriendsCubit.loadNextPage();

    // Add scroll listener for pagination
    _scrollController.addListener(_scrollListener);
  }

  void _scrollListener() {
    if (_isBottom &&
        !pendingFriendsCubit.state.isLoading &&
        pendingFriendsCubit.state.hasMore) {
      pendingFriendsCubit.loadNextPage();
    }
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;
    return currentScroll >= maxScroll * 0.9;
  }

  void processFriendRequest(FriendRequestModel friendRequest, bool accept) {
    final request = FriendRequest(
      requestId: friendRequest.id,
      state: accept,
    );
    friendsCubit.processFriendRequestsCubit(request);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    pendingFriendsCubit.close();
    friendsCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        // Listen to FriendsCubit for friend request success/error
        BlocListener<FriendsCubit, FriendsState>(
          bloc: friendsCubit,
          listener: (context, state) {
            if (state is FriendRequestProcessedSuccessState) {
              NotifyUser.showSnackBar("Friend request processed!");
              pendingFriendsCubit.refreshPendingFriends(); // refresh list
            } else if (state.errorMessage != null) {
              NotifyUser.showSnackBar(state.errorMessage!);
            }
          },
        ),
      ],
      child: Scaffold(
        backgroundColor: AppColors.secondaryLight,
        extendBody: true,
        bottomNavigationBar: buildGeneralFooterNav(context),
        appBar: AppBar(
          backgroundColor: AppColors.secondaryLight,
          elevation: 0,
          leading: AppBackButton(),
          title: Column(
            children: [
              Text(
                'Pending request',
                style: TextStyle(
                    color: AppColors.grayscale,
                    fontSize: 18,
                    fontWeight: FontWeight.w600),
              ),
              Text(
                'Users waiting to be friend',
                style: TextStyle(
                    color: AppColors.grey,
                    fontSize: 12,
                    fontWeight: FontWeight.w400),
              ),
            ],
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: BlocBuilder<PendingFriendsCubit,
              PaginationState<FriendRequestModel>>(
            bloc: pendingFriendsCubit,
            builder: (context, state) {
              if (state.isLoading && state.items.isEmpty) {
                return Center(child: loadingIndicator());
              }

              if (state.items.isEmpty) {
                return Center(
                  child: Text(
                    'No friend requests found.',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: AppColors.primaryDark,
                    ),
                  ),
                );
              }

              return ListView.builder(
                controller: _scrollController,
                itemCount: state.items.length + (state.hasMore ? 1 : 0),
                itemBuilder: (context, index) {
                  if (index == state.items.length) {
                    return state.hasMore
                        ? loadingIndicator()
                        : const SizedBox.shrink();
                  }

                  final friendRequest = state.items[index];
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: Container(
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.network(
                                friendRequest.requesterProfilePicture,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "@${friendRequest.requesterUserName}",
                                  style: TextStyle(
                                      color: AppColors.grey,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      friendRequest.requesterName,
                                      style: TextStyle(
                                          color: AppColors.grayscale,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    SizedBox(width: 10),
                                    PillContainer(
                                      text: '${friendRequest.requesterAge}',
                                      backgroundColor: AppColors.primaryDark,
                                      textColor: AppColors.white,
                                      iconColor: AppColors.white,
                                      hasGradient: true,
                                      icon: friendRequest.requesterGender ==
                                              'Male'
                                          ? Icons.male
                                          : Icons.female,
                                    ),
                                  ],
                                ),
                                SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.3,
                                      height: 28,
                                      child: PrimaryButton(
                                        invert: true,
                                        title: "Reject",
                                        action: () => processFriendRequest(
                                            friendRequest, false),
                                      ),
                                    ),
                                    SizedBox(width: 10),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.3,
                                      height: 28,
                                      child: PrimaryButton(
                                        title: "Accept",
                                        action: () => processFriendRequest(
                                            friendRequest, true),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
