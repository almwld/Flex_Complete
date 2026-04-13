/// نموذج صورة المنتج
class ProductImage {
  final String id;
  final String productId;
  final String url;
  final String? thumbnailUrl;
  final String? mediumUrl;
  final String? largeUrl;
  final bool isPrimary;
  final int sortOrder;
  final DateTime uploadedAt;

  ProductImage({
    required this.id,
    required this.productId,
    required this.url,
    this.thumbnailUrl,
    this.mediumUrl,
    this.largeUrl,
    this.isPrimary = false,
    this.sortOrder = 0,
    required this.uploadedAt,
  });

  factory ProductImage.fromJson(Map<String, dynamic> json) {
    return ProductImage(
      id: json['id'] ?? '',
      productId: json['product_id'] ?? '',
      url: json['url'] ?? '',
      thumbnailUrl: json['thumbnail_url'],
      mediumUrl: json['medium_url'],
      largeUrl: json['large_url'],
      isPrimary: json['is_primary'] ?? false,
      sortOrder: json['sort_order'] ?? 0,
      uploadedAt: DateTime.parse(json['uploaded_at'] ?? DateTime.now().toIso8601String()),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'product_id': productId,
      'url': url,
      'thumbnail_url': thumbnailUrl,
      'medium_url': mediumUrl,
      'large_url': largeUrl,
      'is_primary': isPrimary,
      'sort_order': sortOrder,
      'uploaded_at': uploadedAt.toIso8601String(),
    };
  }

  String get displayUrl => url;
  String get previewUrl => mediumUrl ?? largeUrl ?? url;
  String get thumbUrl => thumbnailUrl ?? url;
}
