import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zheeta/core/constants/color.dart';
import 'package:zheeta/core/utils/extensions/int_extension.dart';
import 'package:zheeta/core/utils/extensions/string_extension.dart';
import 'package:zheeta/di/di.dart';
import 'package:zheeta/features/app/presentation/cubits/bottom_nav_cubit/bottom_nav_cubit.dart';
import 'package:zheeta/features/profile/presentation/cubits/profile_cubit/profile_cubit.dart';
import 'package:zheeta/router/app_router.dart';
import 'package:zheeta/router/app_router.gr.dart';
import 'package:zheeta/shared/widgets/back_button.dart';
import 'package:zheeta/shared/widgets/network_image.dart';
import 'package:zheeta/shared/widgets/subscription_badge.dart';

Widget buildProfileCounters(BuildContext context) {
  return BlocBuilder<ProfileCubit, ProfileState>(
    builder: (context, state) {
      if (state is ProfileLoadedState) {
        final data = state.profile!.data;
        return Padding(
          padding:
              const EdgeInsets.only(left: 15, right: 15, top: 15, bottom: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildCounter(
                context,
                "Friends",
                "${data?.profileCounters?.friendsCount ?? 0}",
                FriendRoute(),
              ),
              _buildCounter(
                context,
                "Downlines",
                "${data?.profileCounters?.downlinesCount ?? 0}",
                DownlinesRoute(),
              ),
              _buildCounter(
                  context,
                  "Events",
                  "${data?.profileCounters?.successfulEventCount ?? 0}",
                  MyBuddyEventsRoute()),
            ],
          ),
        );
      } else {
        return SizedBox.shrink();
      }
    },
  );
}

GestureDetector _buildCounter(
    BuildContext context, String title, String count, PageRouteInfo? route) {
  return GestureDetector(
    onTap: route != null
        ? () {
            Scaffold.of(context).closeDrawer();
            router.push(route);
          }
        : null,
    child: Column(
      children: [
        Text(
          (count.roundToInt).toAbbreviatedCount(),
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
        Text(
          title,
          style: TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    ),
  );
}
