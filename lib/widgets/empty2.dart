import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:zheeta/app/common/color.dart';
import 'package:zheeta/app/router/app_router.dart';
import 'package:zheeta/widgets/primary_button.dart';
import 'package:zheeta/widgets/reusable_container.dart';

@RoutePage()
class GetMoreLikesScreen extends StatelessWidget {
  const GetMoreLikesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> _plans = [
      {"duration": "1 week", "price": "\$4.34/wk"},
      {"duration": "1 month", "price": "\$15.99/mo", "savePercent": "20"},
      {"duration": "3 months", "price": "\$39.99/3mo", "savePercent": "30"},
      {"duration": "6 months", "price": "\$69.99/3mo", "savePercent": "60"},
    ];
    String selectedPlanPrice = _plans[0]["price"];

    return Scaffold(
      backgroundColor: AppColors.secondaryLight,
      appBar: AppBar(
        backgroundColor: AppColors.secondaryLight,
        elevation: 0.0,
        leading: GestureDetector(
          onTap: () => router.pop(),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
                padding: EdgeInsets.all(5),
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(100)),
                child: Icon(Icons.arrow_back_ios_new, color: AppColors.grey)),
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Get unlimited likes',
                style: TextStyle(
                    color: AppColors.grayscale,
                    fontSize: 24,
                    fontWeight: FontWeight.w600),
              ),
              Text(
                'Below are the lists of benefits you get with the subscriptions. Simply select a plan that fits you.',
                style: TextStyle(
                    color: AppColors.darkText,
                    fontSize: 16,
                    fontWeight: FontWeight.w200),
              ),
              SizedBox(height: 20),
              CircularIconWithText(
                svgPath: 'assets/images/icons/heart.svg',
                text: 'Send unlimited likes',
                padding: 8.5,
              ),
              SizedBox(height: 20),
              CircularIconWithText(
                svgPath: 'assets/images/icons/favorite.svg',
                text: 'See everyone who likes you',
                padding: 8.5,
              ),
              SizedBox(height: 20),
              CircularIconWithText(
                svgPath: 'assets/images/icons/favorite.svg',
                text: 'See everyone who likes you',
                padding: 8.5,
              ),
              SizedBox(height: 20),

              Text(
                'Select a plan',
                style: TextStyle(
                    color: AppColors.grayscale,
                    fontSize: 14,
                    fontWeight: FontWeight.w700),
              ),
              SizedBox(height: 20),
              PlanSelectionWidget(
                plans: _plans,
                onPlanSelected: (index) {
                  selectedPlanPrice = _plans[index]["price"];
                },
              ),
              SizedBox(height: 40),
              Divider(
                color: AppColors.darkText,
                thickness: 0.25,
              ),
              SizedBox(height: 20),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'By tapping subscribe, you agree with our ',
                      style: TextStyle(
                          color: AppColors.darkText,
                          fontSize: 14,
                          fontWeight: FontWeight.w300),
                    ),
                    TextSpan(
                      text: 'terms ',
                      style: TextStyle(
                          color: AppColors.primaryDark,
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                    ),
                    TextSpan(
                      text:
                      'and you’ll be charged. Your subscription will auto-renew for the same price and package until you cancel via app settings.',
                      style: TextStyle(
                          color: AppColors.darkText,
                          fontSize: 14,
                          fontWeight: FontWeight.w300),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              PrimaryButton(
                  title: 'Subscribe - $selectedPlanPrice', action: () {}),
            ],
          ),
        ),
      ),
    );
  }
}



class CircularIconWithText extends StatelessWidget {
  final String svgPath;
  final String text;
  final double iconSize;
  final double padding;

  CircularIconWithText({
    super.key,
    required this.svgPath,
    required this.text,
    this.iconSize = 20.0,
    this.padding = 8.0,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.all(padding),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
          ),
          child: SvgPicture.asset(
            svgPath,
            width: iconSize,
            height: iconSize,
          ),
        ),
        SizedBox(width: 10.0),
        Text(
          text,
          style: TextStyle(
              color: AppColors.grayscale,
              fontSize: 16,
              fontWeight: FontWeight.w400),
        ),
      ],
    );
  }
}


class PlanSelectionWidget extends StatefulWidget {
  final List<Map<String, dynamic>> plans;
  final Function(int) onPlanSelected;

  PlanSelectionWidget({
    super.key,
    required this.plans,
    required this.onPlanSelected,
  });

  @override
  _PlanSelectionWidgetState createState() => _PlanSelectionWidgetState();
}

class _PlanSelectionWidgetState extends State<PlanSelectionWidget> {
  int _selectedPlanIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: widget.plans
            .asMap()
            .entries
            .map(
              (entry) => GestureDetector(
            onTap: () {
              setState(() {
                _selectedPlanIndex = entry.key;
                // Notify parent widget about the selected plan index
                widget.onPlanSelected(_selectedPlanIndex);
              });
            },
            child: Container(
              width: 108,
              height: 108,
              margin: EdgeInsets.symmetric(horizontal: 8.0),
              // padding: EdgeInsets.all(16.0)0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                border: Border.all(
                  color: _selectedPlanIndex == entry.key
                      ? AppColors.primaryDark
                      : AppColors.greyscaleLight,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                      width: 108,
                      decoration: BoxDecoration(
                        color: _selectedPlanIndex == entry.key
                            ? AppColors.primaryDark
                            : AppColors.greyscaleLight,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          entry.value["savePercent"] == null
                              ? ""
                              : "Save ${entry.value["savePercent"]}%",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0,
                            color:  _selectedPlanIndex == entry.key
                                ? AppColors.white
                                : AppColors.darkText,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      width: 108,
                      color: AppColors.white,
                      child: Column(
                        children: [
                          SizedBox(height: 8.0),
                          Text(
                            "${entry.value["duration"]}",
                            style: TextStyle(
                              fontSize: 14.0,
                            ),
                          ),
                          SizedBox(height: 8.0),
                          Text(
                            "${entry.value["price"]}",
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
            .toList(),
      ),
    );
  }
}
