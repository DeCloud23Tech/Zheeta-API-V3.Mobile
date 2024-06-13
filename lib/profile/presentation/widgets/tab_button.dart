import 'package:flutter/material.dart';

import '../../../app/common/color.dart';

class TabButton extends StatelessWidget {
  final String title;
  final int tabIndex;
  final int activeTab;
  final Function(int) onTabSelected;

  const TabButton({
    super.key,
    required this.title,
    required this.tabIndex,
    required this.activeTab,
    required this.onTabSelected,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTabSelected(tabIndex);
      },
      child: Container(
        color: Colors.transparent,
        child: Column(
          children: [
            Container(
              height: 3,
              width: MediaQuery.of(context).size.width * 0.44,
              decoration: BoxDecoration(
                color: activeTab == tabIndex
                    ? AppColors.primaryDark
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            SizedBox(height: 5),
            Text(
              title,
              style: TextStyle(
                color: activeTab == tabIndex
                    ? AppColors.grayscale
                    : AppColors.grey,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
