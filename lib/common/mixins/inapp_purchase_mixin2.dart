// import 'dart:convert';
// import 'package:flutter/foundation.dart'
//     show defaultTargetPlatform, TargetPlatform;
// import 'package:flutter/material.dart';
// import 'package:in_app_purchase/in_app_purchase.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:http/http.dart' as http;
// import 'package:zheeta/app/common/utils/token_utils.dart';
// import 'package:zheeta/payment_and_subscriptions/data/model/subscription_model.dart';
// import 'package:zheeta/widgets/primary_button.dart';
//
// mixin InAppPurchaseMixin<T extends StatefulWidget> on State<T> {
//   // Webhook URLs for Android and iOS
//   final String androidWebhookUrl =
//       'https://test-api.zheeta.com/api/webhook/verify-android-sub-plan';
//   final String iosWebhookUrl =
//       'https://test-api.zheeta.com/api/webhook/verify-ios-sub-plan';
//
//   final InAppPurchase inAppPurchase = InAppPurchase.instance;
//   final Set<String> androidProductIds = {'gold_plan', 'silver_plan'};
//   final Set<String> iosProductIds = {
//     'gold_plan_monthly',
//     'gold_plan_3months',
//     'gold_plan_6months',
//     'gold_plan_yearly',
//     'silver_plan_monthly',
//     'silver_plan_3months',
//     'silver_plan_6months',
//     'silver_plan_yearly'
//   };
//   List<ProductDetails> products = [];
//   bool available = true;
//   String? currentPlan;
//   String? currentDescription;
//   String? currentFeature;
//   SubscriptionModel? selectedSubscription;
//   String? selectedDuration;
//
//   List<String> durations = ['1 month', '3 months', '6 months', '1 year'];
//
//   String describeFeatures(SubscriptionModel subscription) {
//     List<String> features = [];
//
//     features.add(
//         '- Messaging is ${subscription.allowMessaging ? 'enabled' : 'disabled'}.');
//     features.add(
//         '- You can view up to ${subscription.noMatchesPerDay} matches per day.');
//     features.add(
//         '- You can make up to ${subscription.noOfBuddyEventPerWeek} buddy events per week.');
//     features.add(
//         '- You can explore nearby users up to ${subscription.noNearbyPerWeek} users per week.');
//     features.add(
//         '- Withdrawals are ${subscription.allowWithdrawal ? 'allowed' : 'not allowed'}.');
//     features.add(subscription.allowMultipleMediaInPost
//         ? '- You can include up to ${subscription.maxNumberOfMediaInPost} media files in a single post.'
//         : '- Multiple media files in a single post are not allowed.');
//     features.add(
//         '- Posting videos is ${subscription.allowVideoMediaCategoryInPost ? 'allowed' : 'not allowed'}.');
//     features.add(
//         '- Creating new communities is ${subscription.allowCreateCommunity ? 'allowed' : 'not allowed'}.');
//     features.add(subscription.accessPeopleNearby
//         ? '- You can access people nearby.'
//         : '- Access to people nearby is not available.');
//
//     return "Features:\n${features.join('\n')}";
//   }
//
//   Future<void> loadProducts() async {
//     print(available);
//     available = await inAppPurchase.isAvailable();
//     if (!available) return;
//
//     Set<String> productIds = defaultTargetPlatform == TargetPlatform.iOS
//         ? iosProductIds
//         : defaultTargetPlatform == TargetPlatform.android
//             ? androidProductIds
//             : {};
//
//     final response = await inAppPurchase.queryProductDetails(productIds);
//     print('response');
//     print(response);
//
//     if (response.error == null && response.productDetails.isNotEmpty) {
//       setState(() {
//         products = response.productDetails;
//       });
//     }
//   }
//
//   Future<void> verifyPurchase(PurchaseDetails purchaseDetails, String selectedDuration) async {
//     print('hrer');
//     if (androidProductIds.contains(purchaseDetails.productID) ||
//         iosProductIds.contains(purchaseDetails.productID)) {
//       setState(() {
//         currentPlan = purchaseDetails.productID;
//       });
//       await sendDataToWebhook(purchaseDetails, selectedDuration);
//     }
//   }
//
//   Future<void> sendDataToWebhook(PurchaseDetails purchaseDetails, String selectedDuration) async {
//
//     // Get the user ID using TokenUtil
//     final String? userId = await TokenUtil.getUserId();
//
//     // Get the selected plan (use the existing state or method for the plan)
//     final String selectedPlan = currentPlan!; // You can get the selected plan from state
//
//     // Prepare the payload based on the platform
//     final Map<String, dynamic> data = defaultTargetPlatform == TargetPlatform.iOS
//         ? _prepareIosPayload(purchaseDetails, userId!, selectedPlan, selectedDuration)
//         : _prepareAndroidPayload(purchaseDetails, userId!, selectedPlan, selectedDuration);
//
//     // Select the appropriate webhook URL
//     final String webhookUrl = defaultTargetPlatform == TargetPlatform.iOS
//         ? iosWebhookUrl
//         : androidWebhookUrl;
//
//     print('data');
//     print(data);
//     try {
//       // Send the data to the webhook
//       final response = await http.post(
//         Uri.parse(webhookUrl),
//         headers: {'Content-Type': 'application/json'},
//         body: json.encode(data),
//       );
//
//       // Handle the response
//       if (response.statusCode == 200) {
//         print('Webhook sent successfully: ${response.body}');
//       } else {
//         print('Failed to send webhook: ${response.statusCode}, ${response.body}');
//       }
//     } catch (e) {
//       print('Error sending webhook: $e');
//     }
//   }
//
//   Map<String, dynamic> _prepareAndroidPayload(
//       PurchaseDetails purchaseDetails,
//       String userId, // Pass userId
//       String selectedPlan, // Pass selectedPlan
//       String selectedDuration, // Pass selectedPlan
//       ) {
//     return {
//       "version": "1.0",
//       "packageName": "com.decloud23tech.zheeta",
//       "eventTimeMillis": DateTime.now().millisecondsSinceEpoch,
//       "userId": userId,  // Include userId
//       "selectedPlan": selectedPlan,  // Include selected plan
//       "selectedDuration": selectedDuration,  // Include selected plan
//       "subscriptionNotification": {
//         "version": "1.0",
//         "notificationType": 1,
//         "purchaseToken": purchaseDetails.verificationData.serverVerificationData,
//         "subscriptionId": purchaseDetails.productID,
//       }
//     };
//   }
//
//   Map<String, dynamic> _prepareIosPayload(
//       PurchaseDetails purchaseDetails,
//       String userId, // Pass userId
//       String selectedPlan,
//       String selectedDuration, // Pass selectedPlan
//       ) {
//     return {
//       "id": purchaseDetails.purchaseID,
//       "bundleId": "com.decloud23tech.zheeta",
//       "transactionId": purchaseDetails.purchaseID,
//       "userId": userId,  // Include userId
//       "selectedPlan": selectedPlan,  // Include selected plan
//       "selectedDuration": selectedDuration,  // Include selected plan
//       "data": purchaseDetails.verificationData.localVerificationData,
//     };
//   }
//
//
//   // Future<void> sendDataToWebhook(PurchaseDetails purchaseDetails) async {
//   //   final webhookUrl =
//   //       'https://test-api.zheeta.com/api/webhook/verify-android-sub-plan';
//   //   'https://test-api.zheeta.com/api/webhook/verify-ios-sub-plan';
//   //       // 'https://webhook.site/3951e052-1576-4c6b-98df-412533190533';
//   //   final data = defaultTargetPlatform == TargetPlatform.iOS
//   //       ? {'receipt': purchaseDetails.verificationData.localVerificationData}
//   //       : {'purchaseToken': purchaseDetails.purchaseID};
//   //
//   //   try {
//   //     final response = await http.post(
//   //       Uri.parse(webhookUrl),
//   //       headers: {'Content-Type': 'application/json'},
//   //       body: json.encode(data),
//   //     );
//   //     print('response');
//   //     print(response.body);
//   //     print(response.statusCode == 200
//   //         ? 'Webhook sent'
//   //         : 'Failed to send webhook');
//   //   } catch (e) {
//   //     print('Webhook error: $e');
//   //   }
//   // }
//
//   void updateActivePlan(String description, String feature,
//       SubscriptionModel selectedSubscription, String? selectedDuration) {
//     setState(() {
//       currentDescription = description;
//       currentFeature = feature;
//       this.selectedSubscription = selectedSubscription;
//       this.selectedDuration = selectedDuration;
//     });
//   }
//
//   // Function to get the appropriate product based on selected subscription and duration
//   ProductDetails? getProductDetails(
//     String? selectedSubscriptionName,
//     String? selectedDuration,
//     List<ProductDetails> products,
//   ) {
//     // Normalize inputs for case-insensitive comparison
//     final normalizedSubscriptionName =
//         selectedSubscriptionName?.trim().toLowerCase();
//     final normalizedDuration = selectedDuration?.trim().toLowerCase();
//     // Early exit if products are insufficient
//     if (products.length < 8) {
//       print('Error: Insufficient products in the list');
//       return null;
//     }
//
//     // Define product indices for iOS and Android
//     final productIndexMap = {
//       'gold': {
//         '1 month': defaultTargetPlatform == TargetPlatform.iOS ? 7 : 0,
//         '3 months': defaultTargetPlatform == TargetPlatform.iOS ? 3 : 1,
//         '6 months': defaultTargetPlatform == TargetPlatform.iOS ? 5 : 2,
//         '1 year': defaultTargetPlatform == TargetPlatform.iOS ? 4 : 3,
//       },
//       'silver': {
//         '1 month': defaultTargetPlatform == TargetPlatform.iOS ? 6 : 4,
//         '3 months': defaultTargetPlatform == TargetPlatform.iOS ? 0 : 5,
//         '6 months': defaultTargetPlatform == TargetPlatform.iOS ? 1 : 6,
//         '1 year': defaultTargetPlatform == TargetPlatform.iOS ? 2 : 7,
//       }
//     };
//
//     // Retrieve the correct index based on subscription and duration
//     final index =
//         productIndexMap[normalizedSubscriptionName]?[normalizedDuration];
//
//     // Check if a valid index was found
//     if (index != null && index < products.length) {
//       return products[index];
//     } else {
//       print('Error: Subscription or duration not matched');
//       return null;
//     }
//   }
//
//   void showUpgradeDialog(BuildContext context, String selectedPlan,
//       String selectedDuration, ProductDetails product) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           content: RichText(
//             textAlign: TextAlign.center,
//             text: TextSpan(
//               style: DefaultTextStyle.of(context).style.copyWith(fontSize: 16),
//               children: [
//                 TextSpan(text: 'You’re about to subscribe for '),
//                 TextSpan(
//                   text: '$selectedPlan $selectedDuration',
//                   style: TextStyle(fontWeight: FontWeight.bold),
//                 ),
//                 TextSpan(text: ' membership for'),
//                 TextSpan(
//                   text: ' (${product.currencyCode} ${product.rawPrice}0)',
//                   style: TextStyle(fontWeight: FontWeight.bold),
//                 ),
//               ],
//             ),
//           ),
//           actions: <Widget>[
//             Column(
//               children: [
//                 PrimaryButton(
//                   title: 'Confirm payment',
//                   action: () {
//                     Navigator.of(context).pop();
//                     inAppPurchase.buyNonConsumable(
//                         purchaseParam: PurchaseParam(productDetails: product));
//                   },
//                 ),
//                 SizedBox(height: 10),
//                 PrimaryButton(
//                   title: 'Cancel',
//                   invert: true,
//                   action: () {
//                     Navigator.of(context).pop();
//                   },
//                 ),
//               ],
//             ),
//           ],
//         );
//       },
//     );
//   }
// }
