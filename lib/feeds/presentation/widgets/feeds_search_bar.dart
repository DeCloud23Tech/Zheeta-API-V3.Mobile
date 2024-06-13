
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../app/common/color.dart';

class FeedSearchBar extends StatelessWidget {
  final TextEditingController searchController;

  const FeedSearchBar({Key? key, required this.searchController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        height: 50,
        child: TextFormField(
          onFieldSubmitted: (value) {},
          onChanged: (value) {},
          style: const TextStyle(color: Colors.black),
          controller: searchController,
          keyboardType: TextInputType.text,
          cursorColor: AppColors.primaryDark,
          decoration: InputDecoration(
            suffixIcon: Padding(
              padding: const EdgeInsets.all(10),
              child: SvgPicture.asset(
                'assets/images/icons/search.svg',
                width: 10,
                height: 10,
              ),
            ),
            border: const OutlineInputBorder(),
            hintText: 'Search',
            hintStyle: TextStyle(color: AppColors.hintText),
          ),
          validator: (searchValue) {
            if (searchValue!.isEmpty) {
              return 'Please enter search keyword';
            }
            return null;
          },
        ),
      ),
    );
  }
}
