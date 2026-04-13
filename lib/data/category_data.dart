import '../models/product/product_model.dart';

/// بيانات الأقسام والفئات
class CategoryData {
  static const List<Map<String, dynamic>> categories = [
    // إلكترونيات
    {'id': 'electronics', 'name': 'إلكترونيات', 'icon': '📱', 'color': 0xFF1E88E5},
    {'id': 'phones', 'name': 'هواتف ذكية', 'icon': '📱', 'color': 0xFF1E88E5, 'parent': 'electronics'},
    {'id': 'laptops', 'name': 'أجهزة لوحية', 'icon': '💻', 'color': 0xFF1E88E5, 'parent': 'electronics'},
    {'id': 'gaming', 'name': 'أجهزة ألعاب', 'icon': '🎮', 'color': 0xFF1E88E5, 'parent': 'electronics'},
    {'id': 'audio', 'name': 'سماعات', 'icon': '🎧', 'color': 0xFF1E88E5, 'parent': 'electronics'},
    {'id': 'watches', 'name': 'ساعات ذكية', 'icon': '⌚', 'color': 0xFF1E88E5, 'parent': 'electronics'},
    {'id': 'tv', 'name': 'تلفزيونات', 'icon': '📺', 'color': 0xFF1E88E5, 'parent': 'electronics'},
    {'id': 'cameras', 'name': 'كاميرات', 'icon': '📷', 'color': 0xFF1E88E5, 'parent': 'electronics'},

    // أزياء
    {'id': 'fashion', 'name': 'أزياء', 'icon': '👗', 'color': 0xFFE91E63},
    {'id': 'women', 'name': 'ملابس نسائية', 'icon': '👩', 'color': 0xFFE91E63, 'parent': 'fashion'},
    {'id': 'men', 'name': 'ملابس رجالية', 'icon': '👨', 'color': 0xFFE91E63, 'parent': 'fashion'},
    {'id': 'shoes', 'name': 'أحذية', 'icon': '👟', 'color': 0xFFE91E63, 'parent': 'fashion'},
    {'id': 'bags', 'name': 'حقائب', 'icon': '👜', 'color': 0xFFE91E63, 'parent': 'fashion'},
    {'id': 'accessories', 'name': 'إكسسوارات', 'icon': '💍', 'color': 0xFFE91E63, 'parent': 'fashion'},

    // أثاث
    {'id': 'furniture', 'name': 'أثاث', 'icon': '🛋️', 'color': 0xFF795548},
    {'id': 'sofas', 'name': 'كنب', 'icon': '🛋️', 'color': 0xFF795548, 'parent': 'furniture'},
    {'id': 'tables', 'name': 'طاولات', 'icon': '🪑', 'color': 0xFF795548, 'parent': 'furniture'},
    {'id': 'beds', 'name': 'سرائر', 'icon': '🛏️', 'color': 0xFF795548, 'parent': 'furniture'},
    {'id': 'storage', 'name': 'خزن', 'icon': '🗄️', 'color': 0xFF795548, 'parent': 'furniture'},
    {'id': 'office', 'name': 'مكاتب', 'icon': '🏢', 'color': 0xFF795548, 'parent': 'furniture'},

    // عقارات
    {'id': 'real_estate', 'name': 'عقارات', 'icon': '🏠', 'color': 0xFF4CAF50},
    {'id': 'villas', 'name': 'فلل', 'icon': '🏡', 'color': 0xFF4CAF50, 'parent': 'real_estate'},
    {'id': 'apartments', 'name': 'شقق', 'icon': '🏢', 'color': 0xFF4CAF50, 'parent': 'real_estate'},
    {'id': 'land', 'name': 'أراضي', 'icon': '🏔️', 'color': 0xFF4CAF50, 'parent': 'real_estate'},
    {'id': 'commercial', 'name': 'عقارات تجارية', 'icon': '🏬', 'color': 0xFF4CAF50, 'parent': 'real_estate'},

    // سيارات
    {'id': 'automotive', 'name': 'سيارات', 'icon': '🚗', 'color': 0xFF9C27B0},
    {'id': 'cars', 'name': 'سيارات', 'icon': '🚗', 'color': 0xFF9C27B0, 'parent': 'automotive'},
    {'id': 'motorcycles', 'name': 'دراجات', 'icon': '🏍️', 'color': 0xFF9C27B0, 'parent': 'automotive'},

    // أغذية
    {'id': 'food', 'name': 'أغذية', 'icon': '🍽️', 'color': 0xFFFF9800},
    {'id': 'organic', 'name': 'منتجات عضوية', 'icon': '🥬', 'color': 0xFFFF9800, 'parent': 'food'},
    {'id': 'coffee', 'name': 'قهوة', 'icon': '☕', 'color': 0xFFFF9800, 'parent': 'food'},
    {'id': 'honey', 'name': 'عسل', 'icon': '🍯', 'color': 0xFFFF9800, 'parent': 'food'},
    {'id': 'oils', 'name': 'زيوت', 'icon': '🫒', 'color': 0xFFFF9800, 'parent': 'food'},
    {'id': 'chocolate', 'name': 'شوكولاتة', 'icon': '🍫', 'color': 0xFFFF9800, 'parent': 'food'},

    // رياضة
    {'id': 'sports', 'name': 'رياضة', 'icon': '⚽', 'color': 0xFF00BCD4},
    {'id': 'gym', 'name': 'معدات gym', 'icon': '🏋️', 'color': 0xFF00BCD4, 'parent': 'sports'},
    {'id': 'shoes_sports', 'name': 'أحذية رياضية', 'icon': '👟', 'color': 0xFF00BCD4, 'parent': 'sports'},
    {'id': 'swimming', 'name': 'سباحة', 'icon': '🏊', 'color': 0xFF00BCD4, 'parent': 'sports'},

    // كتب
    {'id': 'books', 'name': 'كتب', 'icon': '📚', 'color': 0xFF607D8B},
    {'id': 'self_development', 'name': 'تطوير ذات', 'icon': '📖', 'color': 0xFF607D8B, 'parent': 'books'},
    {'id': 'art', 'name': 'فنون', 'icon': '🎨', 'color': 0xFF607D8B, 'parent': 'books'},
    {'id': 'religious', 'name': 'كتب دينية', 'icon': '📕', 'color': 0xFF607D8B, 'parent': 'books'},
    {'id': 'courses', 'name': 'دورات', 'icon': '🎓', 'color': 0xFF607D8B, 'parent': 'books'},
    {'id': 'education', 'name': 'تعليم', 'icon': '📗', 'color': 0xFF607D8B, 'parent': 'books'},

    // خدمات
    {'id': 'services', 'name': 'خدمات', 'icon': '🔧', 'color': 0xFF9E9E9E},
    {'id': 'cleaning', 'name': 'تنظيف', 'icon': '🧹', 'color': 0xFF9E9E9E, 'parent': 'services'},
    {'id': 'plumbing', 'name': 'سباكة', 'icon': '🔧', 'color': 0xFF9E9E9E, 'parent': 'services'},
    {'id': 'electrical', 'name': 'كهرباء', 'icon': '⚡', 'color': 0xFF9E9E9E, 'parent': 'services'},
    {'id': 'moving', 'name': 'نقل أثاث', 'icon': '🚚', 'color': 0xFF9E9E9E, 'parent': 'services'},
  ];

  /// الحصول على أقسام المستوى الأول
  static List<Map<String, dynamic>> get mainCategories {
    return categories.where((c) => c['parent'] == null).toList();
  }

  /// الحصول على الأقسام الفرعية
  static List<Map<String, dynamic>> getSubcategories(String parentId) {
    return categories.where((c) => c['parent'] == parentId).toList();
  }

  /// الحصول على قسم واحد
  static Map<String, dynamic>? getCategoryById(String id) {
    try {
      return categories.firstWhere((c) => c['id'] == id);
    } catch (e) {
      return null;
    }
  }
}