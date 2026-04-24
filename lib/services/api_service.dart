// import 'dart:convert';
// import 'package:http/http.dart' as http;
import '../models/user.dart';

class ApiService {
  static const String baseUrl = 'http://192.168.1.162:81/carrental/public/api';
  static const String publicFolder = 'http://192.168.1.162:81/carrental/public/';

  static const int timeoutSeconds = 5;

  /// Login user - currently returns mock success (matching Java behavior)
  Future<User?> login(String email, String password) async {
    // The original Java code bypasses this call and navigates directly
    // Uncomment below when server is available:
    /*
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/login'),
        body: {'email': email, 'password': password},
      ).timeout(Duration(seconds: timeoutSeconds));
      
      if (response.statusCode == 200) {
        return User.fromJson(json.decode(response.body));
      }
    } catch (e) {
      print('Login error: $e');
    }
    */
    return User(name: 'Demo User', email: email, phone: '+1234567890');
  }

  /// Register user
  Future<User?> register(String names, String email, String password, String phone) async {
    // The original Java code has validation but navigates directly
    /*
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/signin'),
        body: {
          'names': names,
          'email': email,
          'password': password,
          'phone': phone,
        },
      ).timeout(Duration(seconds: timeoutSeconds));
      
      if (response.statusCode == 200) {
        return User.fromJson(json.decode(response.body));
      }
    } catch (e) {
      print('Register error: $e');
    }
    */
    return User(name: names, email: email, phone: phone);
  }

  /// Reset password
  Future<bool> resetPassword(String email) async {
    /*
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/passwordreset'),
        body: {'email': email},
      ).timeout(Duration(seconds: timeoutSeconds));
      
      return response.statusCode == 200;
    } catch (e) {
      print('Reset password error: $e');
    }
    */
    return true;
  }
}
