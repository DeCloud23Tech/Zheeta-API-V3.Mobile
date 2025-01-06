import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:zheeta/app/common/color.dart';

Widget buildBottomNavigationBar(
    int index, List<List<String>> icons, Function(int) onItemSelected) {
  return Positioned(
    child: Stack(
      children: [
        Align(
          alignment: Alignment.bottomCenter,
          child: Image.asset('assets/images/bottom_nav.png',
              width: double.infinity),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(
                icons.length,
                (i) => _buildNavItem(i, index, icons, onItemSelected),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

Widget _buildNavItem(int i, index, List<List<String>> icons, onItemSelected) {
  return Expanded(
    child: Padding(
      padding: EdgeInsets.only(
        left: i == 2 ? 30.0 : 0.0, // Add padding on the left for index 2
        right: i == 1 ? 30.0 : 0.0, // Add padding on the right for index 1
      ),
      child: CupertinoButton(
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
          onItemSelected(i); // Call the callback function to update the state
        },
      ),
    ),
  );
}
