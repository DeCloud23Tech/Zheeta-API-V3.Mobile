import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zheeta/common/extensions/string_extension.dart';
import 'package:zheeta/core/router/app_router.dart';
import 'package:zheeta/core/router/app_router.gr.dart';
import 'package:zheeta/features/profile/presentation/bloc/profile_cubit/profile_cubit.dart';
import 'package:zheeta/utils/format_utils.dart';

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
              _buildCounter(context, "Friends",
                  "${data?.profileCounters?.friendsCount ?? 0}", FriendRoute()),
              _buildCounter(
                  context,
                  "Downlines",
                  "${data?.profileCounters?.downlinesCount ?? 0}",
                  DownLinesRoute()),
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
          formatCount(count.roundToInt),
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
