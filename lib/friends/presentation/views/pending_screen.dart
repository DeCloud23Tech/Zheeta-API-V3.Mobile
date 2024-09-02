import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zheeta/app/common/color.dart';
import 'package:zheeta/widgets/back_button.dart';
import 'package:zheeta/widgets/primary_button.dart';

import '../../../discover/presentation/widgets/pill_container.dart';
import '../../../widgets/loading_screen.dart';
import '../../data/model/get_pending_friends_model.dart';
import '../bloc/friends_cubit.dart';
import '../../data/request/friend_request_model.dart';

@RoutePage()
class PendingRequestScreen extends StatefulWidget {
  const PendingRequestScreen({super.key});

  @override
  State<PendingRequestScreen> createState() => _PendingRequestScreenState();
}

class _PendingRequestScreenState extends State<PendingRequestScreen> {
  @override
  void initState() {
    super.initState();
    context.read<FriendsCubit>().fetchFriendRequests();
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
        title: Column(
          children: [
            Text(
              'Pending requests',
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
      ),
      body: BlocConsumer<FriendsCubit, FriendsState>(
        listener: (context, state) {
          if (state is FriendRequestProcessed) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Friend request processed successfully')),
            );
          } else if (state is FriendRequestError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                  content: Text(
                      'Error processing friend request: ${state.message}')),
            );
          }
        },
        builder: (context, state) {
          if (state is FriendsLoading) {
            return LoadingScreen(
              backgroundColor: AppColors.secondaryLight,
              indicatorColor: AppColors.primaryDark,
            );
          } else if (state is FriendsError) {
            return Center(child: Text(state.message));
          } else if (state is FriendsPendingSuccess) {
            return buildFriendRequestsList(state.friends.data);
          } else {
            return SizedBox.shrink();
          }
        },
      ),
    );
  }

  Widget buildFriendRequestsList(List<FriendRequestModel> friendRequests) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(20),
      child: friendRequests.isEmpty
          ? Center(
              child: Text(
                'No pending friend requests',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: friendRequests
                  .map((friendRequest) => buildFriendRequestCard(friendRequest))
                  .toList(),
            ),
    );
  }

  Widget buildFriendRequestCard(FriendRequestModel friendRequest) {
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
                        icon: friendRequest.requesterGender == 'Male'
                            ? Icons.male
                            : Icons.female,
                      ),
                      SizedBox(width: 6),
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                        decoration: BoxDecoration(
                          color: friendRequest.requesterGender.toLowerCase() ==
                                  'male'
                              ? Colors.green
                              : AppColors.primaryDark,
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                        ),
                        child: Text(
                          friendRequest.requesterGender.substring(0, 1),
                          style: TextStyle(
                              color: AppColors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  SizedBox(
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.345,
                          height: 30,
                          child: PrimaryButton(
                            invert: true,
                            color: AppColors.secondaryLight,
                            title: "Reject",
                            action: () {
                              processFriendRequest(friendRequest, false);
                            },
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.345,
                          height: 30,
                          child: PrimaryButton(
                            title: "Accept",
                            action: () {
                              processFriendRequest(friendRequest, true);
                            },
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void processFriendRequest(FriendRequestModel friendRequest, bool accept) {
    final request = FriendRequest(
      requestId: friendRequest.id,
      state: accept,
    );
    // friendsCubit.processFriendRequest(request);
  }
}
