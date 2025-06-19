import 'package:jwt_decode/jwt_decode.dart';
import 'package:zheeta/common/storage/token_storage/i_token_storage.dart';
import 'package:zheeta/core/injection/di.dart';

class TokenUtil {
  static String? _cachedUserId;

  /// Retrieves the user ID from the JWT token, with caching for performance.
  static Future<String?> getUserId() async {
    if (_cachedUserId != null) {
      return _cachedUserId;
    }

    try {
      final tokenStorage = locator<ITokenStorage>();
      final tokenData = await tokenStorage.read();

      if (tokenData == null || tokenData.token.isEmpty) {
        return null;
      }

      final payload = Jwt.parseJwt(tokenData.token);
      final userId = payload['nameid'] as String?;

      if (userId != null) {
        _cachedUserId = userId;
      }

      return _cachedUserId;
    } catch (e, stackTrace) {
      print("Error retrieving user ID: $e\n$stackTrace");
      return null;
    }
  }

  /// Clears the cached user ID and deletes the stored token.
  static Future<void> clearToken() async {
    try {
      final tokenStorage = locator<ITokenStorage>();
      await tokenStorage.clear(); // Delete token from storage
      _cachedUserId = null; // Clear cached user ID
    } catch (e, stackTrace) {
      print("Error clearing token: $e\n$stackTrace");
    }
  }
}
