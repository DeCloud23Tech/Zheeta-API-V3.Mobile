import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:zheeta/app/common/storage/user_storage/i_user_storage.dart';
import 'package:zheeta/authentication/data/model/register_user_model.dart';

@prod
@LazySingleton(as: IUserStorage)
class UserStorage implements IUserStorage {
  final FlutterSecureStorage _storage = FlutterSecureStorage();

  UserStorage();

  RegisterUserModel? cachedUser;
  @override
  Future<void> clear() {
    cachedUser = null;

    return _storage.delete(key: "REGISTERED_USER");
  }

  @override
  Future<RegisterUserModel?> read() async {
    if (cachedUser != null) {
      return cachedUser;
    }
    final json = await _storage.read(key: "REGISTERED_USER");
    if (json == null) return null;
    try {
      var jsonDecoded = jsonDecode(json);
      return cachedUser = RegisterUserModel.fromJson(jsonDecoded);
    } on FormatException {
      return null;
    } on PlatformException {
      return null;
    }
  }

  @override
  Future<void> save(RegisterUserModel user) {
    cachedUser = user;
    var encodedString = jsonEncode(user.toJson());
    return _storage.write(key: "REGISTERED_USER", value: encodedString);
  }
}
