import 'package:flutter/cupertino.dart';
import 'package:zheeta/app/common/constansts.dart';
import 'package:zheeta/app/common/strings.dart';
import 'package:zheeta/app/common/text_style.dart';
import 'package:zheeta/app/router/app_router.dart';
import 'package:zheeta/app/router/app_router.gr.dart';
import 'package:zheeta/widgets/primary_button.dart';

class EmptyMatches extends StatelessWidget {
  const EmptyMatches({super.key});

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
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 35.0, horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(emptyMatchesImage),
            Text(
              matchesEmptyTitle,
              textAlign: TextAlign.center,
              style: matchesTitleStyle,
            ),
            Text(
              matchesEmptySubTitle,
              style: matchesSubtitleStyle.copyWith(fontSize: 17),
              textAlign: TextAlign.center,
            ),
            PrimaryButton(
              title: 'Upgrade Membership Plan',
              action: () {
                router.push(MembershipSubscriptionRoute());
              },
            ),
          ],
        ),
      ),
    );
  }
}
