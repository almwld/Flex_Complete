/// نموذج حدث التحليلات
class AnalyticsEvent {
  final String id;
  final String? userId;
  final String eventName;
  final Map<String, dynamic> properties;
  final String? sessionId;
  final String? deviceId;
  final String? platform;
  final String? appVersion;
  final String? osVersion;
  final DateTime timestamp;

  AnalyticsEvent({
    required this.id,
    this.userId,
    required this.eventName,
    required this.properties,
    this.sessionId,
    this.deviceId,
    this.platform,
    this.appVersion,
    this.osVersion,
    required this.timestamp,
  });

  factory AnalyticsEvent.fromJson(Map<String, dynamic> json) {
    return AnalyticsEvent(
      id: json['id'] ?? '',
      userId: json['user_id'],
      eventName: json['event_name'] ?? '',
      properties: json['properties'] ?? {},
      sessionId: json['session_id'],
      deviceId: json['device_id'],
      platform: json['platform'],
      appVersion: json['app_version'],
      osVersion: json['os_version'],
      timestamp: DateTime.parse(json['timestamp'] ?? DateTime.now().toIso8601String()),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_id': userId,
      'event_name': eventName,
      'properties': properties,
      'session_id': sessionId,
      'device_id': deviceId,
      'platform': platform,
      'app_version': appVersion,
      'os_version': osVersion,
      'timestamp': timestamp.toIso8601String(),
    };
  }
}

/// أنواع الأحداث الشائعة
class AnalyticsEvents {
  static const String appOpened = 'app_opened';
  static const String appClosed = 'app_closed';
  static const String screenViewed = 'screen_viewed';
  static const String productViewed = 'product_viewed';
  static const String productAddedToCart = 'product_added_to_cart';
  static const String productRemovedFromCart = 'product_removed_from_cart';
  static const String checkoutStarted = 'checkout_started';
  static const String orderPlaced = 'order_placed';
  static const String orderCancelled = 'order_cancelled';
  static const String paymentCompleted = 'payment_completed';
  static const String searchPerformed = 'search_performed';
  static const String filterApplied = 'filter_applied';
  static const String categoryViewed = 'category_viewed';
  static const String wishlistAdded = 'wishlist_added';
  static const String wishlistRemoved = 'wishlist_removed';
  static const String reviewSubmitted = 'review_submitted';
  static const String shareClicked = 'share_clicked';
  static const String loginCompleted = 'login_completed';
  static const String signupCompleted = 'signup_completed';
  static const String walletDeposited = 'wallet_deposited';
  static const String walletWithdrawn = 'wallet_withdrawn';
  static const String walletTransferred = 'wallet_transferred';
  static const String referralSent = 'referral_sent';
}
