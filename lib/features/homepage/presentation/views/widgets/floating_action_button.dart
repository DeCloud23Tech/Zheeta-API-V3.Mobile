import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zheeta/common/constants/color.dart';

Widget buildFloatingActionButton(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 20.0),
    // Adjust the button's vertical position
    child: FloatingActionButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(100),
      ),
      backgroundColor: Colors.white,
      onPressed: () {
        _showCreateNewBottomSheet(context);
      },
      child: SvgPicture.asset('assets/images/icons/plus.svg'),
    ),
  );
}

void _showCreateNewBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return Container(
        decoration: BoxDecoration(
          color: AppColors.secondaryLight,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildCreateNewHeader(context),
            Divider(),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildPostEventOption(context),
                  _buildAccountVerificationOption(context),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      );
    },
  );
}

Widget _buildCreateNewHeader(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(24.0),
    child: Row(
      children: [
        GestureDetector(
          onTap: () => Navigator.of(context).pop(),
          child: Container(
            padding: EdgeInsets.all(5),
            height: 30,
            width: 30,
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(100),
            ),
            child: Icon(
              Icons.close,
              color: AppColors.grey,
              size: 18,
            ),
          ),
        ),
        Spacer(),
        Text(
          'Create new',
          style: TextStyle(
            color: AppColors.grayscale,
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
        ),
        Spacer(),
      ],
    ),
  );
}

Widget _buildPostEventOption(BuildContext context) {
  return InkWell(
    onTap: () {
      // context.router.popAndPush(CreateEventRoute());
    },
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SvgPicture.asset('assets/images/icons/card-or-bank.svg'),
        SizedBox(width: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Buddy event',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: AppColors.grayscale,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Share your events with friends and people near you',
              style: TextStyle(
                color: AppColors.grey,
                fontSize: 12,
                fontWeight: FontWeight.w300,
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
Widget _buildAccountVerificationOption(BuildContext context) {
  return InkWell(
    onTap: () {
      // context.router.popAndPush(CreateEventRoute());
    },
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SvgPicture.asset('assets/images/icons/verification.svg'),
        SizedBox(width: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Account verification',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: AppColors.grayscale,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Verify account to be eligible to create buddy event',
              style: TextStyle(
                color: AppColors.grey,
                fontSize: 12,
                fontWeight: FontWeight.w300,
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
