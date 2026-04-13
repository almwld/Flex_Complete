/// نموذج استخدام الكوبون
class CouponUsage {
  final String id;
  final String couponId;
  final String userId;
  final String orderId;
  final double discountAmount;
  final DateTime usedAt;

  CouponUsage({
    required this.id,
    required this.couponId,
    required this.userId,
    required this.orderId,
    required this.discountAmount,
    required this.usedAt,
  });

  factory CouponUsage.fromJson(Map<String, dynamic> json) {
    return CouponUsage(
      id: json['id'] ?? '',
      couponId: json['coupon_id'] ?? '',
      userId: json['user_id'] ?? '',
      orderId: json['order_id'] ?? '',
      discountAmount: (json['discount_amount'] ?? 0).toDouble(),
      usedAt: DateTime.parse(json['used_at'] ?? DateTime.now().toIso8601String()),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'coupon_id': couponId,
      'user_id': userId,
      'order_id': orderId,
      'discount_amount': discountAmount,
      'used_at': usedAt.toIso8601String(),
    };
  }
}
