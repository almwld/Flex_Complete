/// خدمة التحليلات
class AnalyticsService {
  static final AnalyticsService _instance = AnalyticsService._internal();
  factory AnalyticsService() => _instance;
  AnalyticsService._internal();

  /// تتبع حدث
  Future<void> trackEvent(String eventName, {Map<String, dynamic>? parameters}) async {
    // يتم إرسال البيانات إلى خدمة التحليلات
    print('Analytics: $eventName - $parameters');
  }

  /// تتبع صفحة
  Future<void> trackScreen(String screenName, {String? className}) async {
    print('Analytics: Screen - $screenName ($className)');
  }

  /// تتبع مستخدم
  Future<void> setUserId(String userId) async {
    print('Analytics: User ID - $userId');
  }

  /// تتبع خصائص المستخدم
  Future<void> setUserProperties(Map<String, dynamic> properties) async {
    print('Analytics: User Properties - $properties');
  }
}
