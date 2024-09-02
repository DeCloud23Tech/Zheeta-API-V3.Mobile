import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zheeta/app/common/constansts.dart';
import 'package:zheeta/app/common/strings.dart';
import 'package:zheeta/app/common/text_style.dart';
import 'package:zheeta/app/router/app_router.dart';
import 'package:zheeta/app/router/app_router.gr.dart';
import 'package:zheeta/widgets/primary_button.dart';

import '../app/common/color.dart';

class OutOfLikesScreen extends StatelessWidget {
  const OutOfLikesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: CupertinoColors.white,
        boxShadow: [
          BoxShadow(
            color: CupertinoColors.systemGrey.withOpacity(0.2),
            spreadRadius: 8,
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      alignment: Alignment.topCenter,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: 25),
          Image.asset(emptyMatchesImage),
          Text(
            matchesEmptyTitle,
            textAlign: TextAlign.center,
            style: matchesTitleStyle,
          ),
          SizedBox(height: 20),
          Text(
            matchesEmptySubTitle,
            style: matchesSubtitleStyle.copyWith(fontSize: 17),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 25),
          PrimaryButton(
            title: 'Get more likes',
            action: () {
              router.push(GetMoreLikesRoute());
            },
          )
        ],
      ),
    );
  }
}
