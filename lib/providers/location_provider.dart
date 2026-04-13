import 'package:flutter/material.dart';

/// مزود الموقع
class LocationProvider extends ChangeNotifier {
  double? _latitude;
  double? _longitude;
  String? _address;
  bool _isLoading = false;
  String? _error;

  double? get latitude => _latitude;
  double? get longitude => _longitude;
  String? get address => _address;
  bool get isLoading => _isLoading;
  String? get error => _error;

  /// تحديث الموقع
  Future<void> updateLocation(double lat, double lng) async {
    _latitude = lat;
    _longitude = lng;
    notifyListeners();
  }

  /// تحديث العنوان
  Future<void> updateAddress(String address) async {
    _address = address;
    notifyListeners();
  }

  /// تعيين حالة التحميل
  void setLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }

  /// تعيين الخطأ
  void setError(String? error) {
    _error = error;
    notifyListeners();
  }

  /// الحصول على الموقع الحالي
  Map<String, double>? get currentLocation {
    if (_latitude != null && _longitude != null) {
      return {
        'latitude': _latitude!,
        'longitude': _longitude!,
      };
    }
    return null;
  }
}
