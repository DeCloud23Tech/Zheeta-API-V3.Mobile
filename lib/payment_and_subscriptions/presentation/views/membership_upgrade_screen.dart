import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zheeta/app/common/color.dart';
import 'package:zheeta/app/router/app_router.dart';
import 'package:zheeta/widgets/primary_button.dart';
import 'package:zheeta/payment_and_subscriptions/presentation/bloc/subscription/subscription_cubit.dart';
import 'package:zheeta/payment_and_subscriptions/data/model/subscription_model.dart';

import '../../../app/common/enums/subscription_type.dart';
import '../../../app/injection/di.dart';
import '../viewmodel/subscription_viewmodel.dart';

@RoutePage()
class MembershipSubscriptionScreen extends StatefulWidget {
  final SubscriptionType? subscriptionId;

  const MembershipSubscriptionScreen({super.key, required this.subscriptionId});

  @override
  State<MembershipSubscriptionScreen> createState() =>
      _MembershipSubscriptionScreenState();
}

class _MembershipSubscriptionScreenState
    extends State<MembershipSubscriptionScreen> {
  late SubscriptionViewmodel _subscriptionViewmodel;
  String? _activePlan;
  String? _currentDescription;
  String? _currentFeature;
  SubscriptionModel? _selectedSubscription;

  @override
  void initState() {
    super.initState();
    _activePlan = widget.subscriptionId?.name;
    _subscriptionViewmodel = locator<SubscriptionViewmodel>();
    _subscriptionViewmodel.fetchAllSubscriptions();
  }

  void _updateActivePlan(String description, String feature, SubscriptionModel selectedSubscription) {
    setState(() {
      _currentDescription = description;
      _currentFeature = feature;
      _selectedSubscription = selectedSubscription;
    });
  }

  List<String> durations = [
    '1 month',
    '2 months',
    '6 months',
    '1 year',
  ];

  String describeFeatures(SubscriptionModel subscription) {
    List<String> features = [];

    // Messaging feature
    if (subscription.allowMessaging) {
      features.add("Access to messaging");
    } else {
      features.add("No messaging access");
    }

    // Matches per day
    features.add("${subscription.noMatchesPerDay} matches per day");

    // Posts per day
    features.add("${subscription.noOfPostPerDay} posts per day");

    // Nearby per week
    features.add("${subscription.noNearbyPerWeek} nearby people per week");

    // Withdrawal feature
    if (subscription.allowWithdrawal) {
      features.add("Allows withdrawal");
    } else {
      features.add("No withdrawal allowed");
    }

    // Multiple media in post
    if (subscription.allowMultipleMediaInPost) {
      features.add(
          "Allows multiple media in a post (up to ${subscription.maxNumberOfMediaInPost})");
    } else {
      features.add("Single media per post");
    }

    // Video media category in post
    if (subscription.allowVideoMediaCategoryInPost) {
      features.add("Allows video media in posts");
    } else {
      features.add("No video media in posts");
    }

    // Create community
    if (subscription.allowCreateCommunity) {
      features.add("Allows community creation");
    } else {
      features.add("No community creation");
    }

    // Access people nearby
    if (subscription.accessPeopleNearby) {
      features.add("Access to people nearby");
    } else {
      features.add("No access to people nearby");
    }

    return "Features:\n" + features.join(" ");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryDark,
      appBar: AppBar(
        backgroundColor: AppColors.primaryDark,
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
                borderRadius: BorderRadius.circular(100),
              ),
              child: Icon(Icons.arrow_back_ios_new, color: AppColors.grey),
            ),
          ),
        ),
        title: Text(
          'Membership',
          style: TextStyle(
            color: AppColors.white,
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: StreamBuilder<SubscriptionState>(
          stream: _subscriptionViewmodel.stateStream,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (snapshot.hasData) {
              final state = snapshot.data!;
              if (state is SubscriptionsLoading) {
                return Center(child: CircularProgressIndicator());
              } else if (state is SubscriptionsError) {
                return Center(child: Text('Error: ${state.errorMessage}'));
              } else if (state is SubscriptionsSuccess) {
                final subscriptions = state.subscriptions;
                return _buildSubscriptionContent(subscriptions);
              } else {
                return Center(child: Text('No subscriptions found.'));
              }
            } else {
              return Center(child: Text('No subscriptions found.'));
            }
          },
        ),
      ),
    );
  }

  Widget _buildSubscriptionContent(SubscriptionListModel subscriptions) {
    // Sort subscriptions by id
    final sortedSubscriptions = List<SubscriptionModel>.from(subscriptions.data)
      ..sort((a, b) => a.id.compareTo(b.id));

    return Column(
      children: [
        SizedBox(height: 15),
        Image.asset('assets/images/membership.png'),
        Expanded(
          child: ListView.builder(
            itemCount: sortedSubscriptions.length,
            itemBuilder: (context, index) {
              final subscription = sortedSubscriptions[index];
              final features = describeFeatures(subscription);

              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 10.0),
                    child: Column(
                      children: [
                        if (index == 0)
                          SvgPicture.asset(
                              'assets/images/icons/gradient-refresh.svg'),
                        if (index == 0)
                          Text(
                            'Active: $_activePlan',
                            style: TextStyle(
                              color: AppColors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        if (index == 0) SizedBox(height: 15),
                        if (index == 0)
                          Text(
                            _currentDescription ?? subscription.description,
                            style: TextStyle(
                              color: AppColors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        if (index == 0) SizedBox(height: 20),
                        if (index == 0)
                          SubscriptionSelectionWidget(
                            subscriptions: sortedSubscriptions,
                            onPlanSelected: (selectedPlan) {
                              final selectedSubscription =
                              sortedSubscriptions.firstWhere(
                                      (plan) => plan.name == selectedPlan);
                              final description =
                                  selectedSubscription.description;
                              final featureDescription =
                              describeFeatures(selectedSubscription);
                              _updateActivePlan(
                                  description, featureDescription, selectedSubscription);
                            },
                          ),
                        if (index == 0) SizedBox(height: 30),
                        if (index == 0)
                          SizedBox(
                            height: 30,
                            width: double.infinity,
                            child: ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              itemCount: durations.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.only(right: 15.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.check_circle_outline,
                                        color: AppColors.white,
                                        size: 25,
                                      ),
                                      SizedBox(width: 6),
                                      Text(
                                        durations[index],
                                        style: TextStyle(
                                            color: AppColors.white,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w400),
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                        if (index == 0) SizedBox(height: 30),
                        if (index == 0)
                          Text(
                            _currentFeature ?? features,
                            style: TextStyle(
                              color: AppColors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        if (index == sortedSubscriptions.length - 1)
                          PrimaryButton(
                            title: 'Upgrade',
                            invert: true,
                            action: () {
                              if (_selectedSubscription != null) {
                                _showUpgradeDialog(context, _selectedSubscription!.name, _selectedSubscription!.fee);
                              }
                            },
                          ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}

void _showUpgradeDialog(BuildContext context, String name, int fee) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        content: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            style: DefaultTextStyle.of(context).style.copyWith(fontSize: 14),
            children: [
              TextSpan(text: 'You’re about to subscribe for '),
              TextSpan(
                text: '$name membership ($fee Coins)',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              TextSpan(
                  text:
                  ' with your Zheeta wallet. Kindly click on confirm to proceed.'),
            ],
          ),
        ),
        actions: <Widget>[
          Column(
            children: [
              PrimaryButton(
                title: 'Confirm payment',
                action: () {
                  Navigator.of(context).pop();
                },
              ),
              SizedBox(height: 10),
              PrimaryButton(
                title: 'Cancel',
                invert: true,
                action: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        ],
      );
    },
  );
}


class SubscriptionSelectionWidget extends StatefulWidget {
  final Function(String) onPlanSelected;
  final List<SubscriptionModel> subscriptions;

  const SubscriptionSelectionWidget({
    required this.onPlanSelected,
    required this.subscriptions,
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
      width: double.infinity,
      child: Center(
        child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          physics: NeverScrollableScrollPhysics(),
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
                  width: 115,
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
                        subscription.name,
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
                        '${subscription.fee} Coins',
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
