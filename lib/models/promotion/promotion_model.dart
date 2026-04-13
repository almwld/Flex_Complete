/// نموذج الترويج
class PromotionModel {
  final String id;
  final String title;
  final String description;
  final String imageUrl;
  final PromotionType type;
  final double? discountValue;
  final String? couponCode;
  final String? redirectUrl;
  final String? productId;
  final String? categoryId;
  final DateTime startDate;
  final DateTime endDate;
  final int displayOrder;
  final bool isActive;
  final int viewCount;
  final int clickCount;

  PromotionModel({
    required this.id,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.type,
    this.discountValue,
    this.couponCode,
    this.redirectUrl,
    this.productId,
    this.categoryId,
    required this.startDate,
    required this.endDate,
    this.displayOrder = 0,
    this.isActive = true,
    this.viewCount = 0,
    this.clickCount = 0,
  });

  factory PromotionModel.fromJson(Map<String, dynamic> json) {
    return PromotionModel(
      id: json['id'] ?? '',
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      imageUrl: json['image_url'] ?? '',
      type: PromotionType.values.firstWhere(
        (e) => e.name == json['type'],
        orElse: () => PromotionType.banner,
      ),
      discountValue: json['discount_value']?.toDouble(),
      couponCode: json['coupon_code'],
      redirectUrl: json['redirect_url'],
      productId: json['product_id'],
      categoryId: json['category_id'],
      startDate: DateTime.parse(json['start_date'] ?? DateTime.now().toIso8601String()),
      endDate: DateTime.parse(json['end_date'] ?? DateTime.now().toIso8601String()),
      displayOrder: json['display_order'] ?? 0,
      isActive: json['is_active'] ?? true,
      viewCount: json['view_count'] ?? 0,
      clickCount: json['click_count'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'image_url': imageUrl,
      'type': type.name,
      'discount_value': discountValue,
      'coupon_code': couponCode,
      'redirect_url': redirectUrl,
      'product_id': productId,
      'category_id': categoryId,
      'start_date': startDate.toIso8601String(),
      'end_date': endDate.toIso8601String(),
      'display_order': displayOrder,
      'is_active': isActive,
      'view_count': viewCount,
      'click_count': clickCount,
    };
  }

  bool get isValid {
    final now = DateTime.now();
    return isActive && now.isAfter(startDate) && now.isBefore(endDate);
  }
}

enum PromotionType {
  banner,
  flashSale,
  discount,
  coupon,
  featured,
}
