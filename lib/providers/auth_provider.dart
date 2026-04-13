import 'package:flutter/material.dart';
import '../../models/user/user_model.dart';
import '../../services/auth/auth_service.dart';
import '../../services/storage/local_storage_service.dart';

class AuthProvider extends ChangeNotifier {
  final AuthService _authService = AuthService();

  bool _isLoggedIn = false;
  bool _isGuest = false;
  bool _isLoading = false;
  UserModel? _userData;

  bool get isLoggedIn => _isLoggedIn;
  bool get isGuest => _isGuest;
  bool get isLoading => _isLoading;
  UserModel? get userData => _userData;
  String? get userName => _userData?.fullName;
  String? get userEmail => _userData?.email;
  String? get userAvatar => _userData?.avatarUrl;
  String? get userType => _userData?.userType;

  AuthProvider() {
    _loadAuthState();
  }

  void _loadAuthState() {
    _isLoggedIn = LocalStorageService.isLoggedIn();
    final userDataMap = LocalStorageService.getUserData();
    if (userDataMap != null) {
      _userData = UserModel.fromJson(userDataMap);
    }
    _isGuest = LocalStorageService.getBool('is_guest', defaultValue: false);
    notifyListeners();
  }

  Future<bool> login(String email, String password) async {
    _isLoading = true;
    notifyListeners();

    final result = await _authService.login(email: email, password: password);

    _isLoading = false;
    if (result.success && result.user != null) {
      _isLoggedIn = true;
      _isGuest = false;
      _userData = result.user;
      notifyListeners();
      return true;
    }

    notifyListeners();
    return false;
  }

  Future<bool> register({
    required String fullName,
    required String email,
    required String phone,
    required String password,
  }) async {
    _isLoading = true;
    notifyListeners();

    final result = await _authService.register(
      fullName: fullName,
      email: email,
      phone: phone,
      password: password,
    );

    _isLoading = false;
    if (result.success && result.user != null) {
      _isLoggedIn = true;
      _isGuest = false;
      _userData = result.user;
      notifyListeners();
      return true;
    }

    notifyListeners();
    return false;
  }

  Future<bool> loginAsGuest() async {
    _isLoading = true;
    notifyListeners();

    await Future.delayed(const Duration(milliseconds: 500));

    final guestData = UserModel(
      id: 'guest_${DateTime.now().millisecondsSinceEpoch}',
      fullName: 'ضيف',
      email: 'guest@flexyemen.com',
      phone: '',
      userType: 'guest',
    );

    _isLoggedIn = true;
    _isGuest = true;
    _userData = guestData;

    await LocalStorageService.saveUserData(guestData.toJson());
    await LocalStorageService.setBool('is_guest', true);
    _isLoading = false;
    notifyListeners();
    return true;
  }

  Future<void> logout() async {
    await _authService.logout();
    _isLoggedIn = false;
    _isGuest = false;
    _userData = null;
    notifyListeners();
  }

  Future<void> updateUserData(Map<String, dynamic> userData) async {
    if (_userData != null) {
      final updatedData = {..._userData!.toJson(), ...userData};
      _userData = UserModel.fromJson(updatedData);
      await LocalStorageService.saveUserData(updatedData);
      notifyListeners();
    }
  }

  bool get canAccessFullFeatures => _isLoggedIn && !_isGuest;
}
