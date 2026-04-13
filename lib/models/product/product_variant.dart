/// نموذج متغير المنتج
class ProductVariant {
  final String id;
  final String productId;
  final String name;
  final String? sku;
  final double? price;
  final double? compareAtPrice;
  final int stockQuantity;
  final bool isAvailable;
  final Map<String, String> attributes;
  final String? imageUrl;
  final double? weight;
  final String? weightUnit;
  final Map<String, dynamic>? additionalData;
  final DateTime createdAt;
  final DateTime? updatedAt;

  ProductVariant({
    required this.id,
    required this.productId,
    required this.name,
    this.sku,
    this.price,
    this.compareAtPrice,
    this.stockQuantity = 0,
    this.isAvailable = true,
    required this.attributes,
    this.imageUrl,
    this.weight,
    this.weightUnit,
    this.additionalData,
    required this.createdAt,
    this.updatedAt,
  });

  factory ProductVariant.fromJson(Map<String, dynamic> json) {
    return ProductVariant(
      id: json['id'] ?? '',
      productId: json['product_id'] ?? '',
      name: json['name'] ?? '',
      sku: json['sku'],
      price: json['price']?.toDouble(),
      compareAtPrice: json['compare_at_price']?.toDouble(),
      stockQuantity: json['stock_quantity'] ?? 0,
      isAvailable: json['is_available'] ?? true,
      attributes: Map<String, String>.from(json['attributes'] ?? {}),
      imageUrl: json['image_url'],
      weight: json['weight']?.toDouble(),
      weightUnit: json['weight_unit'],
      additionalData: json['additional_data'],
      createdAt: DateTime.parse(json['created_at'] ?? DateTime.now().toIso8601String()),
      updatedAt: json['updated_at'] != null ? DateTime.parse(json['updated_at']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'product_id': productId,
      'name': name,
      'sku': sku,
      'price': price,
      'compare_at_price': compareAtPrice,
      'stock_quantity': stockQuantity,
      'is_available': isAvailable,
      'attributes': attributes,
      'image_url': imageUrl,
      'weight': weight,
      'weight_unit': weightUnit,
      'additional_data': additionalData,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt?.toIso8601String(),
    };
  }

  bool get inStock => stockQuantity > 0 && isAvailable;
  bool get onSale => compareAtPrice != null && compareAtPrice! > (price ?? 0);
  double? get discountPercentage {
    if (!onSale || price == null || compareAtPrice == null || compareAtPrice == 0) return null;
    return ((compareAtPrice! - price!) / compareAtPrice!) * 100;
  }
}

/// نموذج سمة المتغير
class VariantAttribute {
  final String name;
  final String value;
  final String? icon;

  VariantAttribute({
    required this.name,
    required this.value,
    this.icon,
  });

  factory VariantAttribute.fromJson(Map<String, dynamic> json) {
    return VariantAttribute(
      name: json['name'] ?? '',
      value: json['value'] ?? '',
      icon: json['icon'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'value': value,
      'icon': icon,
    };
  }
}
