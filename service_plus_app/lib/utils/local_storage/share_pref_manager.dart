import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefManager {
  static const String _keyPrefix = 'MSA'; // Customizable prefix

  /// Gets a SharedPreferences instance.
  static Future<SharedPreferences> _getInstance() async {
    return await SharedPreferences.getInstance();
  }

  /// Stores a boolean value.
  static Future<bool> setBool(String key, bool value) async {
    final prefs = await _getInstance();
    return await prefs.setBool(_keyPrefix + key, value);
  }

  /// Gets a boolean value. Returns `false` if the key doesn't exist or the value cannot be cast to bool.
  static Future<bool> getBool(String key) async {
    final prefs = await _getInstance();
    return prefs.getBool(_keyPrefix + key) ?? false; // Default to false
  }

  /// Stores an integer value.
  static Future<bool> setInt(String key, int value) async {
    final prefs = await _getInstance();
    return await prefs.setInt(_keyPrefix + key, value);
  }

  /// Gets an integer value. Returns `null` if the key doesn't exist or the value cannot be cast to int.
  static Future<int?> getInt(String key) async {
    final prefs = await _getInstance();
    return prefs.getInt(_keyPrefix + key);
  }

  /// Stores a double value.
  static Future<bool> setDouble(String key, double value) async {
    final prefs = await _getInstance();
    return await prefs.setDouble(_keyPrefix + key, value);
  }

  /// Gets a double value. Returns `null` if the key doesn't exist or the value cannot be cast to double.
  static Future<double?> getDouble(String key) async {
    final prefs = await _getInstance();
    return prefs.getDouble(_keyPrefix + key);
  }

  /// Stores a string value.
  static Future<bool> setString(String key, String value) async {
    final prefs = await _getInstance();
    return await prefs.setString(_keyPrefix + key, value);
  }

  /// Gets a string value. Returns `null` if the key doesn't exist.
  static Future<String?> getString(String key) async {
    final prefs = await _getInstance();
    return prefs.getString(_keyPrefix + key);
  }

  /// Stores a list of strings.
  static Future<bool> setStringList(String key, List<String> value) async {
    final prefs = await _getInstance();
    return await prefs.setStringList(_keyPrefix + key, value);
  }

  /// Gets a list of strings. Returns `null` if the key doesn't exist.
  static Future<List<String>?> getStringList(String key) async {
    final prefs = await _getInstance();
    return prefs.getStringList(_keyPrefix + key);
  }

  /// Removes a key from SharedPreferences.
  static Future<bool> remove(String key) async {
    final prefs = await _getInstance();
    return await prefs.remove(_keyPrefix + key);
  }

  /// Clears all stored key-value pairs.
  static Future<bool> clear() async {
    final prefs = await _getInstance();
    return await prefs.clear();
  }
}
