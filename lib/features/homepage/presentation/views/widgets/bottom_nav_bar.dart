import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zheeta/common/constants/color.dart';
import 'package:zheeta/features/homepage/presentation/views/bloc/bottom_nav_cubit/bottom_nav_cubit.dart';

Widget buildBottomNavigationBar(List<List<String>> icons, BuildContext context, Function(int) onItemSelected) {
  return BlocBuilder<BottomNavCubit, int>(
    builder: (context, index) {
      return Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          color: Colors.transparent,
          child: Stack(
            children: [
              Positioned.fill(
                child: Image.asset(
                  'assets/images/bottom_nav.png',
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20.0, top: 30.0, left: 5.0, right: 5.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: List.generate(
                    icons.length,
                        (i) => _buildNavItem(i, index, icons, context, onItemSelected),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}

Widget _buildNavItem(int i, int index, List<List<String>> icons, BuildContext context, Function(int) onItemSelected) {
  return CupertinoButton(
    padding: EdgeInsets.only(
      left: i == 2 ? 30.0 : 0.0,
      right: i == 1 ? 30.0 : 0.0,
    ),
    child: AnimatedOpacity(
      opacity: index == i ? 1 : 0.5,
      duration: const Duration(milliseconds: 200),
      child: SizedBox(
        height: 26,
        width: 26,
        child: SvgPicture.asset(
          icons[i][1],
          colorFilter: ColorFilter.mode(
            index == i ? AppColors.primaryDark : AppColors.grey,
            BlendMode.srcIn,
          ),
        ),
      ),
    ),
    onPressed: () {
      onItemSelected(i);
    },
  );
}

