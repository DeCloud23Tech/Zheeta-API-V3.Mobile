// import 'dart:async';
// import 'package:flutter/gestures.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:in_app_purchase/in_app_purchase.dart';
// import 'package:url_launcher/url_launcher.dart';
// import 'package:zheeta/common/constants/color.dart';
// import 'package:zheeta/common/notify/notify_user.dart';
// import 'package:zheeta/common/services/inapp_purchase_service.dart';
// import 'package:zheeta/core/injection/di.dart';
// import 'package:zheeta/features/payment_and_subscriptions/data/model/subscription_model.dart';
// import 'package:zheeta/features/payment_and_subscriptions/presentation/widget/features_card.dart';
// import 'package:zheeta/features/payment_and_subscriptions/presentation/widget/subscription_plans.dart';
// import 'package:zheeta/features/profile/presentation/bloc/profile_cubit/profile_cubit.dart';
// import 'package:zheeta/widgets/back_button.dart';
// import 'package:zheeta/widgets/primary_button.dart';
//
// class SubscriptionDetailsScreen extends StatefulWidget {
//   final SubscriptionModel subscription;
//
//   const SubscriptionDetailsScreen({super.key, required this.subscription});
//
//   @override
//   State<SubscriptionDetailsScreen> createState() =>
//       _SubscriptionDetailsScreenState();
// }
//
// class _SubscriptionDetailsScreenState extends State<SubscriptionDetailsScreen> {
//   ProductDetails? _selectedPlan;
//   String? _selectedDuration;
//   bool _isProcessingPurchase = false;
//   final InAppPurchaseService _iapService = locator<InAppPurchaseService>();
//
//   @override
//   void initState() {
//     super.initState();
//     // Set up purchase listener
//     _iapService.listenToPurchaseUpdates(
//         _handlePurchaseUpdate, _selectedDuration ?? '');
//   }
//
//   @override
//   void dispose() {
//     _iapService.dispose();
//     super.dispose();
//   }
//
//   void _onPlanSelected(ProductDetails plan) {
//     setState(() {
//       _isProcessingPurchase = false;
//       _selectedPlan = plan;
//     });
//   }
//
//   void _getSelectedDuration(String duration) {
//     print(duration);
//     setState(() {
//       _selectedDuration = duration;
//     });
//   }
//
//   Future<void> _handlePurchaseUpdate(PurchaseDetails purchaseDetails) async {
//     if (purchaseDetails.status == PurchaseStatus.purchased) {
//       // Purchase successful
//       Navigator.of(context).pushReplacement(
//         MaterialPageRoute(
//           builder: (_) => PaymentSuccessScreen(
//             plan: widget.subscription.name.trim(),
//             // duration: _getSelectedDuration(),
//           ),
//         ),
//       );
//     } else if (purchaseDetails.status == PurchaseStatus.error) {
//       // Show error message
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text('Purchase failed: ${purchaseDetails.error?.message}'),
//           backgroundColor: Colors.red,
//         ),
//       );
//     }
//     setState(() => _isProcessingPurchase = false);
//   }
//
//   Future<void> _initiatePurchase() async {
//     if (_selectedPlan == null) {
//       setState(() => _isProcessingPurchase = false);
//       NotifyUser.showSnackBar('Please select a plan first');
//       return;
//     }
//
//     setState(() => _isProcessingPurchase = true);
//
//     try {
//       await _iapService.purchaseProduct(_selectedPlan!);
//     } catch (e) {
//       setState(() => _isProcessingPurchase = false);
//       NotifyUser.showSnackBar('Error: ${e.toString()}');
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
//         title: Container(
//           padding: const EdgeInsets.all(8.0),
//           decoration: BoxDecoration(
//             color: AppColors.white,
//             borderRadius: BorderRadius.circular(6),
//           ),
//           child: Text(
//             widget.subscription.name.trim(),
//             style: const TextStyle(
//               fontSize: 18,
//               fontWeight: FontWeight.bold,
//               color: AppColors.primaryDark,
//             ),
//             textAlign: TextAlign.center,
//           ),
//         ),
//         centerTitle: true,
//       ),
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.all(20.0),
//           child: BlocBuilder<ProfileCubit, ProfileState>(
//             builder: (context, state) {
//               if (widget.subscription.name.trim() == 'Regular') {
//                 return SingleChildScrollView(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       const Text(
//                         'Enjoy the basics for free',
//                         style: TextStyle(
//                           fontSize: 20,
//                           fontWeight: FontWeight.bold,
//                           color: AppColors.white,
//                         ),
//                       ),
//                       const SizedBox(height: 30),
//                       FeaturesCard(
//                         features: widget.subscription.features,
//                         currentPlan: widget.subscription.name.trim(),
//                       ),
//                       const SizedBox(height: 20),
//                       const Text(
//                         'Upgrade to unlock more matches, more features and more fun. Plans are billed every 1, 3, 6 and 12 months. Cancel anytime.',
//                         textAlign: TextAlign.center,
//                         style: TextStyle(
//                           fontSize: 12,
//                           color: AppColors.white,
//                         ),
//                       ),
//                     ],
//                   ),
//                 );
//               } else {
//                 return SingleChildScrollView(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         widget.subscription.name.trim() == 'Gold'
//                             ? 'Unlimited Matches. Full Access. Profile Boost Anytime'
//                             : 'See who likes You and match with them Instantly',
//                         style: const TextStyle(
//                           fontSize: 20,
//                           fontWeight: FontWeight.bold,
//                           color: AppColors.white,
//                         ),
//                       ),
//                       const SizedBox(height: 20),
//                       SubscriptionPlans(
//                         subscription: widget.subscription.name.trim(),
//                         onPlanSelected: _onPlanSelected,
//                         onDurationSelected: _getSelectedDuration,
//                       ),
//                       const SizedBox(height: 20),
//                       FeaturesCard(
//                         features: widget.subscription.features,
//                         currentPlan: widget.subscription.name.trim(),
//                       ),
//                     ],
//                   ),
//                 );
//               }
//             },
//           ),
//         ),
//       ),
//       bottomNavigationBar: Visibility(
//         visible: widget.subscription.name.trim() != 'Regular',
//         child: Padding(
//           padding: const EdgeInsets.only(left: 20, right: 20, bottom: 30),
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               RichText(
//                 textAlign: TextAlign.center,
//                 text: TextSpan(
//                   style: const TextStyle(fontSize: 12, color: AppColors.white),
//                   children: [
//                     const TextSpan(
//                       text:
//                           'By tapping Continue, you will be charged. Your subscription will auto-renew for the same price and package length until you cancel via App Store Settings. You agree to our ',
//                     ),
//                     TextSpan(
//                       text: 'Terms',
//                       style: const TextStyle(
//                         decoration: TextDecoration.underline,
//                         color: AppColors.white,
//                       ),
//                       recognizer: TapGestureRecognizer()
//                         ..onTap = () async {
//                           const url =
//                               'https://www.zheeta.com/policy/terms-and-conditions';
//                           if (await canLaunchUrl(Uri.parse(url))) {
//                             await launchUrl(Uri.parse(url),
//                                 mode: LaunchMode.inAppWebView);
//                           }
//                         },
//                     ),
//                     const TextSpan(text: '.'),
//                   ],
//                 ),
//               ),
//               const SizedBox(height: 20),
//               PrimaryButton(
//                 title: _selectedPlan == null ? 'Continue' : 'Continue',
//                 // : 'Continue – ${_selectedPlan!.price}',
//                 invert: true,
//                 state: _isProcessingPurchase,
//                 action: _initiatePurchase,
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class PaymentSuccessScreen extends StatelessWidget {
//   final String plan;
//
//   // final String duration;
//
//   const PaymentSuccessScreen({
//     super.key,
//     required this.plan,
//     // required this.duration,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.primaryDark,
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.all(20.0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               const Icon(Icons.check_circle, size: 100, color: Colors.green),
//               const SizedBox(height: 20),
//               Text(
//                 'Payment Successful!',
//                 style: TextStyle(
//                   fontSize: 24,
//                   fontWeight: FontWeight.bold,
//                   color: AppColors.white,
//                 ),
//               ),
//               const SizedBox(height: 20),
//               Text(
//                 'You have successfully subscribed to the $plan plan (duration)',
//                 textAlign: TextAlign.center,
//                 style: TextStyle(
//                   fontSize: 16,
//                   color: AppColors.white,
//                 ),
//               ),
//               const SizedBox(height: 40),
//               PrimaryButton(
//                 title: 'Continue to App',
//                 action: () {
//                   final ProfileCubit profileCubit = locator<ProfileCubit>();
//                   profileCubit.getSingleUserProfileCubit();
//
//                   Navigator.of(context).pop();
//                 },
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
