import 'package:zheeta/authentication/data/model/login_user_model.dart';

abstract class ITokenStorage {
  Future<LoginUserModel?> read();
  Future<void> save(LoginUserModel credentials);
  Future<void> clear();
}
