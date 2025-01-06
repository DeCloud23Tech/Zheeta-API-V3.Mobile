import 'dart:async';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:zheeta/app/common/color.dart';
import 'package:zheeta/app/common/mixins/inapp_purchase_mixin.dart';
import 'package:zheeta/app/common/notify/notify_user.dart';
import 'package:zheeta/app/injection/di.dart';
import 'package:zheeta/payment_and_subscriptions/data/model/subscription_model.dart';
import 'package:zheeta/payment_and_subscriptions/presentation/bloc/subscription/subscription_cubit.dart';
import 'package:zheeta/payment_and_subscriptions/presentation/widget/duration_selection.dart';
import 'package:zheeta/payment_and_subscriptions/presentation/widget/subscription_selection.dart';
import 'package:zheeta/profile/presentation/bloc/profile_cubit/profile_cubit.dart';
import 'package:zheeta/widgets/back_button.dart';
import 'package:zheeta/widgets/loader.dart';
import 'package:zheeta/widgets/primary_button.dart';

@RoutePage()
class MembershipSubscriptionScreen extends StatefulWidget {
  const MembershipSubscriptionScreen({Key? key}) : super(key: key);

  @override
  State<MembershipSubscriptionScreen> createState() =>
      _MembershipSubscriptionScreenState();
}

class _MembershipSubscriptionScreenState
    extends State<MembershipSubscriptionScreen> with InAppPurchaseMixin {
  late StreamSubscription<List<PurchaseDetails>> _subscription;
  final SubscriptionCubit _subscriptionCubit = locator<SubscriptionCubit>();

  // Method to update the selectedDuration in the mixin
  void updateSelectedDuration(String newDuration) {
    setState(() {
      selectedDuration = newDuration;
    });
  }

  @override
  void initState() {
    super.initState();
    _subscriptionCubit.getAllSubscriptionCubit();

    _subscription = inAppPurchase.purchaseStream.listen(
      (purchaseDetailsList) {
        for (var purchaseDetails in purchaseDetailsList) {
          if (purchaseDetails.status == PurchaseStatus.purchased) {
            verifyPurchase(purchaseDetails, selectedDuration!);
          }
          if (purchaseDetails.pendingCompletePurchase) {
            inAppPurchase.completePurchase(purchaseDetails);
          }
        }
      },
    );
    loadProducts();
  }

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryDark,
      appBar: AppBar(
        backgroundColor: AppColors.primaryDark,
        elevation: 0.0,
        leading: AppBackButton(),
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
      body: SafeArea(child: _buildProductList()
          // available
          //     ?
          //     : const Center(child: Text('Store not available')),
          ),
    );
  }

  Widget _buildProductList() {
    return BlocBuilder<SubscriptionCubit, SubscriptionState>(
      builder: (context, state) {
        if (state is SubscriptionsLoading) {
          return LoadingIndicator();
        } else if (state is SubscriptionsError) {
          return Center(child: Text(state.errorMessage));
        } else if (state is SubscriptionsSuccess) {
          final subscriptions = state.subscriptions;
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
                                        'Active: ${state.userProfile?.data?.profile?.userSubscription?.name}',
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
                                  currentDescription ?? subscription.description,
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
                                      return SubscriptionSelectionWidget(
                                        onPlanSelected: (selectedPlan) {
                                          final selectedSubscription =
                                          sortedSubscriptions.firstWhere(
                                                  (plan) => plan.name == selectedPlan);
                                          final description =
                                              selectedSubscription.description;
                                          final featureDescription =
                                          describeFeatures(selectedSubscription);
                                          updateActivePlan(
                                              description,
                                              featureDescription,
                                              selectedSubscription,
                                              selectedDuration);
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
                                DurationSelection(
                                  selectedDuration,
                                  durations,
                                      (duration) {
                                    selectedDuration =
                                        duration; // Update the selected duration
                                    updateSelectedDuration(duration); // Update selectedDuration

                                  },
                                ),
                              if (index == 0) SizedBox(height: 30),
                              if (index == 0)
                                Text(
                                  currentFeature ?? features,
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
                                    if (selectedDuration != null) {
                                      ProductDetails? selectedProduct =
                                      getProductDetails(
                                          selectedSubscription?.name,
                                          selectedDuration,
                                          products);

                                      showUpgradeDialog(
                                          context,
                                          selectedSubscription!.name,
                                          selectedDuration!,
                                          selectedProduct!);
                                    } else {
                                      NotifyUser.showSnackbar(
                                          'Select a subscription duration');
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
        } else {
          return Center(child: Text('No subscriptions found.'));
        }
      },
    );
  }
}

// Widget _buildSubscriptionContent(
//   List<ProductDetails> products,
//   SubscriptionListModel subscriptions,
//   describeFeatures,
//   String? _currentDescription,
//   String? _currentFeature,
//   SubscriptionModel? _selectedSubscription,
//   List<String> durations,
//   String? selectedDuration,
//   _updateActivePlan,
//   _showUpgradeDialog,
//   _getProductDetails,
// ) {
// // Sort subscriptions by id
//   final sortedSubscriptions = List<SubscriptionModel>.from(subscriptions.data)
//     ..sort((a, b) => a.id.compareTo(b.id));
//   return Column(
//     children: [
//       SizedBox(height: 15),
//       Image.asset('assets/images/membership.png'),
//       Expanded(
//         child: ListView.builder(
//           itemCount: sortedSubscriptions.length,
//           itemBuilder: (context, index) {
//             final subscription = sortedSubscriptions[index];
//             final features = describeFeatures(subscription);
//
//             return Column(
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.symmetric(
//                       horizontal: 20.0, vertical: 10.0),
//                   child: Column(
//                     children: [
//                       if (index == 0)
//                         SvgPicture.asset(
//                             'assets/images/icons/gradient-refresh.svg'),
//                       if (index == 0)
//                         BlocBuilder<ProfileCubit, ProfileState>(
//                           builder: (context, state) {
//                             if (state is ProfileCompositeState) {
//                               return Text(
//                                 'Active: ${state.userProfile?.data.profile?.userSubscription?.name}',
//                                 style: TextStyle(
//                                   color: AppColors.white,
//                                   fontSize: 20,
//                                   fontWeight: FontWeight.w600,
//                                 ),
//                               );
//                             } else {
//                               return SizedBox.shrink();
//                             }
//                           },
//                         ),
//                       if (index == 0) SizedBox(height: 15),
//                       if (index == 0)
//                         Text(
//                           _currentDescription ?? subscription.description,
//                           style: TextStyle(
//                             color: AppColors.white,
//                             fontSize: 14,
//                             fontWeight: FontWeight.w400,
//                           ),
//                           textAlign: TextAlign.center,
//                         ),
//                       if (index == 0) SizedBox(height: 20),
//                       if (index == 0)
//                         BlocBuilder<ProfileCubit, ProfileState>(
//                           builder: (context, state) {
//                             if (state is ProfileCompositeState) {
//                               return SubscriptionSelectionWidget(
//                                 onPlanSelected: (selectedPlan) {
//                                   final selectedSubscription =
//                                       sortedSubscriptions.firstWhere(
//                                           (plan) => plan.name == selectedPlan);
//                                   final description =
//                                       selectedSubscription.description;
//                                   final featureDescription =
//                                       describeFeatures(selectedSubscription);
//                                   _updateActivePlan(
//                                       description,
//                                       featureDescription,
//                                       selectedSubscription,
//                                       selectedDuration);
//                                 },
//                                 subscriptions: sortedSubscriptions,
//                                 // initialSelection: activeSubscriptionName,
//                               );
//                             } else {
//                               return SizedBox.shrink();
//                             }
//                           },
//                         ),
//                       if (index == 0) SizedBox(height: 30),
//                       if (index == 0)
//                         DurationSelection(
//                           selectedDuration,
//                           durations,
//                           (duration) {
//                             selectedDuration =
//                                 duration; // Update the selected duration
//                             updateSelectedDuration(newDuration); // Update selectedDuration
//
//                           },
//                         ),
//                       if (index == 0) SizedBox(height: 30),
//                       if (index == 0)
//                         Text(
//                           _currentFeature ?? features,
//                           style: TextStyle(
//                             color: AppColors.white,
//                             fontSize: 14,
//                             fontWeight: FontWeight.w400,
//                           ),
//                           textAlign: TextAlign.center,
//                         ),
//                       if (index == sortedSubscriptions.length - 1)
//                         PrimaryButton(
//                           title: 'Upgrade',
//                           invert: true,
//                           action: () {
//                             if (selectedDuration != null) {
//                               ProductDetails selectedProduct =
//                                   _getProductDetails(
//                                       _selectedSubscription?.name,
//                                       selectedDuration,
//                                       products);
//
//                               _showUpgradeDialog(
//                                   context,
//                                   _selectedSubscription?.name,
//                                   selectedDuration,
//                                   selectedProduct);
//                             } else {
//                               NotifyUser.showSnackbar(
//                                   'Select a subscription duration');
//                             }
//                           },
//                         ),
//                     ],
//                   ),
//                 ),
//               ],
//             );
//           },
//         ),
//       ),
//     ],
//   );
// }
