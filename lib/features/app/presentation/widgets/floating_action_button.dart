import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zheeta/core/constants/color.dart';
import 'package:zheeta/features/buddy_events/presentation/cubits/event_verification_cubit/event_verification_cubit.dart';
import 'package:zheeta/router/app_router.gr.dart';

Widget buildFloatingActionButton(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 35.0),
    // Adjust the button's vertical position
    child: SizedBox(
      height: 64,
      width: 64,
      child: FloatingActionButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100),
        ),
        backgroundColor: Colors.white,
        onPressed: () {
          _showCreateNewBottomSheet(context);
        },
        child: Transform.scale(
          scale: 1.22,
          child: SvgPicture.asset(
            'assets/images/icons/plus.svg',
            width: 30,
            height: 30,
          ),
        ),
      ),
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
    child: SizedBox(
      height: 36, // consistent height
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Centered Text
          const Center(
            child: Text(
              'Create new',
              style: TextStyle(
                color: AppColors.grayscale,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),

          // Close button aligned to left
          Align(
            alignment: Alignment.centerLeft,
            child: GestureDetector(
              onTap: () => Navigator.of(context).pop(),
              child: Container(
                padding: const EdgeInsets.all(5),
                height: 36,
                width: 36,
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(100),
                ),
                child: const Icon(
                  Icons.close,
                  color: AppColors.grey,
                  size: 20,
                ),
              ),
            ),
          ),
        ],
      ),
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
