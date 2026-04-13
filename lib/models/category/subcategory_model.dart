/// نموذج الفئة الفرعية
class SubcategoryModel {
  final String id;
  final String categoryId;
  final String name;
  final String nameEn;
  final String? icon;
  final String? imageUrl;
  final int sortOrder;
  final bool isActive;
  final int productCount;

  SubcategoryModel({
    required this.id,
    required this.categoryId,
    required this.name,
    required this.nameEn,
    this.icon,
    this.imageUrl,
    this.sortOrder = 0,
    this.isActive = true,
    this.productCount = 0,
  });

  factory SubcategoryModel.fromJson(Map<String, dynamic> json) {
    return SubcategoryModel(
      id: json['id'] ?? '',
      categoryId: json['category_id'] ?? '',
      name: json['name'] ?? '',
      nameEn: json['name_en'] ?? '',
      icon: json['icon'],
      imageUrl: json['image_url'],
      sortOrder: json['sort_order'] ?? 0,
      isActive: json['is_active'] ?? true,
      productCount: json['product_count'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'category_id': categoryId,
      'name': name,
      'name_en': nameEn,
      'icon': icon,
      'image_url': imageUrl,
      'sort_order': sortOrder,
      'is_active': isActive,
      'product_count': productCount,
    };
  }
}
