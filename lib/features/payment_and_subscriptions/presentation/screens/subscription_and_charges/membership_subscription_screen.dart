import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:zheeta/core/constants/color.dart';
import 'package:zheeta/core/services/inapp_purchase_service.dart';
import 'package:zheeta/core/utils/notify.dart';
import 'package:zheeta/di/di.dart';
import 'package:zheeta/features/payment_and_subscriptions/presentation/cubits/subscription_cubit/subscription_cubit.dart';
import 'package:zheeta/features/payment_and_subscriptions/presentation/screens/subscription_and_charges/subscription_details_screen.dart';
import 'package:zheeta/features/profile/presentation/cubits/profile_cubit/profile_cubit.dart';
import 'package:zheeta/shared/widgets/back_button.dart';
import 'package:zheeta/shared/widgets/error_page.dart';
import 'package:zheeta/shared/widgets/primary_button.dart';

@RoutePage()
class MembershipSubscriptionScreen extends StatefulWidget {
  const MembershipSubscriptionScreen({super.key});

  @override
  State<MembershipSubscriptionScreen> createState() =>
      _MembershipSubscriptionScreenState();
}

class _MembershipSubscriptionScreenState
    extends State<MembershipSubscriptionScreen> {
  final ProfileCubit _profileCubit = locator<ProfileCubit>();
  final SubscriptionCubit _subscriptionCubit = locator<SubscriptionCubit>();

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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 15),
              Image.asset('assets/images/membership.png'),
              const SizedBox(height: 20),
              _buildProductList(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildReloadPlanButton(String activePlan) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            _profileCubit.getSingleUserProfileCubit();
          },
          child: SvgPicture.asset('assets/images/icons/gradient-refresh.svg'),
        ),
        Text(
          'Active: $activePlan',
          style: TextStyle(
            color: AppColors.white,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }

  Widget _buildProductList() {
    return BlocBuilder<SubscriptionCubit, SubscriptionState>(
      builder: (context, state) {
        if (state is SubscriptionsErrorState) {
          return ErrorPage(
            onTryAgain: () {
              // _profileCubit.getSingleUserProfileCubit();
              _subscriptionCubit.getAllSubscriptionCubit();
            },
          );
        }

        if (state is SubscriptionDataState) {
          final subscriptions = state.subscriptions?.data;
          return BlocBuilder<ProfileCubit, ProfileState>(
            builder: (context, profileState) {
              final activePlan =
                  profileState.profile?.data?.userSubscription?.name;
              // Sort subscriptions by id before building the ListView
              final sortedSubscriptions = List.from(subscriptions ?? [])
                ..sort((a, b) => a.id.compareTo(b.id));

              return Column(
                children: [
                  _buildReloadPlanButton(activePlan ?? ''),
                  SizedBox(height: 10),
                  ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: sortedSubscriptions.length,
                    itemBuilder: (context, index) {
                      final subscription = sortedSubscriptions[index];
                      final bool isActive = subscription.name ==
                          profileState.profile?.data?.userSubscription?.name;
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        child: Container(
                          decoration: BoxDecoration(
                            color: isActive
                                ? AppColors.white
                                : AppColors.primaryDark,
                            borderRadius: BorderRadius.circular(12),
                            border:
                                Border.all(color: AppColors.white, width: .8),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black12,
                                blurRadius: 6,
                                offset: Offset(0, 3),
                              ),
                            ],
                          ),
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                subscription.name.trim(),
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: isActive
                                      ? AppColors.primaryDark
                                      : AppColors.white,
                                ),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                subscription.description?.trim() ?? '',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: isActive
                                      ? AppColors.primaryDark
                                      : AppColors.white,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(height: 10),
                              SizedBox(
                                height: 40,
                                width: 200,
                                child: PrimaryButton(
                                  title:
                                      'Explore ${subscription.name.trim()}   >',
                                  fontSize: 14,
                                  invert: isActive ? false : true,
                                  action: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            SubscriptionDetailsScreen(
                                          subscription: subscription,
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ],
              );
            },
          );
        }

        return SizedBox.shrink();
      },
    );
  }

  Widget _buildBottomNavigationBar() {
    final InAppPurchaseService iapService = locator<InAppPurchaseService>();

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) {
          final activePlan =
              state.profile?.data?.userSubscription!.name?.trim();
          return Visibility(
            visible: activePlan != 'Regular',
            child: PrimaryButton(
              title: 'Cancel Subscription',
              invert: true,
              action: () async {
                if (activePlan == 'Gold') {
                  // User is upgrading from Silver to Gold. Handle cancellation of Silver plan if needed
                  await iapService.cancelSubscription(activePlan ?? '');
                  NotifyUser.showSnackBar(
                      'Your Silver subscription has been canceled. Upgrading to Gold.');

                  // Call your server to update the user's plan
                  // await _updateUserPlan('Gold');  // Assuming Gold is the new active plan
                } else if (activePlan == 'Silver') {
                  // User is downgrading from Gold to Silver, handle cancellation of Gold plan if needed
                  await iapService.cancelSubscription(activePlan ?? '');
                  NotifyUser.showSnackBar(
                      'Your Gold subscription has been canceled. Upgrading to Silver.');

                  // Call your server to update the user's plan
                  // await _updateUserPlan('Silver');  // Assuming Silver is the new active plan
                }
              },
            ),
          );
        },
      ),
    );
  }
}
