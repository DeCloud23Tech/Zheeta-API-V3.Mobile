import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zheeta/app/common/color.dart';

void showCustomModalBottomSheet({
  required BuildContext context,
  required List<String> titles,
  required List<String> icons,
  required List<VoidCallback> actions,
}) {
  showModalBottomSheet<dynamic>(
    isScrollControlled: true,
    backgroundColor: AppColors.primaryLightBackground,
    context: context,
    builder: (context) {
      return Padding(
        padding: const EdgeInsets.only(
          top: 30.0,
          bottom: 40.0,
          left: 18.0,
          right: 18.0,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Center(
              child: Container(
                width: 50,
                height: 4,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(2),
                  color: Color(0xffDADADA),
                ),
              ),
            ),
            SizedBox(height: 30),
            Wrap(
              children: List.generate(
                titles.length,
                (index) {
                  return Container(
                    margin: const EdgeInsets.only(bottom: 10.0),
                    decoration: BoxDecoration(
                      color: AppColors.primaryLight40,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: ListTile(
                      onTap: () {
                        // Trigger the corresponding action
                        actions[index].call();
                        // Optionally close the modal
                        Navigator.pop(context);
                      },
                      title: Text(
                        titles[index],
                        style: TextStyle(
                          color: AppColors.white,
                          fontSize: 18,
                        ),
                      ),
                      trailing: SvgPicture.asset(icons[index]),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      );
    },
  );
}
