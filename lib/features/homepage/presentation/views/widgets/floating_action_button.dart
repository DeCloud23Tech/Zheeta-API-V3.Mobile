import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zheeta/common/constants/color.dart';
import 'package:zheeta/core/router/app_router.gr.dart';
import 'package:zheeta/features/buddy_events/presentation/bloc/event_verification_cubit/event_verification_cubit.dart';

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
                  _buildAccountVerificationOption(context),
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
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        Spacer(),
      ],
    ),
  );
}

Widget _buildAccountVerificationOption(BuildContext context) {
  return BlocBuilder<EventVerificationCubit, EventVerificationState>(
    builder: (context, state) {
      final isVerified = true;
          //state is EventVerificationLoaded && state.verification != null;
      return InkWell(
        onTap: () {
          if (!isVerified) {
            context.router.popAndPush(EventVerificationRoute());
          } else {
            context.router.popAndPush(CreateEventRoute());
          }
        },
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 4.0),
              child: SvgPicture.asset('assets/images/icons/verification.svg'),
            ),
            // SizedBox(width: 15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  isVerified ? 'Buddy event' : 'Account verification',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: AppColors.grayscale,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  isVerified
                      ? 'Share your events with friends and people near you'
                      : 'Verify account to be eligible to create buddy event',
                  style: TextStyle(
                    color: AppColors.grey,
                    fontSize: 12,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                SizedBox(height: 20),
              ],
            ),
          ],
        ),
      );
    },
  );
}
