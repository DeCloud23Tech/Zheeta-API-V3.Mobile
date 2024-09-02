import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zheeta/app/common/color.dart';
import 'package:zheeta/app/router/app_router.dart';
import 'package:zheeta/widgets/primary_button.dart';
import 'package:zheeta/payment_and_subscriptions/presentation/bloc/subscription/subscription_cubit.dart';
import 'package:zheeta/payment_and_subscriptions/data/model/subscription_model.dart';

import '../../../app/injection/di.dart';
import '../../../profile/presentation/bloc/profile_cubit/profile_cubit.dart';
import '../../../widgets/loading_screen.dart';

@RoutePage()
class MembershipSubscriptionScreen extends StatefulWidget {
  const MembershipSubscriptionScreen({super.key});

  @override
  State<MembershipSubscriptionScreen> createState() =>
      _MembershipSubscriptionScreenState();
}

class _MembershipSubscriptionScreenState
    extends State<MembershipSubscriptionScreen> {
  String? _currentDescription;
  String? _currentFeature;
  SubscriptionModel? _selectedSubscription;
  late SubscriptionCubit _subscriptionCubit;

  @override
  void initState() {
    super.initState();
    _subscriptionCubit = locator<SubscriptionCubit>();
    _subscriptionCubit.getAllSubscriptionCubit();
  }

  void _updateActivePlan(String description, String feature,
      SubscriptionModel selectedSubscription) {
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

    features.add(
        '- Messaging is ${subscription.allowMessaging ? 'enabled' : 'disabled'}.');
    features.add(
        '- You can view up to ${subscription.noMatchesPerDay} matches per day.');
    features.add(
        '- You can make up to ${subscription.noOfPostPerDay} posts per day.');
    features.add(
        '- You can explore nearby users up to ${subscription.noNearbyPerWeek} users per week.');
    features.add(
        '- Withdrawals are ${subscription.allowWithdrawal ? 'allowed' : 'not allowed'}.');
    features.add(subscription.allowMultipleMediaInPost
        ? '- You can include up to ${subscription.maxNumberOfMediaInPost} media files in a single post.'
        : '- Multiple media files in a single post are not allowed.');
    features.add(
        '- Posting videos is ${subscription.allowVideoMediaCategoryInPost ? 'allowed' : 'not allowed'}.');
    features.add(
        '- Creating new communities is ${subscription.allowCreateCommunity ? 'allowed' : 'not allowed'}.');
    features.add(subscription.accessPeopleNearby
        ? '- You can access people nearby.'
        : '- Access to people nearby is not available.');

    return "Features:\n${features.join('\n')}";
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
        child: BlocBuilder<SubscriptionCubit, SubscriptionState>(
          bloc: _subscriptionCubit,
          builder: (context, state) {
            if (state is SubscriptionsLoading) {
              return LoadingScreen(
                backgroundColor: AppColors.primaryDark,
                indicatorColor: AppColors.secondaryLight,
              );
            } else if (state is SubscriptionsError) {
              return Center(child: Text(state.errorMessage));
            } else if (state is SubscriptionsSuccess) {
              final subscriptions = state.subscriptions;
              return _buildSubscriptionContent(subscriptions);
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
                          BlocBuilder<ProfileCubit, ProfileState>(
                            builder: (context, state) {
                              if (state is ProfileCompositeState) {
                                return Text(
                                  'Active: ${state.userProfile?.data.subscription?.name}',
                                  style: TextStyle(
                                    color: AppColors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                  ),
                                );
                              } else {
                                return SizedBox.shrink();
                              }
                            },
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
                          BlocBuilder<ProfileCubit, ProfileState>(
                            builder: (context, state) {
                              if (state is ProfileCompositeState) {
                                // final activeSubscriptionName = state
                                //         .userProfile?.data.subscription?.name ??
                                //     '';
                                return SubscriptionSelectionWidget(
                                  onPlanSelected: (selectedPlan) {
                                    final selectedSubscription =
                                        sortedSubscriptions.firstWhere((plan) =>
                                            plan.name == selectedPlan);
                                    final description =
                                        selectedSubscription.description;
                                    final featureDescription =
                                        describeFeatures(selectedSubscription);
                                    _updateActivePlan(
                                        description,
                                        featureDescription,
                                        selectedSubscription);
                                  },
                                  subscriptions: sortedSubscriptions,
                                  // initialSelection: activeSubscriptionName,
                                );
                              } else {
                                return SizedBox.shrink();
                              }
                            },
                          ),
                        if (index == 0) SizedBox(height: 30),
                        if (index == 0)
                          Row(
                            children: durations.map((duration) {
                              return Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 0.5),
                                  // Adjust padding to fit items
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.check_circle_outline,
                                        color: AppColors.white,
                                        size: 18,
                                      ),
                                      SizedBox(width: 3),
                                      Text(
                                        duration,
                                        style: TextStyle(
                                          color: AppColors.white,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }).toList(),
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
                                _showUpgradeDialog(
                                    context,
                                    _selectedSubscription!.name,
                                    _selectedSubscription!.fee);
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
  void initState() {
    super.initState();
    // // Set the initial selected index based on the initialSelection parameter
    // _selectedIndex = widget.subscriptions.indexWhere(
    //     (subscription) => subscription.name == widget.initialSelection);
  }

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
