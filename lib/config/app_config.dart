/// إعدادات التطبيق
class AppConfig {
  // معلومات التطبيق
  static const String appName = 'فلكس يمن';
  static const String appNameEn = 'Flex Yemen';
  static const String appVersion = '2.0.0';
  static const int buildNumber = 1;

  // معلومات الاتصال
  static const String supportEmail = 'support@flexyemen.com';
  static const String supportPhone = '800-123-456';
  static const String websiteUrl = 'https://flexyemen.com';

  // روابط API
  static const String baseUrl = 'https://api.flexyemen.com';
  static const String apiVersion = 'v2';
  static const String apiUrl = '$baseUrl/$apiVersion';

  // إعدادات Supabase
  static const String supabaseUrl = 'https://your-project.supabase.co';
  static const String supabaseAnonKey = 'your-anon-key';

  // إعدادات العملة
  static const String currency = 'ر.ي';
  static const String currencyCode = 'YER';
  static const String locale = 'ar-YE';

  // إعدادات الدفع
  static const double minOrderAmount = 10000;
  static const double freeShippingThreshold = 500000;
  static const double shippingCost = 25000;

  // إعدادات المحفظة
  static const double minDepositAmount = 1000;
  static const double minWithdrawAmount = 10000;
  static const double maxWithdrawAmount = 10000000;
  static const double transferFee = 100;

  // إعدادات الإشعارات
  static const bool pushNotificationsEnabled = true;
  static const bool emailNotificationsEnabled = true;
  static const bool smsNotificationsEnabled = true;

  // إعدادات الأمان
  static const int maxLoginAttempts = 5;
  static const int sessionTimeoutMinutes = 30;
  static const int otpExpiryMinutes = 5;

  // إعدادات التخزين المؤقت
  static const int cacheExpiryHours = 24;
  static const int maxCacheSize = 100;

  // روابط التواصل الاجتماعي
  static const String facebookUrl = 'https://facebook.com/flexyemen';
  static const String twitterUrl = 'https://twitter.com/flexyemen';
  static const String instagramUrl = 'https://instagram.com/flexyemen';
  static const String youtubeUrl = 'https://youtube.com/flexyemen';

  // إعدادات الخريطة
  static const String mapApiKey = 'your-map-api-key';
  static const double defaultLatitude = 15.3694;
  static const double defaultLongitude = 44.1910;

  // إعدادات PRO
  static const List<String> proFeatures = [
    '无限的愿望清单',
    '专属折扣',
    '优先客户支持',
    '免费送货',
    '提前访问销售',
  ];

  // إعدادات التجربة
  static const bool enableDarkMode = true;
  static const bool enableRtl = true;
  static const bool enableAnalytics = true;
  static const bool enableCrashReporting = true;
}
