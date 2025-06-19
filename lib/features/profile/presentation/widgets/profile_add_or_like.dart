import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zheeta/common/constants/color.dart';
import 'package:zheeta/common/enums/type_of_request.dart';
import 'package:zheeta/common/notify/notify_user.dart';
import 'package:zheeta/core/injection/di.dart';
import 'package:zheeta/features/connections/presentation/bloc/friends_cubit/friends_cubit.dart';
import 'package:zheeta/features/profile/data/model/view_profile_model.dart';

class ProfileAddOrLike extends StatelessWidget {
  final ViewProfileModel? visitProfile;

  const ProfileAddOrLike({
    super.key,
    this.visitProfile,
  });

  @override
  Widget build(BuildContext context) {
    final FriendsCubit friendsCubit = locator<FriendsCubit>();

    return BlocConsumer<FriendsCubit, FriendsState>(listener: (context, state) {
      if (state is SendFriendRequestError) {
        NotifyUser.showSnackBar(state.message);
      } else if (state is SendFriendRequestSuccess) {
        NotifyUser.showSnackBar('Friend Request Sent');
      }
    }, builder: (context, state) {
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
                    onTap: () {
                      friendsCubit.sendFriendRequestCubit(
                        receiverId: visitProfile?.profile.user?.userId,
                        type: TypeOfRequest.friendRequest,
                      );
                    },
                    child: _buildButton(
                      context,
                      'assets/images/icons/add_friend.svg',
                      'Send-FR',
                    ),
                  ),
                ),
              ],
              SizedBox(width: 4),
              if (!visitProfile!.isFriend) ...[
                Expanded(
                  child: InkWell(
                    onTap: () {
                      friendsCubit.sendFriendRequestCubit(
                        receiverId: visitProfile?.profile.user?.userId,
                        type: TypeOfRequest.superLike,
                      );
                    },
                    child: _buildButton(
                      context,
                      'assets/images/icons/star.svg',
                      'Send Super-FR',
                    ),
                  ),
                ),
                SizedBox(width: 15),
              ],
              // if (visitProfile?.isFriend ?? false) ...[
              //   SizedBox(width: 15),
              //   Expanded(
              //     child: _buildButton(
              //       context,
              //       null,
              //       'Unfriend',
              //     ),
              //   ),
              // ],
              SizedBox(width: 4),
              // if (visitProfile!.canMessage && visitProfile!.isFriend) ...[
              //   Expanded(
              //     child: _buildButton(
              //       context,
              //       'assets/images/icons/chat_user.svg',
              //       'Chat User',
              //     ),
              //   ),
              //   SizedBox(width: 15),
              // ],
            ],
          ),
        ),
      );
    });
  }

  Widget _buildButton(BuildContext context, String? iconPath, String label) {
    return Container(
      color: AppColors.primaryDark,
      height: 45,
      child: Row(
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
    );
  }
}
