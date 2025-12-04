import 'dart:async';
import 'package:app_links/app_links.dart';
import 'package:flutter/foundation.dart'; // Import for debugPrint
import 'package:injectable/injectable.dart';

class DeepLinkService {
  late AppLinks _appLinks;
  StreamSubscription<Uri>? _linkSubscription;

  DeepLinkService();

  Future<void> initialize() async {
    _appLinks = AppLinks();
    // Get the initial deep link if the app was launched with one
    try {
      final initialUri = await _appLinks.getInitialLink();
      if (initialUri != null) {
        debugPrint('App launched with deep link: $initialUri');
        _handleReferralLink(initialUri);
      }
    } catch (e, stackTrace) {
      debugPrint('Error getting initial deep link: $e\n$stackTrace');
      // Potentially log to a crash reporting service
    }

    // Listen for incoming deep links while the app is running
    _linkSubscription = _appLinks.uriLinkStream.listen(
      (uri) {
        debugPrint('Received deep link: $uri');
        _handleReferralLink(uri);
      },
      onError: (error, stackTrace) {
        // Log errors that occur within the deep link stream
        debugPrint('Error in deep link stream: $error\n$stackTrace');
        // You might want to send this error to a crash reporting service
        // e.g., Firebase Crashlytics
      },
      onDone: () {
        // This callback is invoked when the stream is closed.
        // For AppLinks, this typically means the underlying platform channel is no longer listening.
        debugPrint('Deep link stream finished or closed.');
      },
    );
  }

  void _handleReferralLink(Uri uri) {
    final referralCode = _extractReferralCode(uri);
    if (referralCode != null) {
      debugPrint('Referral code extracted: $referralCode');
      // Ensure the router is ready before pushing.
      // In a typical setup where MyApp waits for services to init,
      // the router should be ready. If not, consider a small delay
      // or checking router.canNavigate (if auto_route exposes it well).
      // router.push(SignUpRoute(referralCode: referralCode));
    } else {
      debugPrint('No referral code found in URI: $uri');
    }
  }

  String? _extractReferralCode(Uri uri) {
    // Current logic: assumes /referral/CODE
    if (uri.path.startsWith('/referral/')) {
      // Ensure there's actually a segment after /referral/
      if (uri.pathSegments.length > 1) {
        return uri.pathSegments.last;
      }
    }
    // Enhanced logic: check for a 'code' query parameter as well
    // This makes it more flexible for URLs like example.com/referral?code=XYZ
    final queryCode = uri.queryParameters['code'];
    if (queryCode != null && queryCode.isNotEmpty) {
      return queryCode;
    }

    return null;
  }

  void dispose() {
    debugPrint('Disposing DeepLinkService: Cancelling link subscription.');
    _linkSubscription?.cancel();
    _linkSubscription = null; // Set to null after cancelling for safety
  }
}
