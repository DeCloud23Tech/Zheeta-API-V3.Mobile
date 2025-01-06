import 'package:flutter/material.dart';
import 'package:zheeta/app/common/color.dart';
import 'package:zheeta/payment_and_subscriptions/data/model/subscription_model.dart';

class SubscriptionSelectionWidget extends StatefulWidget {
  final Function(String) onPlanSelected;
  final List<SubscriptionModel> subscriptions;

  // final String initialSelection;

  const SubscriptionSelectionWidget({
    required this.onPlanSelected,
    required this.subscriptions,
    // required this.initialSelection,
  });

  @override
  _SubscriptionSelectionWidgetState createState() =>
      _SubscriptionSelectionWidgetState();
}

class _SubscriptionSelectionWidgetState
    extends State<SubscriptionSelectionWidget> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 85,
      child: Center(
        child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: widget.subscriptions.length,
          itemBuilder: (context, index) {
            final subscription = widget.subscriptions[index];
            return GestureDetector(
              onTap: () {
                setState(() {
                  _selectedIndex = index;
                });
                widget.onPlanSelected(subscription.name);
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: Container(
                  width: MediaQuery.of(context).size.width / 3.8,
                  margin: EdgeInsets.symmetric(vertical: 5),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: _selectedIndex == index
                        ? AppColors.white
                        : AppColors.primaryDark,
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(
                      color: _selectedIndex == index
                          ? AppColors.white
                          : AppColors.white,
                      width: 2,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        subscription.name.trim(),
                        style: TextStyle(
                          color: _selectedIndex == index
                              ? AppColors.primaryDark
                              : AppColors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        'Plan',
                        style: TextStyle(
                          color: _selectedIndex == index
                              ? AppColors.black
                              : AppColors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
