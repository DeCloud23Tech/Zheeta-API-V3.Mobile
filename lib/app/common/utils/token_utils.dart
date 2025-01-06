import 'package:jwt_decode/jwt_decode.dart';
import 'package:zheeta/app/common/storage/token_storage/i_token_storage.dart';
import 'package:zheeta/app/injection/di.dart';

class TokenUtil {
  static Future<String?> getUserId() async {
    try {
      final tokenStorage = locator<ITokenStorage>();
      final token = await tokenStorage.read();
      if (token?.token != null) {
        Map<String, dynamic> payload = Jwt.parseJwt(token!.token);
        return payload['nameid'];
      }
      return null;
    } catch (e) {
      print("Error retrieving user ID: $e");
      return null;
    }
  }
}
