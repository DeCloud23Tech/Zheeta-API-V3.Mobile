import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zheeta/common/constants/color.dart';
import 'package:zheeta/features/buddy_events/presentation/widgets/event_filter_bottomsheet.dart';
import 'package:zheeta/features/buddy_events/presentation/widgets/event_search_bottomsheet.dart';
import 'package:zheeta/features/profile/presentation/widgets/search_field.dart';

class FeedSearchBar extends StatelessWidget {
  final TextEditingController searchController;

  const FeedSearchBar({super.key, required this.searchController});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: SearchField(
            searchController: searchController,
            onTap: () => showSearchBottomSheet(context),
            containerColor: AppColors.primaryLightBackground,
            iconColor: AppColors.white,
            textColor: Colors.white,
          ),
        ),
        Container(
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: AppColors.primaryLightBackground,
            borderRadius: BorderRadius.circular(8),
          ),
          child: GestureDetector(
            onTap: () async {
              final eventFilter = await eventFilterBottomSheet(context);
            },
            child: SvgPicture.asset(
              'assets/images/icons/filter_mark.svg',
              colorFilter: ColorFilter.mode(AppColors.white, BlendMode.srcIn),
            ),
          ),
        ),
        const SizedBox(width: 16),
      ],
    );
  }

}
