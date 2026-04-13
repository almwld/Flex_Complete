/// خدمة Firebase Analytics
class FirebaseAnalyticsService {
  static final FirebaseAnalyticsService _instance =
      FirebaseAnalyticsService._internal();
  factory FirebaseAnalyticsService() => _instance;
  FirebaseAnalyticsService._internal();

  // تتبع حدث
  Future<void> logEvent(String name, {Map<String, dynamic>? parameters}) async {
    print('Firebase Analytics Event: $name, Parameters: $parameters');
  }

  // تتبع مشاهدات الشاشة
  Future<void> logScreenView(String screenName, {String? screenClass}) async {
    await logEvent('screen_view', parameters: {
      'screen_name': screenName,
      'screen_class': screenClass ?? screenName,
    });
  }

  // تتبع المستخدم
  Future<void> setUserId(String userId) async {
    print('Firebase Analytics: User ID set to $userId');
  }

  // تتبع خصائص المستخدم
  Future<void> setUserProperty(String name, String value) async {
    print('Firebase Analytics: User property $name = $value');
  }

  // تتبع تسجيل الدخول
  Future<void> logLogin(String method) async {
    await logEvent('login', parameters: {'method': method});
  }

  // تتبع التسجيل
  Future<void> logSignUp(String method) async {
    await logEvent('sign_up', parameters: {'method': method});
  }

  // تتبع إضافة للسلة
  Future<void> logAddToCart(
    String itemId,
    String itemName,
    String? itemCategory,
    double price,
    String currency,
  ) async {
    await logEvent('add_to_cart', parameters: {
      'item_id': itemId,
      'item_name': itemName,
      'item_category': itemCategory ?? '',
      'price': price,
      'currency': currency,
    });
  }

  // تتبع إتمام الطلب
  Future<void> logPurchase(
    String orderId,
    double revenue,
    String currency,
    {String? tax, String? shipping}
  ) async {
    await logEvent('purchase', parameters: {
      'transaction_id': orderId,
      'revenue': revenue,
      'currency': currency,
      'tax': tax ?? '0',
      'shipping': shipping ?? '0',
    });
  }

  // تتبع البحث
  Future<void> logSearch(String searchTerm, {int? resultsCount}) async {
    await logEvent('search', parameters: {
      'search_term': searchTerm,
      'results_count': resultsCount ?? 0,
    });
  }

  // تتبع مشاركة المحتوى
  Future<void> logShare(String contentType, String itemId, String method) async {
    await logEvent('share', parameters: {
      'content_type': contentType,
      'item_id': itemId,
      'method': method,
    });
  }
}
