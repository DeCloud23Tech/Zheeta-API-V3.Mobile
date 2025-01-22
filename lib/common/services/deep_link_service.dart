import 'dart:async';
import 'package:app_links/app_links.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@prod
@LazySingleton()
class DeepLinkService {
  late AppLinks _appLinks;
  StreamSubscription<Uri>? _linkSubscription;

  DeepLinkService();

  Future<void> initialize() async {
    _appLinks = AppLinks();
    _linkSubscription = _appLinks.uriLinkStream.listen((uri) {
      debugPrint('Received deep link: $uri');
      _handleReferralLink(uri);
    });
  }

  void _handleReferralLink(Uri uri) {
    final referralCode = _extractReferralCode(uri);
    if (referralCode != null) {
      debugPrint('Referral code: $referralCode');
      // Handle referral logic here
    }
  }

  String? _extractReferralCode(Uri uri) {
    if (uri.path.startsWith('/referral/')) {
      return uri.pathSegments.last;
    }
    return null;
  }

  void dispose() {
    _linkSubscription?.cancel();
  }
}
