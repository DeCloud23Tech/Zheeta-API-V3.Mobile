import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zheeta/core/constants/color.dart';
import 'package:zheeta/core/utils/notify.dart';
import 'package:zheeta/features/connections/presentation/cubits/friends_cubit/friends_cubit.dart';
import 'package:zheeta/features/profile/data/models/view_profile_model.dart';
import 'package:zheeta/shared/enums/type_of_request.dart';

class ProfileAddOrLike extends StatelessWidget {
  final ViewProfileModel? visitProfile;

  const ProfileAddOrLike({
    super.key,
    this.visitProfile,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FriendsCubit, FriendsState>(
      listener: (context, state) {
        if (state is FriendRequestSentSuccessState) {
          NotifyUser.showSnackBar('Friend request sent');
        } else if (state is FriendRequestProcessedSuccessState) {
          NotifyUser.showSnackBar('Friend request processed');
        } else if (state.errorMessage != null &&
            state.errorMessage!.isNotEmpty) {
          NotifyUser.showSnackBar(state.errorMessage!);
        }
      },
      builder: (context, state) {
        final isSending = state.isSendingFriendRequest;

        return Positioned(
          bottom: 10,
          left: 0,
          right: 0,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              children: [
                if (!visitProfile!.isFriend) ...[
                  SizedBox(width: 15),
                  Expanded(
                    child: InkWell(
                      onTap: isSending
                          ? null
                          : () {
                              context.read<FriendsCubit>().sendFriendRequestCubit(
                                receiverId: visitProfile!.profile.user!.userId!,
                                type: TypeOfRequest.friendRequest,
                              );
                            },
                      child: _buildButton(
                        context,
                        'assets/images/icons/add_friend.svg',
                        'Send Friend Request',
                        isLoading: isSending,
                      ),
                    ),
                  ),
                ],
                if (!visitProfile!.isFriend) ...[
                  // Expanded(
                  //   child: InkWell(
                  //     onTap: isSending
                  //         ? null
                  //         : () {
                  //             friendsCubit.sendFriendRequestCubit(
                  //               receiverId: visitProfile!.profile.user!.userId!,
                  //               type: TypeOfRequest.superLike,
                  //             );
                  //           },
                  //     child: _buildButton(
                  //       context,
                  //       'assets/images/icons/star.svg',
                  //       'Send Super-FR',
                  //       isLoading: isSending,
                  //     ),
                  //   ),
                  // ),
                  SizedBox(width: 15),
                ],
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildButton(BuildContext context, String? iconPath, String label,
      {bool isLoading = false}) {
    return Container(
      color: AppColors.primaryDark,
      height: 45,
      child: Center(
        child: isLoading
            ? SizedBox(
                height: 18,
                width: 18,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation<Color>(AppColors.white),
                ),
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (iconPath != null) SvgPicture.asset(iconPath),
                  if (iconPath != null) SizedBox(width: 10),
                  Text(
                    label,
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: AppColors.white,
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
