/// نموذج قائمة الأمنيات
class WishlistModel {
  final String id;
  final String userId;
  final String productId;
  final String? variantId;
  final double? priceWhenAdded;
  final bool priceDropped;
  final bool inStock;
  final DateTime addedAt;
  final DateTime? updatedAt;

  WishlistModel({
    required this.id,
    required this.userId,
    required this.productId,
    this.variantId,
    this.priceWhenAdded,
    this.priceDropped = false,
    this.inStock = true,
    required this.addedAt,
    this.updatedAt,
  });

  factory WishlistModel.fromJson(Map<String, dynamic> json) {
    return WishlistModel(
      id: json['id'] ?? '',
      userId: json['user_id'] ?? '',
      productId: json['product_id'] ?? '',
      variantId: json['variant_id'],
      priceWhenAdded: json['price_when_added']?.toDouble(),
      priceDropped: json['price_dropped'] ?? false,
      inStock: json['in_stock'] ?? true,
      addedAt: DateTime.parse(json['added_at'] ?? DateTime.now().toIso8601String()),
      updatedAt: json['updated_at'] != null ? DateTime.parse(json['updated_at']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_id': userId,
      'product_id': productId,
      'variant_id': variantId,
      'price_when_added': priceWhenAdded,
      'price_dropped': priceDropped,
      'in_stock': inStock,
      'added_at': addedAt.toIso8601String(),
      'updated_at': updatedAt?.toIso8601String(),
    };
  }
}
