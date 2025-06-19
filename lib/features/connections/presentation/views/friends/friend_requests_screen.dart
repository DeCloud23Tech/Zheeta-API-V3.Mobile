import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zheeta/common/constants/color.dart';
import 'package:zheeta/common/notify/notify_user.dart';
import 'package:zheeta/core/injection/di.dart';
import 'package:zheeta/features/connections/data/model/get_pending_friends_model.dart';
import 'package:zheeta/features/connections/data/request/friend_request_model.dart';
import 'package:zheeta/features/connections/presentation/bloc/friends_cubit/friends_cubit.dart';
import 'package:zheeta/utils/pagination_controller.dart';
import 'package:zheeta/widgets/back_button.dart';
import 'package:zheeta/widgets/gender_indicator.dart';
import 'package:zheeta/widgets/loader.dart';
import 'package:zheeta/widgets/pill_container.dart';
import 'package:zheeta/widgets/primary_button.dart';

@RoutePage()
class FriendRequestsScreen extends StatefulWidget {
  const FriendRequestsScreen({super.key});

  @override
  State<FriendRequestsScreen> createState() => _FriendRequestsScreenState();
}

class _FriendRequestsScreenState extends State<FriendRequestsScreen> {
  late PaginatedListController<FriendRequestModel, FriendsCubit, FriendsState>
      _friendsPaginatedController;

  final ScrollController _scrollController = ScrollController();
  FriendsCubit friendCubit = locator<FriendsCubit>();

  @override
  void initState() {
    super.initState();

    // Initialize paginated controller
    _friendsPaginatedController =
        PaginatedListController<FriendRequestModel, FriendsCubit, FriendsState>(
      fetchItems: (param) => friendCubit.fetchFriendRequestsCubit(param),
      cubit: friendCubit,
    );

    // Add scroll listener to load more items when reaching the bottom
    _scrollController.addListener(_scrollListener);

    // Load the initial page of friend request
    _loadFriendRequestsPage();
  }

  void _loadFriendRequestsPage() {
    // Load the next page of friend request
    _friendsPaginatedController.loadNextPage(
      successCondition: (state) => state is FriendsPendingSuccess,
      extractItems: (state) =>
          (state as FriendsPendingSuccess).friendRequests.data,
      isError: (state) => state is FriendsError,
    );
  }

  void _scrollListener() {
    if (_isBottom) {
      _loadFriendRequestsPage();
    }
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;
    return currentScroll >=
        (maxScroll * 0.9); // Trigger loading when 90% scrolled
  }

  void processFriendRequest(FriendRequestModel friendRequest, bool accept) {
    final request = FriendRequest(
      requestId: friendRequest.id,
      state: accept,
    );
    friendCubit.processFriendRequestsCubit(request);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<FriendsCubit, FriendsState>(
      listener: (context, state) {
        if (state is FriendRequestProcessed) {
          NotifyUser.showSnackBar("Friend request processed successfully!");
          // Refresh the friend requests list after processing
          _friendsPaginatedController.reset();
          _loadFriendRequestsPage();
        } else if (state is FriendRequestError) {
          NotifyUser.showSnackBar(state.message);
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.secondaryLight,
        appBar: AppBar(
          backgroundColor: AppColors.secondaryLight,
          elevation: 0.0,
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
          child: BlocBuilder<FriendsCubit, FriendsState>(
            builder: (context, state) {
              // Check if friend request are loading and if the list is empty
              if (state is FriendsLoading &&
                  _friendsPaginatedController.items.isEmpty) {
                return loadingIndicator();
              } else if (state is FriendsPendingSuccess &&
                  _friendsPaginatedController.items.isEmpty) {
                return Center(
                  child: Text(
                    'No friend request found.',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: AppColors.primaryDark,
                    ),
                  ),
                );
              }

              return ListView.builder(

                shrinkWrap: true,
                physics: AlwaysScrollableScrollPhysics(),
                controller: _scrollController,
                itemCount: _friendsPaginatedController.items.length + 1,
                itemBuilder: (context, index) {
                  if (index == _friendsPaginatedController.items.length) {
                    return _friendsPaginatedController.hasMoreItems &&
                            (_friendsPaginatedController.items.length >=
                                _friendsPaginatedController.pageSize)
                        ? loadingIndicator()
                        : const SizedBox.shrink();
                  }

                  // Render each friend request item
                  final friendRequest =
                      _friendsPaginatedController.items[index];
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
                            padding: EdgeInsets.all(1),
                            decoration: BoxDecoration(
                              color: AppColors.white,
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
                                    SizedBox(width: 6),
                                    GenderIndicator(
                                        gender: friendRequest.requesterGender ==
                                                'Male'
                                            ? 'M'
                                            : 'F'),
                                  ],
                                ),
                                SizedBox(height: 10),
                                BlocBuilder<FriendsCubit, FriendsState>(
                                  builder: (context, state) {
                                    return SizedBox(
                                      width: double.infinity,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.3,
                                            height: 28,
                                            child: PrimaryButton(
                                              invert: true,
                                              color: AppColors.secondaryLight,
                                              state: state is SendFriendRequestProcessing,
                                              title: "Reject",
                                              fontSize: 14,
                                              action: () {
                                                processFriendRequest(
                                                    friendRequest, false);
                                              },
                                            ),
                                          ),
                                          SizedBox(width: 10),
                                          SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.3,
                                            height: 28,
                                            child: PrimaryButton(
                                              title: "Accept",
                                              fontSize: 14,
                                              action: () {
                                                processFriendRequest(
                                                    friendRequest, true);
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
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
