import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:zheeta/common/model/login_user_model.dart';
import 'package:zheeta/common/storage/token_storage/i_token_storage.dart';

@prod
@LazySingleton(as: ITokenStorage)
class TokenStorage implements ITokenStorage {
  final FlutterSecureStorage _storage = FlutterSecureStorage(
    aOptions: AndroidOptions(
      resetOnError: true,
      encryptedSharedPreferences: true, // Ensures data is removed on uninstall
    ), // Resets storage on error
  );

  LoginUserModel? cachedUser;

  @override
  Future<void> clear() async {
    cachedUser = null;
    await _storage.delete(key: "LOGGEDIN_TOKEN");
    // await _storage.delete(key: "REFRESH_TOKEN");
    // await _storage.delete(key: "TOKEN_EXPIRY");
  }


  @override
  Future<LoginUserModel?> read() async {
    if (cachedUser != null) {
      return cachedUser;
    }
    final json = await _storage.read(key: "LOGGEDIN_TOKEN");
    if (json == null) return null;
    try {
      var jsonDecoded = jsonDecode(json);
      return cachedUser = LoginUserModel.fromJson(jsonDecoded);
    } on FormatException {
      return null;
    } on PlatformException {
      return null;
    }
  }

  @override
  Future<void> save(LoginUserModel user) {
    cachedUser = user;
    var encodedString = jsonEncode(user.toJson());
    return _storage.write(key: "LOGGEDIN_TOKEN", value: encodedString);
  }
}
