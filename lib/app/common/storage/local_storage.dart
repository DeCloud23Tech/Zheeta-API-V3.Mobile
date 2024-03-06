abstract class LocalStorage {
  Future setString(String key, String value);

  String? getString(String key);

  Future setJson(String key, Map<String, dynamic> value);

  Map<String, dynamic>? getJson(String key);

  Future addToJsonList(String key, Map<String, dynamic> value);

  List<Map<String, dynamic>> getJsonList(String key);

  Future setBool(String key, bool value);

  bool? getBool(String key);

  Future delete(String key);

  Future clear();

  Future removeAllExcept(List<String> keys);
}
