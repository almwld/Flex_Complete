import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

/// خدمة التخزين المؤقت
class CacheService {
  static final CacheService _instance = CacheService._internal();
  factory CacheService() => _instance;
  CacheService._internal();

  SharedPreferences? _prefs;

  /// تهيئة التخزين المؤقت
  Future<void> initialize() async {
    _prefs = await SharedPreferences.getInstance();
  }

  /// حفظ قيمة
  Future<bool> setString(String key, String value) async {
    return await _prefs?.setString(key, value) ?? false;
  }

  /// الحصول على قيمة
  String? getString(String key) {
    return _prefs?.getString(key);
  }

  /// حفظ كائن JSON
  Future<bool> setJson(String key, Map<String, dynamic> value) async {
    return await setString(key, jsonEncode(value));
  }

  /// الحصول على كائن JSON
  Map<String, dynamic>? getJson(String key) {
    final value = getString(key);
    if (value == null) return null;
    return jsonDecode(value);
  }

  /// حفظ قائمة
  Future<bool> setStringList(String key, List<String> value) async {
    return await _prefs?.setStringList(key, value) ?? false;
  }

  /// الحصول على قائمة
  List<String>? getStringList(String key) {
    return _prefs?.getStringList(key);
  }

  /// حفظ قيمة منطقية
  Future<bool> setBool(String key, bool value) async {
    return await _prefs?.setBool(key, value) ?? false;
  }

  /// الحصول على قيمة منطقية
  bool? getBool(String key) {
    return _prefs?.getBool(key);
  }

  /// حذف عنصر
  Future<bool> remove(String key) async {
    return await _prefs?.remove(key) ?? false;
  }

  /// حذف جميع العناصر
  Future<bool> clear() async {
    return await _prefs?.clear() ?? false;
  }

  /// التحقق من وجود عنصر
  bool containsKey(String key) {
    return _prefs?.containsKey(key) ?? false;
  }
}
