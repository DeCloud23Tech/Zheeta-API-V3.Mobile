import 'package:flutter/foundation.dart';
import 'package:jwt_decode/jwt_decode.dart';
import 'package:zheeta/core/storage/token_storage/i_token_storage.dart';
import 'package:zheeta/di/di.dart';

class TokenUtil {
  static String? _cachedUserId;

  /// Retrieves the user ID from the cached JWT token or from storage.
  static Future<String?> getUserId() async {
    if (_cachedUserId != null) return _cachedUserId;

    try {
      final tokenStorage = _getTokenStorage();
      final tokenData = await tokenStorage.read();

      if (tokenData == null || tokenData.token.isEmpty) return null;

      final Map<String, dynamic> payload = Jwt.parseJwt(tokenData.token);
      final userId = payload['nameid'];

      if (userId is String && userId.isNotEmpty) {
        _cachedUserId = userId;
        return _cachedUserId;
      }

      debugPrint(
          "TokenUtil: 'nameid' not found or not a string in token payload.");
      return null;
    } catch (e, stackTrace) {
      debugPrint("TokenUtil Error: Failed to get user ID\n$e\n$stackTrace");
      return null;
    }
  }

  /// Clears the stored token and any cached user ID.
  static Future<void> clearToken() async {
    try {
      final tokenStorage = _getTokenStorage();
      await tokenStorage.clear();
      _cachedUserId = null;
    } catch (e, stackTrace) {
      debugPrint("TokenUtil Error: Failed to clear token\n$e\n$stackTrace");
    }
  }

  /// Resolves the token storage dependency.
  static ITokenStorage _getTokenStorage() => locator<ITokenStorage>();
}
