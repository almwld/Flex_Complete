/// نموذج الكوبون
class CouponModel {
  final String id;
  final String code;
  final String title;
  final String description;
  final CouponType type;
  final double value;
  final double? minOrderAmount;
  final double? maxDiscount;
  final int? usageLimit;
  final int usedCount;
  final DateTime startDate;
  final DateTime endDate;
  final bool isActive;
  final List<String> applicableCategories;
  final List<String> applicableProducts;

  CouponModel({
    required this.id,
    required this.code,
    required this.title,
    required this.description,
    required this.type,
    required this.value,
    this.minOrderAmount,
    this.maxDiscount,
    this.usageLimit,
    this.usedCount = 0,
    required this.startDate,
    required this.endDate,
    this.isActive = true,
    this.applicableCategories = const [],
    this.applicableProducts = const [],
  });

  factory CouponModel.fromJson(Map<String, dynamic> json) {
    return CouponModel(
      id: json['id'] ?? '',
      code: json['code'] ?? '',
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      type: CouponType.values.firstWhere(
        (e) => e.name == json['type'],
        orElse: () => CouponType.percentage,
      ),
      value: (json['value'] ?? 0).toDouble(),
      minOrderAmount: json['min_order_amount']?.toDouble(),
      maxDiscount: json['max_discount']?.toDouble(),
      usageLimit: json['usage_limit'],
      usedCount: json['used_count'] ?? 0,
      startDate: DateTime.parse(json['start_date'] ?? DateTime.now().toIso8601String()),
      endDate: DateTime.parse(json['end_date'] ?? DateTime.now().toIso8601String()),
      isActive: json['is_active'] ?? true,
      applicableCategories: List<String>.from(json['applicable_categories'] ?? []),
      applicableProducts: List<String>.from(json['applicable_products'] ?? []),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'code': code,
      'title': title,
      'description': description,
      'type': type.name,
      'value': value,
      'min_order_amount': minOrderAmount,
      'max_discount': maxDiscount,
      'usage_limit': usageLimit,
      'used_count': usedCount,
      'start_date': startDate.toIso8601String(),
      'end_date': endDate.toIso8601String(),
      'is_active': isActive,
      'applicable_categories': applicableCategories,
      'applicable_products': applicableProducts,
    };
  }

  bool get isValid {
    final now = DateTime.now();
    return isActive &&
        now.isAfter(startDate) &&
        now.isBefore(endDate) &&
        (usageLimit == null || usedCount < usageLimit!);
  }

  double calculateDiscount(double orderAmount) {
    if (!isValid || (minOrderAmount != null && orderAmount < minOrderAmount!)) {
      return 0;
    }

    double discount;
    if (type == CouponType.percentage) {
      discount = orderAmount * (value / 100);
      if (maxDiscount != null && discount > maxDiscount!) {
        discount = maxDiscount!;
      }
    } else {
      discount = value;
    }

    return discount;
  }
}

enum CouponType {
  percentage,
  fixed,
  freeShipping,
}
