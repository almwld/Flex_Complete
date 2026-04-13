/// نموذج المتغير
class VariantModel {
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

  VariantModel({
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
  });

  factory VariantModel.fromJson(Map<String, dynamic> json) {
    return VariantModel(
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
    };
  }

  bool get inStock => stockQuantity > 0 && isAvailable;
  bool get onSale => compareAtPrice != null && compareAtPrice! > (price ?? 0);
  double? get discountPercentage {
    if (!onSale || price == null || compareAtPrice == null) return null;
    return ((compareAtPrice! - price!) / compareAtPrice!) * 100;
  }
}
