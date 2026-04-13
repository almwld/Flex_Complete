import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../core/constants/app_constants.dart';
import '../../models/user/user_model.dart';
import '../../services/storage/local_storage_service.dart';

class AuthService {
  static final AuthService _instance = AuthService._internal();
  factory AuthService() => _instance;
  AuthService._internal();

  String? _token;
  UserModel? _currentUser;

  String? get token => _token;
  UserModel? get currentUser => _currentUser;
  bool get isAuthenticated => _token != null;

  // Login
  Future<AuthResult> login({
    required String email,
    required String password,
  }) async {
    try {
      // For demo, simulate login
      final user = UserModel(
        id: 'user_1',
        fullName: 'مستخدم فلكس',
        email: email,
        phone: '777123456',
        userType: 'customer',
        createdAt: DateTime.now(),
        isVerified: true,
        city: 'صنعاء',
        points: 500,
      );

      _currentUser = user;
      _token = 'demo_token_${DateTime.now().millisecondsSinceEpoch}';

      await LocalStorageService.saveUserData(user.toJson());
      await LocalStorageService.saveToken(_token!);

      return AuthResult(success: true, user: user);
    } catch (e) {
      return AuthResult(success: false, message: 'فشل في تسجيل الدخول');
    }
  }

  // Register
  Future<AuthResult> register({
    required String fullName,
    required String email,
    required String phone,
    required String password,
  }) async {
    try {
      // For demo, simulate registration
      final user = UserModel(
        id: 'user_${DateTime.now().millisecondsSinceEpoch}',
        fullName: fullName,
        email: email,
        phone: phone,
        userType: 'customer',
        createdAt: DateTime.now(),
        isVerified: false,
      );

      _currentUser = user;
      _token = 'demo_token_${DateTime.now().millisecondsSinceEpoch}';

      await LocalStorageService.saveUserData(user.toJson());
      await LocalStorageService.saveToken(_token!);

      return AuthResult(success: true, user: user);
    } catch (e) {
      return AuthResult(success: false, message: 'فشل في إنشاء الحساب');
    }
  }

  // Logout
  Future<void> logout() async {
    _currentUser = null;
    _token = null;
    await LocalStorageService.clearUserData();
  }

  // Check authentication status
  Future<bool> checkAuthStatus() async {
    final token = LocalStorageService.getToken();
    final userData = LocalStorageService.getUserData();

    if (token != null && userData != null) {
      _token = token;
      _currentUser = UserModel.fromJson(userData);
      return true;
    }

    return false;
  }

  // Update profile
  Future<AuthResult> updateProfile({
    String? fullName,
    String? phone,
    String? city,
  }) async {
    if (_currentUser == null) {
      return AuthResult(success: false, message: 'غير مصرح');
    }

    try {
      _currentUser = _currentUser!.copyWith(
        fullName: fullName ?? _currentUser!.fullName,
        phone: phone ?? _currentUser!.phone,
        city: city ?? _currentUser!.city,
      );

      await LocalStorageService.saveUserData(_currentUser!.toJson());

      return AuthResult(success: true, user: _currentUser);
    } catch (e) {
      return AuthResult(success: false, message: 'فشل في تحديث الملف');
    }
  }

  // Forgot password
  Future<bool> forgotPassword(String email) async {
    // Simulate sending reset email
    await Future.delayed(const Duration(seconds: 1));
    return true;
  }

  // Reset password
  Future<bool> resetPassword(String token, String newPassword) async {
    // Simulate password reset
    await Future.delayed(const Duration(seconds: 1));
    return true;
  }

  // Change password
  Future<bool> changePassword(String currentPassword, String newPassword) async {
    // Simulate password change
    await Future.delayed(const Duration(seconds: 1));
    return true;
  }
}

class AuthResult {
  final bool success;
  final UserModel? user;
  final String? message;

  AuthResult({
    required this.success,
    this.user,
    this.message,
  });
}
