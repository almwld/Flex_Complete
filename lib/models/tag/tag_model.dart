/// نموذج الوسم
class TagModel {
  final String id;
  final String name;
  final String slug;
  final int usageCount;
  final bool isPopular;
  final bool isActive;
  final DateTime createdAt;

  TagModel({
    required this.id,
    required this.name,
    required this.slug,
    this.usageCount = 0,
    this.isPopular = false,
    this.isActive = true,
    required this.createdAt,
  });

  factory TagModel.fromJson(Map<String, dynamic> json) {
    return TagModel(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      slug: json['slug'] ?? '',
      usageCount: json['usage_count'] ?? 0,
      isPopular: json['is_popular'] ?? false,
      isActive: json['is_active'] ?? true,
      createdAt: DateTime.parse(json['created_at'] ?? DateTime.now().toIso8601String()),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'slug': slug,
      'usage_count': usageCount,
      'is_popular': isPopular,
      'is_active': isActive,
      'created_at': createdAt.toIso8601String(),
    };
  }
}
