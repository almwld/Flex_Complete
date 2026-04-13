/// نموذج الفئة
class CategoryModel {
  final String id;
  final String name;
  final String nameEn;
  final String? description;
  final String icon;
  final String? imageUrl;
  final int color;
  final String? parentId;
  final int level;
  final int sortOrder;
  final bool isActive;
  final int productCount;
  final DateTime createdAt;
  final DateTime? updatedAt;

  CategoryModel({
    required this.id,
    required this.name,
    required this.nameEn,
    this.description,
    required this.icon,
    this.imageUrl,
    required this.color,
    this.parentId,
    this.level = 0,
    this.sortOrder = 0,
    this.isActive = true,
    this.productCount = 0,
    required this.createdAt,
    this.updatedAt,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      nameEn: json['name_en'] ?? '',
      description: json['description'],
      icon: json['icon'] ?? '📁',
      imageUrl: json['image_url'],
      color: json['color'] ?? 0xFF1E88E5,
      parentId: json['parent_id'],
      level: json['level'] ?? 0,
      sortOrder: json['sort_order'] ?? 0,
      isActive: json['is_active'] ?? true,
      productCount: json['product_count'] ?? 0,
      createdAt: DateTime.parse(json['created_at'] ?? DateTime.now().toIso8601String()),
      updatedAt: json['updated_at'] != null ? DateTime.parse(json['updated_at']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'name_en': nameEn,
      'description': description,
      'icon': icon,
      'image_url': imageUrl,
      'color': color,
      'parent_id': parentId,
      'level': level,
      'sort_order': sortOrder,
      'is_active': isActive,
      'product_count': productCount,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt?.toIso8601String(),
    };
  }

  CategoryModel copyWith({
    String? id,
    String? name,
    String? nameEn,
    String? description,
    String? icon,
    String? imageUrl,
    int? color,
    String? parentId,
    int? level,
    int? sortOrder,
    bool? isActive,
    int? productCount,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return CategoryModel(
      id: id ?? this.id,
      name: name ?? this.name,
      nameEn: nameEn ?? this.nameEn,
      description: description ?? this.description,
      icon: icon ?? this.icon,
      imageUrl: imageUrl ?? this.imageUrl,
      color: color ?? this.color,
      parentId: parentId ?? this.parentId,
      level: level ?? this.level,
      sortOrder: sortOrder ?? this.sortOrder,
      isActive: isActive ?? this.isActive,
      productCount: productCount ?? this.productCount,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
