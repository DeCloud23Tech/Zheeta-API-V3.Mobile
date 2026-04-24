import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:zheeta/di/di.dart';
import 'package:zheeta/features/app/presentation/cubits/bottom_nav_cubit/bottom_nav_cubit.dart';
import 'package:zheeta/features/app/presentation/widgets/bottom_nav_bar.dart';
import 'package:zheeta/features/app/presentation/widgets/floating_action_button.dart';
import 'package:zheeta/router/app_router.gr.dart';

const List<List<String>> appFooterIcons = [
  ['Discover', 'assets/images/icons/card.svg'],
  ['Feed', 'assets/images/icons/feed.svg'],
  ['Messages', 'assets/images/icons/messages.svg'],
  ['Profile', 'assets/images/icons/user.svg'],
];

void navigateToHomeFooterTab(BuildContext context, int index) {
  locator<BottomNavCubit>().changeTab(index);
  context.router.replaceAll([const HomeRoute()]);
}

Widget buildAppFooterNav(
  BuildContext context, {
  required Function(int) onItemSelected,
  List<List<String>> icons = appFooterIcons,
}) {
  return SizedBox(
    height: 110,
    child: Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.bottomCenter,
      children: [
        Positioned.fill(
          child: buildBottomNavigationBar(
            icons,
            context,
            onItemSelected,
          ),
        ),
        Positioned(
          top: 6,
          child: Transform.translate(
            offset: const Offset(0, -16),
            child: buildFloatingActionButton(context),
          ),
        ),
      ],
    ),
  );
}

Widget buildGeneralFooterNav(BuildContext context) {
  return buildAppFooterNav(
    context,
    onItemSelected: (index) => navigateToHomeFooterTab(context, index),
  );
}
