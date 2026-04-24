import 'package:flutter/material.dart';
import '../models/user.dart';
import '../services/api_service.dart';
import '../services/storage_service.dart';

class AuthProvider extends ChangeNotifier {
  final ApiService _apiService = ApiService();
  final StorageService _storageService = StorageService();

  User? _currentUser;
  bool _isLoading = false;

  User? get currentUser => _currentUser;
  bool get isLoading => _isLoading;
  bool get isLoggedIn => _currentUser != null;

  Future<bool> login(String email, String password) async {
    _isLoading = true;
    notifyListeners();

    try {
      final user = await _apiService.login(email, password);
      if (user != null) {
        _currentUser = user;
        await _storageService.saveUserAsMap(user.toJson());
        _isLoading = false;
        notifyListeners();
        return true;
      }
    } catch (e) {
      debugPrint('Login error: $e');
    }

    _isLoading = false;
    notifyListeners();
    return false;
  }

  Future<bool> register(String names, String email, String password, String phone) async {
    _isLoading = true;
    notifyListeners();

    try {
      final user = await _apiService.register(names, email, password, phone);
      if (user != null) {
        _currentUser = user;
        await _storageService.saveUserAsMap(user.toJson());
        _isLoading = false;
        notifyListeners();
        return true;
      }
    } catch (e) {
      debugPrint('Register error: $e');
    }

    _isLoading = false;
    notifyListeners();
    return false;
  }

  Future<bool> resetPassword(String email) async {
    _isLoading = true;
    notifyListeners();

    try {
      final result = await _apiService.resetPassword(email);
      _isLoading = false;
      notifyListeners();
      return result;
    } catch (e) {
      debugPrint('Reset password error: $e');
    }

    _isLoading = false;
    notifyListeners();
    return false;
  }

  Future<void> logout() async {
    _currentUser = null;
    await _storageService.clearUserData();
    notifyListeners();
  }

  Future<void> loadUserFromStorage() async {
    final userData = await _storageService.getUserAsMap();
    if (userData != null) {
      _currentUser = User.fromJson(userData);
      notifyListeners();
    }
  }
}
