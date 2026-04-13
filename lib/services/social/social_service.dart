/// خدمة التواصل الاجتماعي
class SocialService {
  static final SocialService _instance = SocialService._internal();
  factory SocialService() => _instance;
  SocialService._internal();

  // مشاركة منتج
  Future<void> shareProduct({
    required String productId,
    required String productName,
    String? productUrl,
    String? imageUrl,
  }) async {
    final shareData = {
      'type': 'product',
      'id': productId,
      'name': productName,
      'url': productUrl,
      'image': imageUrl,
    };
    print('Share Product: $shareData');
  }

  // مشاركة الطلب
  Future<void> shareOrder({
    required String orderId,
    required double total,
  }) async {
    final shareData = {
      'type': 'order',
      'id': orderId,
      'total': total,
    };
    print('Share Order: $shareData');
  }

  // مشاركة المتجر
  Future<void> shareStore({
    required String storeId,
    required String storeName,
    String? storeUrl,
  }) async {
    final shareData = {
      'type': 'store',
      'id': storeId,
      'name': storeName,
      'url': storeUrl,
    };
    print('Share Store: $shareData');
  }

  // تسجيل الدخول عبر فيسبوك
  Future<SocialLoginResult> loginWithFacebook() async {
    await Future.delayed(const Duration(seconds: 2));
    return SocialLoginResult(
      success: true,
      userId: 'fb_${DateTime.now().millisecondsSinceEpoch}',
      provider: 'facebook',
    );
  }

  // تسجيل الدخول عبر جوجل
  Future<SocialLoginResult> loginWithGoogle() async {
    await Future.delayed(const Duration(seconds: 2));
    return SocialLoginResult(
      success: true,
      userId: 'google_${DateTime.now().millisecondsSinceEpoch}',
      provider: 'google',
    );
  }

  // تسجيل الدخول عبر تويتر
  Future<SocialLoginResult> loginWithTwitter() async {
    await Future.delayed(const Duration(seconds: 2));
    return SocialLoginResult(
      success: true,
      userId: 'twitter_${DateTime.now().millisecondsSinceEpoch}',
      provider: 'twitter',
    );
  }
}

class SocialLoginResult {
  final bool success;
  final String? userId;
  final String? error;
  final String provider;

  SocialLoginResult({
    required this.success,
    this.userId,
    this.error,
    required this.provider,
  });
}
