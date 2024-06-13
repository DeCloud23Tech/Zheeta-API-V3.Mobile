import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../app/common/color.dart';
import '../../data/model/view_profile_model.dart';

class ProfileAddOrLike extends StatelessWidget {
  final ViewProfileModel? visitProfile;

  ProfileAddOrLike({
    super.key,
    this.visitProfile,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 10,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          if (visitProfile!.data.canAddFriend)
            Container(
              color: AppColors.primaryDark,
              height: 50,
              width: MediaQuery.of(context).size.width * 0.4,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset('assets/images/icons/add_friend.svg'),
                  SizedBox(width: 10),
                  Text(
                    'Add Friend',
                    style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: AppColors.white),
                  ),
                ],
              ),
            ),
          if (visitProfile!.data.canAddFriend) SizedBox(width: 8),
          if (visitProfile!.data.canAddFriend)
            Container(
              color: AppColors.primaryDark,
              height: 50,
              width: MediaQuery.of(context).size.width * 0.4,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset('assets/images/icons/star.svg'),
                  SizedBox(width: 10),
                  Text(
                    'Super-FR',
                    style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: AppColors.white),
                  ),
                ],
              ),
            ),
          if (visitProfile!.data.isFriend)
            Container(
              color: AppColors.primaryDark,
              height: 50,
              width: MediaQuery.of(context).size.width * 0.4,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //SvgPicture.asset('assets/images/icons/add_friend.svg'),
                  SizedBox(width: 10),
                  Text(
                    'Unfriend',
                    style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: AppColors.white),
                  ),
                ],
              ),
            ),
          if (visitProfile!.data.isFriend) SizedBox(width: 8),
          if (visitProfile!.data.isFriend && visitProfile!.data.canMessage)
            Container(
              color: AppColors.primaryDark,
              height: 50,
              width: MediaQuery.of(context).size.width * 0.4,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset('assets/images/icons/chat_user.svg'),
                  SizedBox(width: 10),
                  Text(
                    'Chat User',
                    style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: AppColors.white),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
