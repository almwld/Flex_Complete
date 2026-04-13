/// خدمة التخزين المؤقت
class CacheService {
  static final CacheService _instance = CacheService._internal();
  factory CacheService() => _instance;
  CacheService._internal();

  final Map<String, CacheEntry> _cache = {};

  // تعيين قيمة
  void set(String key, dynamic value, {Duration? expiration}) {
    _cache[key] = CacheEntry(
      data: value,
      expiration: expiration != null
          ? DateTime.now().add(expiration)
          : null,
    );
  }

  // الحصول على قيمة
  T? get<T>(String key) {
    final entry = _cache[key];
    if (entry == null) return null;

    if (entry.expiration != null && DateTime.now().isAfter(entry.expiration!)) {
      _cache.remove(key);
      return null;
    }

    return entry.data as T;
  }

  // التحقق من وجود القيمة
  bool contains(String key) {
    final entry = _cache[key];
    if (entry == null) return false;

    if (entry.expiration != null && DateTime.now().isAfter(entry.expiration!)) {
      _cache.remove(key);
      return false;
    }

    return true;
  }

  // حذف قيمة
  void remove(String key) {
    _cache.remove(key);
  }

  // حذف جميع القيم
  void clear() {
    _cache.clear();
  }

  // حذف القيم منتهية الصلاحية
  void cleanExpired() {
    _cache.removeWhere((key, entry) {
      return entry.expiration != null && DateTime.now().isAfter(entry.expiration!);
    });
  }

  // الحصول على جميع المفاتيح
  List<String> getKeys() {
    cleanExpired();
    return _cache.keys.toList();
  }
}

class CacheEntry {
  final dynamic data;
  final DateTime? expiration;

  CacheEntry({
    required this.data,
    this.expiration,
  });
}
