/// إعدادات API
class ApiConfig {
  // المهلة
  static const Duration connectTimeout = Duration(seconds: 30);
  static const Duration receiveTimeout = Duration(seconds: 30);
  static const Duration sendTimeout = Duration(seconds: 30);

  // عدد المحاولات
  static const int maxRetries = 3;
  static const Duration retryDelay = Duration(seconds: 2);

  // نقاط النهاية
  static const String authEndpoint = '/auth';
  static const String userEndpoint = '/users';
  static const String productEndpoint = '/products';
  static const String orderEndpoint = '/orders';
  static const String categoryEndpoint = '/categories';
  static const String cartEndpoint = '/cart';
  static const String wishlistEndpoint = '/wishlist';
  static const String walletEndpoint = '/wallet';
  static const String paymentEndpoint = '/payments';
  static const String notificationEndpoint = '/notifications';
  static const String reviewEndpoint = '/reviews';
  static const String searchEndpoint = '/search';
}
