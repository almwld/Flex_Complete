class ProductCategory {
  final String id;
  final String name;
  final String nameAr;
  final String nameEn;
  final String icon;
  final String? imageUrl;
  final int productCount;
  final String? parentId;
  final bool isActive;
  final int sortOrder;

  ProductCategory({
    required this.id,
    required this.name,
    required this.nameAr,
    this.nameEn = '',
    required this.icon,
    this.imageUrl,
    this.productCount = 0,
    this.parentId,
    this.isActive = true,
    this.sortOrder = 0,
  });

  factory ProductCategory.fromJson(Map<String, dynamic> json) {
    return ProductCategory(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      nameAr: json['name_ar'] ?? json['name'] ?? '',
      nameEn: json['name_en'] ?? '',
      icon: json['icon'] ?? 'category',
      imageUrl: json['image_url'],
      productCount: json['product_count'] ?? 0,
      parentId: json['parent_id'],
      isActive: json['is_active'] ?? true,
      sortOrder: json['sort_order'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'name_ar': nameAr,
      'name_en': nameEn,
      'icon': icon,
      'image_url': imageUrl,
      'product_count': productCount,
      'parent_id': parentId,
      'is_active': isActive,
      'sort_order': sortOrder,
    };
  }

  String get localizedName => nameAr;
}
