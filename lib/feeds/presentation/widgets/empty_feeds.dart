import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zheeta/app/common/constansts.dart';
import 'package:zheeta/app/common/strings.dart';
import 'package:zheeta/app/common/text_style.dart';

class EmptyFeedsWidget extends StatelessWidget {
  const EmptyFeedsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            emptyFeedsImage,
            width: 200,
            height: 200,
            fit: BoxFit.scaleDown,
          ),
          Container(
            margin: EdgeInsets.only(
              bottom: 15,
            ),
            child: Text(feedsEmptyTitle,
                textScaler: TextScaler.linear(1),
                textAlign: TextAlign.center,
                style: matchesTitleStyle),
          ),
          Container(
            margin: EdgeInsets.only(
              bottom: 20,
            ),
            child: Text(feedEmptySubTitle,
                textScaler: TextScaler.linear(1),
                textAlign: TextAlign.center,
                style: matchesSubtitleStyle.copyWith(fontSize: 17)),
          ),
        ],
      ),
    );
  }
}
