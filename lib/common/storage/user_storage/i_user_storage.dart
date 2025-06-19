import 'package:zheeta/features/authentication/data/model/register_user_model.dart';

abstract class IUserStorage {
  Future<RegisterUserModel?> read();
  Future<void> save(RegisterUserModel credentials);
  Future<void> clear();
  Future<void> saveEmail(String email);
  Future<String?> getEmail();
}
