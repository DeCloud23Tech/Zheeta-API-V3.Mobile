import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zheeta/core/storage/storage/i_storage.dart'; // Ensure IStorage is correctly imported

class SharedPreferencesStorageService implements IStorage {
  final SharedPreferences _prefs;

  SharedPreferencesStorageService._(this._prefs);

  // This static method is marked with @factoryMethod to explicitly tell
  // injectable how to construct an instance of SharedPreferencesStorageService (as IStorage).
  // It handles the asynchronous initialization of SharedPreferences.
  @factoryMethod
  static Future<SharedPreferencesStorageService> create() async {
    final prefs = await SharedPreferences.getInstance();
    return SharedPreferencesStorageService._(prefs);
  }

  // --- IStorage interface implementations ---

  @override
  Future<bool> containsKey(String key) async {
    return _prefs.containsKey(key);
  }

  @override
  Future<bool?> getBool(String key) async {
    return _prefs.getBool(key);
  }

  @override
  Future<int?> getInt(String key) async {
    return _prefs.getInt(key);
  }

  @override
  Future<double?> getDouble(String key) async {
    return _prefs.getDouble(key);
  }

  @override
  Future<String?> getString(String key) async {
    return _prefs.getString(key);
  }

  @override
  Future<List<String>?> getStringList(String key) async {
    return _prefs.getStringList(key);
  }

  @override
  Future<bool> setBool(String key, bool value) async {
    return _prefs.setBool(key, value);
  }

  @override
  Future<bool> setInt(String key, int value) async {
    return _prefs.setInt(key, value);
  }

  @override
  Future<bool> setDouble(String key, double value) async {
    return _prefs.setDouble(key, value);
  }

  @override
  Future<bool> setString(String key, String value) async {
    return _prefs.setString(key, value);
  }

  @override
  Future<bool> setStringList(String key, List<String> value) async {
    return _prefs.setStringList(key, value);
  }

  @override
  Future<bool> remove(String key) async {
    return _prefs.remove(key);
  }

  @override
  Future<bool> clear() async {
    return _prefs.clear();
  }
}
