/// خدمة التكوين عن بُعد
class RemoteConfigService {
  static final RemoteConfigService _instance = RemoteConfigService._internal();
  factory RemoteConfigService() => _instance;
  RemoteConfigService._internal();

  final Map<String, dynamic> _config = {
    'app_version': '2.0.0',
    'min_app_version': '1.5.0',
    'maintenance_mode': false,
    'force_update': false,
    'banner_enabled': true,
    'banner_message': 'خصم 20% على جميع المنتجات!',
    'max_cart_items': 50,
    'default_currency': 'YER',
    'supported_currencies': ['YER', 'SAR', 'USD'],
    'features': {
      'wallet_enabled': true,
      'chat_enabled': true,
      'reviews_enabled': true,
      'wishlist_enabled': true,
    },
    'limits': {
      'max_addresses': 5,
      'max_payment_methods': 3,
      'daily_transfer_limit': 5000000,
    },
  };

  // تحميل التكوين
  Future<void> fetch() async {
    // محاكاة جلب التكوين من الخادم
    await Future.delayed(const Duration(milliseconds: 500));
    print('Remote Config: Fetched successfully');
  }

  // الحصول على قيمة
  T get<T>(String key, {T? defaultValue}) {
    return _config[key] as T? ?? defaultValue as T;
  }

  // الحصول على قيمة مع التحقق
  bool getBool(String key, {bool defaultValue = false}) {
    return get<bool>(key, defaultValue: defaultValue);
  }

  // الحصول على قيمة نصية
  String getString(String key, {String defaultValue = ''}) {
    return get<String>(key, defaultValue: defaultValue);
  }

  // الحصول على قيمة رقمية
  int getInt(String key, {int defaultValue = 0}) {
    return get<int>(key, defaultValue: defaultValue);
  }

  // الحصول على قيمة عشرية
  double getDouble(String key, {double defaultValue = 0.0}) {
    return get<double>(key, defaultValue: defaultValue);
  }

  // الحصول على خريطة
  Map<String, dynamic> getMap(String key) {
    return get<Map<String, dynamic>>(key, defaultValue: {}) ?? {};
  }

  // تفعيل وضع الصيانة
  bool get maintenanceMode => getBool('maintenance_mode');

  // التحقق من التحديث الإجباري
  bool get forceUpdate => getBool('force_update');

  // الحصول على إصدار التطبيق المطلوب
  String get minAppVersion => getString('min_app_version');
}
