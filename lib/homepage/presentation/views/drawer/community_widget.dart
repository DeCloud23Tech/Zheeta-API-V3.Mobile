import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:zheeta/app/common/color.dart';
import 'package:zheeta/app/router/app_router.dart';
import 'package:zheeta/app/router/app_router.gr.dart';
import 'package:zheeta/profile/presentation/bloc/profile_cubit/profile_cubit.dart';


Widget buildCommunitiesSection(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 8.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "My Communities",
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        Text(
          "View All",
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    ),
  );
}

Widget buildCommunities(BuildContext context) {
  return Row(
    children: [
      Container(
        width: 50,
        height: 70,
        padding: EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: SvgPicture.asset("assets/images/icons/plus.svg"),
      ),
      SizedBox(width: 10),
      Container(
        width: MediaQuery.of(context).size.width * 0.77,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(
                6,
                (index) => _buildCommunity(context, "Community 1",
                    "assets/images/comm.png", HomeRoute())),
          ),
        ),
      ),
    ],
  );
}

GestureDetector _buildCommunity(
    BuildContext context, String title, String icon, PageRouteInfo page) {
  return GestureDetector(
    onTap: () {
      Scaffold.of(context).closeDrawer();
      router.push(page);
    },
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Image.asset(icon),
          ),
          SizedBox(height: 5),
          Text(
            title,
            style: TextStyle(
              color: AppColors.white,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    ),
  );
}
