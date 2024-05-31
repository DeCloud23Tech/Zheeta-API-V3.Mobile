import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:zheeta/app/common/constansts.dart';
import 'package:zheeta/app/common/strings.dart';
import 'package:zheeta/app/common/text_style.dart';
import 'package:zheeta/widgets/primary_button.dart';

class EmptyMatches extends StatelessWidget {
  Function() action;
  EmptyMatches({super.key, required this.action});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
          decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.4),
              borderRadius: BorderRadius.circular(10),
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  offset: const Offset(
                    5.0,
                    5.0,
                  ),
                  blurRadius: 10.0,
                  spreadRadius: 2.0,
                )
              ]),
        ),
        Container(
          margin: EdgeInsets.only(left: 30, right: 30, bottom: 20),
          decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.7),
              borderRadius: BorderRadius.circular(10),
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  offset: const Offset(
                    5.0,
                    5.0,
                  ),
                  blurRadius: 10.0,
                  spreadRadius: 2.0,
                )
              ]),
        ),
        Container(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(
                  bottom: 10,
                ),
                padding: EdgeInsets.only(
                  left: 10,
                  right: 10,
                  top: 10,
                ),
                child: Image.asset(emptyMatchesImage),
              ),
              Container(
                margin: EdgeInsets.only(
                  bottom: 15,
                ),
                child: Text(matchesEmptyTitle,
                    textAlign: TextAlign.center, style: matchesTitleStyle),
              ),
              Container(
                margin: EdgeInsets.only(
                  bottom: 20,
                ),
                child: Text(matchesEmptySubTitle,
                    textAlign: TextAlign.center,
                    style: matchesSubtitleStyle.copyWith(fontSize: 17)),
              ),
              Container(
                margin: EdgeInsets.only(
                  bottom: 15,
                ),
                child: PrimaryButton(
                  title: 'Get more likes',
                  action: action,
                ),
              )
            ],
          ),
          margin: EdgeInsets.only(left: 10, right: 10, bottom: 30),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                offset: const Offset(
                  5.0,
                  5.0,
                ),
                blurRadius: 10.0,
                spreadRadius: 2.0,
              )
            ],
          ),
        )
      ],
    );
  }
}
