import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zheeta/app/common/color.dart';
import 'package:zheeta/profile/data/model/view_profile_model.dart';


class ProfileAddOrLike extends StatelessWidget {
  final ViewProfileModel? visitProfile;

  const ProfileAddOrLike({
    Key? key,
    this.visitProfile,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                child: _buildButton(
                  context,
                  'assets/images/icons/add_friend.svg',
                  'Send-FR',
                ),
              ),
            ],
            SizedBox(width: 4),
            if (!visitProfile!.isFriend) ...[
              Expanded(
                child: _buildButton(
                  context,
                  'assets/images/icons/star.svg',
                  'Send Super-FR',
                ),
              ),
              SizedBox(width: 15),
            ],
            if (visitProfile?.isFriend ?? false) ...[
              SizedBox(width: 15),
              Expanded(
                child: _buildButton(
                  context,
                  null,
                  'Unfriend',
                ),
              ),
            ],
            SizedBox(width: 4),
            if (visitProfile!.canMessage && visitProfile!.isFriend) ...[
              Expanded(
                child: _buildButton(
                  context,
                  'assets/images/icons/chat_user.svg',
                  'Chat User',
                ),
              ),
              SizedBox(width: 15),
            ],
          ],
        ),
      ),
    );
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
