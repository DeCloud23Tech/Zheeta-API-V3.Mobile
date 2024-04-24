import 'package:zheeta/app/common/storage/token_storage/i_token_storage.dart';
import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:zheeta/app/common/storage/user_storage/i_user_storage.dart';
import 'package:zheeta/authentication/data/model/login_user_model.dart';
import 'package:zheeta/authentication/data/model/register_user_model.dart';

@prod
@LazySingleton(as: ITokenStorage)
class TokenStorage implements ITokenStorage {
  final FlutterSecureStorage _storage = FlutterSecureStorage();

  LoginUserModel? cachedUser;
  @override
  Future<void> clear() {
    cachedUser = null;

    return _storage.delete(key: "LOGGEDIN_TOKEN");
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
