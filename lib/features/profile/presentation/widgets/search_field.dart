import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zheeta/core/constants/color.dart';

class SearchField extends StatelessWidget {
  final TextEditingController searchController;
  final VoidCallback? onTap;
  final Color containerColor;
  final Color iconColor;
  final Color textColor;
  final String hintText;
  final Function(String)? onChanged;

  const SearchField({
    super.key,
    required this.searchController,
    this.onTap,
    required this.containerColor,
    required this.iconColor,
    required this.textColor,
    this.hintText = 'Search',
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Container(
        decoration: BoxDecoration(
          color: containerColor,
          borderRadius: BorderRadius.circular(8),
        ),
        height: 50,
        child: TextFormField(
          onTap: onTap,
          style: TextStyle(color: textColor),
          controller: searchController,
          keyboardType: TextInputType.text,
          cursorColor: textColor,
          decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            suffixIcon: Padding(
              padding: const EdgeInsets.all(10),
              child: SvgPicture.asset(
                'assets/images/icons/search.svg',
                colorFilter: ColorFilter.mode(iconColor, BlendMode.srcIn),
                width: 10,
                height: 10,
              ),
            ),
            border: InputBorder.none,
            hintText: hintText,
            hintStyle: TextStyle(color: textColor.withValues(alpha: 0.6)),
            focusedBorder: OutlineInputBorder(
              borderSide:
                  const BorderSide(color: AppColors.primaryDark, width: 2.0),
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          validator: (searchValue) {
            if (searchValue?.isEmpty ?? true) {
              return 'Please enter a search keyword';
            }
            return null;
          },
          onChanged: onChanged,
        ),
      ),
    );
  }
}
