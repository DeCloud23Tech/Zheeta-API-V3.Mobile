// import 'dart:async';
// import 'dart:convert';
// import 'dart:io';
//
// import 'package:flutter/foundation.dart';
// import 'package:in_app_purchase/in_app_purchase.dart';
// import 'package:http/http.dart' as http;
// import 'package:injectable/injectable.dart';
// import 'package:url_launcher/url_launcher.dart';
// import 'package:zheeta/utils/token_utils.dart';
//
// @prod
// @LazySingleton()
// class InAppPurchaseService {
//   final InAppPurchase inAppPurchase = InAppPurchase.instance;
//
//   final String androidWebhookUrl =
//       'https://test-api.zheeta.com/api/webhook/verify-android-sub-plan';
//   final String iosWebhookUrl =
//       'https://test-api.zheeta.com/api/webhook/verify-apple-sub-plan';
//
//   // Updated product IDs (ensure these match exactly with Play Console/App Store Connect)
//   final Set<String> androidGold = {'gold_plan'};
//   final Set<String> androidSilver = {'silver_plan'};
//
//   final Set<String> iosGold = {
//     'gold_plan_monthly',
//     'gold_plan_3months',
//     'gold_plan_6months',
//     'gold_plan_yearly',
//   };
//
//   final Set<String> iosSilver = {
//     'silver_plan_monthly',
//     'silver_plan_3months',
//     'silver_plan_6months',
//     'silver_plan_yearly',
//   };
//
//   StreamSubscription<List<PurchaseDetails>>? _subscription;
//   String? currentPlan;
//
//   @PostConstruct()
//   Future<void> initialize() async {
//     final bool available = await inAppPurchase.isAvailable();
//     if (!available) {
//       debugPrint('In-App Purchases not available');
//       return;
//     }
//
//     // Listen to purchase updates
//     _subscription = inAppPurchase.purchaseStream.listen(
//       _handlePurchaseUpdates,
//       onDone: () => _subscription?.cancel(),
//       onError: (error) => debugPrint('Purchase error: $error'),
//     );
//   }
//
//   /// Load available products and sort by price
//   Future<List<Map<String, dynamic>>> loadProducts(String subscription) async {
//     try {
//       final bool available = await inAppPurchase.isAvailable();
//       if (!available) {
//         debugPrint('IAP not available');
//         return [];
//       }
//
//       // Get the correct product IDs based on platform and subscription type
//       Set<String> productIds;
//       if (Platform.isIOS) {
//         productIds = subscription.toLowerCase() == 'gold' ? iosGold : iosSilver;
//       } else if (Platform.isAndroid) {
//         productIds =
//         subscription.toLowerCase() == 'gold' ? androidGold : androidSilver;
//       } else {
//         return [];
//       }
//
//       debugPrint('Querying products: $productIds');
//
//       final ProductDetailsResponse response =
//       await inAppPurchase.queryProductDetails(productIds);
//
//       if (response.notFoundIDs.isNotEmpty) {
//         debugPrint('These product IDs were not found: ${response.notFoundIDs}');
//       }
//
//       if (response.error != null) {
//         debugPrint('Error querying products: ${response.error}');
//         return [];
//       }
//
//       if (response.productDetails.isEmpty) {
//         debugPrint('No products found');
//         return [];
//       }
//
//       // Sort products by price (ascending)
//       final sortedProducts = List<ProductDetails>.from(response.productDetails)
//         ..sort((a, b) => a.rawPrice.compareTo(b.rawPrice));
//
//       // Generate metadata for display
//       return _generateProductMetadata(
//           sortedProducts, subscription.toLowerCase());
//     } catch (e) {
//       debugPrint('Error loading products: $e');
//       return [];
//     }
//   }
//
//   List<Map<String, dynamic>> _generateProductMetadata(
//       List<ProductDetails> products, String subscriptionType) {
//     final List<Map<String, dynamic>> result = [];
//
//     for (int i = 0; i < products.length; i++) {
//       final product = products[i];
//
//       final metadata = {
//         "duration": _getDurationLabel(i),
//         "price": product.price,
//         // ✅ Dynamic localized price (currency safe)
//         // Optional: keep discount as a **display label only**, not affecting price
//         if (i > 0) "discount": _getDiscountLabel(i),
//       };
//
//       result.add({
//         "product": product,
//         ...metadata,
//       });
//     }
//
//     return result;
//   }
//
//   String _getDurationLabel(int index) {
//     switch (index) {
//       case 0:
//         return "1 month";
//       case 1:
//         return "3 months";
//       case 2:
//         return "6 months";
//       case 3:
//         return "12 months";
//       default:
//         return "";
//     }
//   }
//
//   String _getDiscountLabel(int index) {
//     switch (index) {
//       case 1:
//         return "10% off";
//       case 2:
//         return "20% off";
//       case 3:
//         return "30% off";
//       default:
//         return "";
//     }
//   }
//
//   /// Trigger purchase flow
//   Future<void> purchaseProduct(ProductDetails product) async {
//     try {
//       final purchaseParam = PurchaseParam(productDetails: product);
//       await inAppPurchase.buyNonConsumable(
//           purchaseParam:
//           purchaseParam); // Assuming subscriptions are non-consumable in this context
//     } catch (e) {
//       debugPrint('Error purchasing product: $e');
//       rethrow;
//     }
//   }
//
//   /// Handle purchase updates
//   Future<void> _handlePurchaseUpdates(List<PurchaseDetails> purchases) async {
//     for (final purchase in purchases) {
//       if (purchase.status == PurchaseStatus.purchased ||
//           purchase.status == PurchaseStatus.restored) {
//         await _verifyAndCompletePurchase(purchase);
//       } else if (purchase.status == PurchaseStatus.error) {
//         debugPrint('Purchase error: ${purchase.error}');
//       }
//     }
//   }
//
//   /// Verify purchase with backend and complete the purchase
//   Future<void> _verifyAndCompletePurchase(PurchaseDetails purchase) async {
//     try {
//       currentPlan = purchase.productID;
//       await sendDataToWebhook(purchase);
//       if (purchase.pendingCompletePurchase) {
//         await inAppPurchase.completePurchase(purchase);
//         debugPrint('Purchase completed for ${purchase.productID}');
//       }
//     } catch (e) {
//       debugPrint('Error verifying and completing purchase: $e');
//     }
//   }
//
//   /// Verify purchase with backend
//   Future<void> verifyPurchase(PurchaseDetails purchase) async {
//     try {
//       currentPlan = purchase.productID;
//       await sendDataToWebhook(purchase);
//     } catch (e) {
//       debugPrint('Error verifying purchase: $e');
//     }
//   }
//
//   /// Send data to webhook
//   Future<void> sendDataToWebhook(PurchaseDetails purchase) async {
//     final String? userId = await TokenUtil.getUserId();
//     if (userId == null) {
//       debugPrint('User ID not found');
//       return;
//     }
//
//     final String webhookUrl =
//     Platform.isIOS ? iosWebhookUrl : androidWebhookUrl;
//     final Map<String, dynamic> payload = Platform.isIOS
//         ? _prepareIosPayload(purchase, userId)
//         : _prepareAndroidPayload(purchase, userId);
//
//     try {
//       final response = await http.post(
//         Uri.parse(webhookUrl),
//         headers: {'Content-Type': 'application/json'},
//         body: json.encode(payload),
//       );
//
//       if (response.statusCode == 200) {
//         debugPrint('Webhook success: ${response.body}');
//       } else {
//         debugPrint('Webhook failed: ${response.statusCode} - ${response.body}');
//       }
//     } catch (e) {
//       debugPrint('Error sending webhook: $e');
//     }
//   }
//
//   Map<String, dynamic> _prepareAndroidPayload(
//       PurchaseDetails purchase, String userId) {
//     return {
//       "version": "1.0",
//       "packageName": "com.decloud23tech.zheeta",
//       "eventTimeMillis": DateTime.now().millisecondsSinceEpoch,
//       "userId": userId,
//       "subscriptionNotification": {
//         "version": "1.0",
//         "notificationType": 1,
//         "purchaseToken": purchase.verificationData.serverVerificationData,
//         "subscriptionId": purchase.productID,
//       }
//     };
//   }
//
//   Map<String, dynamic> _prepareIosPayload(
//       PurchaseDetails purchase, String userId) {
//     return {
//       "id": purchase.productID,
//       "bundleId": "com.decloud23tech.zheeta",
//       "transactionId": purchase.purchaseID,
//       "data": purchase.verificationData.localVerificationData,
//       "userId": userId,
//     };
//   }
//
//   /// Restore purchases
//   Future<void> restorePurchases() async {
//     try {
//       await inAppPurchase.restorePurchases();
//     } catch (e) {
//       debugPrint('Error restoring purchases: $e');
//     }
//   }
//
//   /// Launches the appropriate subscription management page for the user
//   Future<void> cancelSubscription(String plan) async {
//     final String url;
//
//     if (Platform.isAndroid) {
//       // Replace with your app's package name
//       const packageName = "com.decloud23tech.zheeta";
//
//       // Open Google Play's subscription center for your app
//       url =
//       "https://play.google.com/store/account/subscriptions?package=$packageName";
//     } else if (Platform.isIOS) {
//       // Apple’s subscription management URL
//       url = "https://apps.apple.com/account/subscriptions";
//     } else {
//       throw UnsupportedError("Unsupported platform");
//     }
//
//     if (await canLaunchUrl(Uri.parse(url))) {
//       await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
//     } else {
//       debugPrint("Could not launch subscription cancellation URL.");
//       throw Exception("Unable to open subscription management page.");
//     }
//   }
//
//   /// Dispose
//   @disposeMethod
//   void dispose() {
//     _subscription?.cancel();
//   }
// }
