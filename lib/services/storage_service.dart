import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  static const String _userDataKey = 'USER_DATA';

  Future<void> setUserData(String userData) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_userDataKey, userData);
  }

  Future<String> getUserData() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_userDataKey) ?? '';
  }

  Future<void> clearUserData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_userDataKey, '');
  }

  Future<Map<String, dynamic>?> getUserAsMap() async {
    final data = await getUserData();
    if (data.isEmpty) return null;
    try {
      return json.decode(data) as Map<String, dynamic>;
    } catch (e) {
      return null;
    }
  }

  Future<void> saveUserAsMap(Map<String, dynamic> userMap) async {
    await setUserData(json.encode(userMap));
  }
}
