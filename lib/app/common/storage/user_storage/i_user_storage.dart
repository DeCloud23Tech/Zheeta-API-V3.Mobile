import 'package:zheeta/authentication/data/model/register_user_model.dart';

abstract class IUserStorage {
  Future<RegisterUserModel?> read();
  Future<void> save(RegisterUserModel credentials);
  Future<void> clear();
}
