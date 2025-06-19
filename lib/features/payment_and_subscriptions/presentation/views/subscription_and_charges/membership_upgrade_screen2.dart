// import 'dart:async';
// import 'package:auto_route/auto_route.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_spinkit/flutter_spinkit.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:in_app_purchase/in_app_purchase.dart';
// import 'package:zheeta/common/constants/color.dart';
// import 'package:zheeta/common/notify/notify_user.dart';
// import 'package:zheeta/common/services/inapp_purchase_service.dart';
// import 'package:zheeta/core/injection/di.dart';
// import 'package:zheeta/features/payment_and_subscriptions/data/model/subscription_model.dart';
// import 'package:zheeta/features/payment_and_subscriptions/presentation/bloc/subscription/subscription_cubit.dart';
// import 'package:zheeta/features/payment_and_subscriptions/presentation/widget/duration_selection.dart';
// import 'package:zheeta/features/payment_and_subscriptions/presentation/widget/subscription_selection.dart';
// import 'package:zheeta/features/profile/presentation/bloc/profile_cubit/profile_cubit.dart';
// import 'package:zheeta/widgets/back_button.dart';
// import 'package:zheeta/widgets/error_page.dart';
// import 'package:zheeta/widgets/loader.dart';
// import 'package:zheeta/widgets/primary_button.dart';
//
// @RoutePage()
// class MembershipSubscriptionScreen extends StatefulWidget {
//   const MembershipSubscriptionScreen({super.key});
//
//   @override
//   State<MembershipSubscriptionScreen> createState() =>
//       _MembershipSubscriptionScreenState();
// }
//
// class _MembershipSubscriptionScreenState
//     extends State<MembershipSubscriptionScreen> {
//   late StreamSubscription<List<PurchaseDetails>> _subscription;
//   final ProfileCubit _profileCubit = locator<ProfileCubit>();
//   final SubscriptionCubit _subscriptionCubit = locator<SubscriptionCubit>();
//   final InAppPurchaseService _inAppPurchaseService =
//       InAppPurchaseService(); // Instantiate the service
//
//   @override
//   void initState() {
//     super.initState();
//     _subscription = _inAppPurchaseService.inAppPurchase.purchaseStream.listen(
//       _handlePurchaseUpdates,
//       onError: (error) {
//         NotifyUser.showSnackBar(
//             'An error occurred during the purchase process');
//       },
//     );
//     _inAppPurchaseService.loadProducts(); // Load products using the service
//   }
//
//   @override
//   void dispose() {
//     _subscription.cancel();
//     super.dispose();
//   }
//
//   void _handlePurchaseUpdates(List<PurchaseDetails> purchaseDetailsList) {
//     for (var purchaseDetails in purchaseDetailsList) {
//       if (purchaseDetails.status == PurchaseStatus.purchased) {
//         _inAppPurchaseService.verifyPurchase(purchaseDetails, _inAppPurchaseService.selectedDuration!);
//       }
//       if (purchaseDetails.pendingCompletePurchase) {
//         _inAppPurchaseService.inAppPurchase.completePurchase(purchaseDetails);
//       }
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.primaryDark,
//       appBar: AppBar(
//         backgroundColor: AppColors.primaryDark,
//         elevation: 0.0,
//         leading: AppBackButton(),
//         title: Text(
//           'Membership',
//           style: TextStyle(
//             color: AppColors.white,
//             fontSize: 24,
//             fontWeight: FontWeight.w600,
//           ),
//         ),
//         centerTitle: true,
//       ),
//       body: SafeArea(child: _buildProductList()),
//     );
//   }
//
//   Widget _buildProductList() {
//     return BlocBuilder<SubscriptionCubit, SubscriptionState>(
//       builder: (context, state) {
//         if (state is SubscriptionsError) {
//           return ErrorPage(
//             onTryAgain: () {
//               _profileCubit.getSingleUserProfileCubit();
//               _subscriptionCubit.getAllSubscriptionCubit();
//             },
//           );
//         }
//
//         if (state is SubscriptionsSuccess) {
//           final subscriptions = state.subscriptions;
//           final sortedSubscriptions =
//               List<SubscriptionModel>.from(subscriptions.data)
//                 ..sort((a, b) => a.id.compareTo(b.id));
//           return Column(
//             children: [
//               SizedBox(height: 15),
//               Image.asset('assets/images/membership.png'),
//               Expanded(
//                 child: ListView.builder(
//                   itemCount: sortedSubscriptions.length,
//                   itemBuilder: (context, index) {
//                     final subscription = sortedSubscriptions[index];
//                     final features =
//                     _inAppPurchaseService.describeFeatures(subscription);
//
//                     return Column(
//                       children: [
//                         Padding(
//                           padding: const EdgeInsets.symmetric(
//                               horizontal: 20.0, vertical: 10.0),
//                           child: Column(
//                             children: [
//                               if (index == 0)
//                                 InkWell(
//                                   onTap: () {
//                                     _profileCubit.getSingleUserProfileCubit();
//                                   },
//                                   child: SvgPicture.asset(
//                                       'assets/images/icons/gradient-refresh.svg'),
//                                 ),
//                               if (index == 0)
//                                 BlocBuilder<ProfileCubit, ProfileState>(
//                                   builder: (context, state) {
//                                     if (state is ProfileLoadedState) {
//                                       return Text(
//                                         'Active: ${state.profile?.data?.userSubscription?.name ?? "None"}',
//                                         style: TextStyle(
//                                           color: AppColors.white,
//                                           fontSize: 20,
//                                           fontWeight: FontWeight.w600,
//                                         ),
//                                       );
//                                     } else {
//                                       return Padding(
//                                         padding: const EdgeInsets.all(8.0),
//                                         child: SpinKitThreeBounce(
//                                           color: AppColors.white,
//                                           size: 18,
//                                         ),
//                                       );
//                                     }
//                                   },
//                                 ),
//                               if (index == 0) SizedBox(height: 15),
//                               if (index == 0)
//                                 Text(
//                                   _inAppPurchaseService.currentDescription ??
//                                       subscription.description ??
//                                       '',
//                                   style: TextStyle(
//                                     color: AppColors.white,
//                                     fontSize: 14,
//                                     fontWeight: FontWeight.w400,
//                                   ),
//                                   textAlign: TextAlign.center,
//                                 ),
//                               if (index == 0)
//                                 SubscriptionSelectionWidget(
//                                   onPlanSelected: (selectedPlan) {
//                                     final selectedSubscription =
//                                     sortedSubscriptions.firstWhere((plan) =>
//                                     plan.name == selectedPlan);
//                                     _inAppPurchaseService.updateActivePlan(
//                                       selectedSubscription.description ?? '',
//                                       _inAppPurchaseService.describeFeatures(
//                                           selectedSubscription),
//                                       selectedSubscription,
//                                       _inAppPurchaseService.selectedDuration,
//                                     );
//                                     setState(() {});
//                                   },
//                                   subscriptions: sortedSubscriptions,
//                                 ),
//                               if (index == 0)
//                                 DurationSelection(
//                                   _inAppPurchaseService.selectedDuration,
//                                   _inAppPurchaseService.durations,
//                                       (duration) {
//                                     setState(() {
//                                       _inAppPurchaseService.selectedDuration =
//                                           duration;
//                                     });
//                                   },
//                                 ),
//                               if (index == 0) SizedBox(height: 30),
//                               if (index == 0)
//                                 Text(
//                                   _inAppPurchaseService.currentFeature ??
//                                       features,
//                                   style: TextStyle(
//                                     color: AppColors.white,
//                                     fontSize: 14,
//                                     fontWeight: FontWeight.w400,
//                                   ),
//                                   textAlign: TextAlign.center,
//                                 ),
//                               if (index == sortedSubscriptions.length - 1)
//                                 PrimaryButton(
//                                   title: 'Upgrade',
//                                   invert: true,
//                                   action: () {
//                                     if (_inAppPurchaseService
//                                         .selectedDuration !=
//                                         null) {
//                                       final selectedProduct =
//                                       _inAppPurchaseService
//                                           .getProductDetails(
//                                         _inAppPurchaseService
//                                             .selectedSubscription?.name,
//                                         _inAppPurchaseService.selectedDuration,
//                                         _inAppPurchaseService.products,
//                                       );
//                                       if (selectedProduct != null) {
//                                         _inAppPurchaseService.showUpgradeDialog(
//                                           context,
//                                           _inAppPurchaseService
//                                               .selectedSubscription!.name,
//                                           _inAppPurchaseService
//                                               .selectedDuration!,
//                                           selectedProduct,
//                                         );
//                                       } else {
//                                         NotifyUser.showSnackBar(
//                                             'Unable to find product details.');
//                                       }
//                                     } else {
//                                       NotifyUser.showSnackBar(
//                                           'Select a subscription duration');
//                                     }
//                                   },
//                                 ),
//                             ],
//                           ),
//                         ),
//                       ],
//                     );
//                   },
//                 ),
//               ),
//             ],
//           );
//
//
//         }
//
//         return SizedBox.shrink();
//       },
//     );
//   }
// }
