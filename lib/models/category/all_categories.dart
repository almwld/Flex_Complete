/// ملف يحتوي على جميع الفئات (40+ فئة)
class AllCategories {
  static const List<Map<String, dynamic>> categories = [
    // الفئات الأساسية
    {'id': 'electronics', 'name': 'الإلكترونيات', 'icon': '📱', 'color': 0xFF1E88E5},
    {'id': 'clothing', 'name': 'الملابس', 'icon': '👕', 'color': 0xFFE91E63},
    {'id': 'shoes', 'name': 'الأحذية', 'icon': '👟', 'color': 0xFF9C27B0},
    {'id': 'furniture', 'name': 'الأثاث', 'icon': '🪑', 'color': 0xFF795548},
    {'id': 'beauty', 'name': 'التجميل', 'icon': '💄', 'color': 0xFFFF4081},
    {'id': 'jewelry', 'name': 'المجوهرات', 'icon': '💎', 'color': 0xFFFFD700},
    {'id': 'watches', 'name': 'الساعات', 'icon': '⌚', 'color': 0xFF607D8B},
    {'id': 'bags', 'name': 'الحقائب', 'icon': '👜', 'color': 0xFF8B4513},
    {'id': 'perfumes', 'name': 'العطور', 'icon': '🌸', 'color': 0xFFFF9800},
    {'id': 'health', 'name': 'الصحة', 'icon': '💊', 'color': 0xFF4CAF50},
    {'id': 'sports', 'name': 'الرياضة', 'icon': '⚽', 'color': 0xFF2196F3},
    {'id': 'games', 'name': 'الألعاب', 'icon': '🎮', 'color': 0xFF9C27B0},
    {'id': 'books', 'name': 'الكتب', 'icon': '📚', 'color': 0xFF3F51B5},
    {'id': 'stationery', 'name': 'القرطاسية', 'icon': '✏️', 'color': 0xFF607D8B},
    {'id': 'pets', 'name': 'حيوانات أليفة', 'icon': '🐕', 'color': 0xFF795548},
    {'id': 'agriculture', 'name': 'الزراعة', 'icon': '🌾', 'color': 0xFF8BC34A},
    {'id': 'automotive', 'name': 'قطع غيار', 'icon': '🔧', 'color': 0xFF424242},
    {'id': 'construction', 'name': 'البناء', 'icon': '🏗️', 'color': 0xFF795548},
    {'id': 'tools', 'name': 'الأدوات', 'icon': '🔨', 'color': 0xFF607D8B},
    {'id': 'cars', 'name': 'السيارات', 'icon': '🚗', 'color': 0xFF1E88E5},
    {'id': 'bicycles', 'name': 'الدراجات', 'icon': '🚲', 'color': 0xFF4CAF50},
    {'id': 'security', 'name': 'الأمن', 'icon': '🔒', 'color': 0xFF424242},
    {'id': 'education', 'name': 'التعليم', 'icon': '🎓', 'color': 0xFF3F51B5},
    {'id': 'training', 'name': 'التدريب', 'icon': '📖', 'color': 0xFF2196F3},
    {'id': 'consulting', 'name': 'الاستشارات', 'icon': '💼', 'color': 0xFF607D8B},
    {'id': 'home_services', 'name': 'خدمات منزلية', 'icon': '🏠', 'color': 0xFFFF9800},
    {'id': 'cleaning', 'name': 'التنظيف', 'icon': '🧹', 'color': 0xFF4CAF50},
    {'id': 'maintenance', 'name': 'الصيانة', 'icon': '🔧', 'color': 0xFF607D8B},
    {'id': 'transport', 'name': 'النقل', 'icon': '🚚', 'color': 0xFF795548},
    {'id': 'delivery', 'name': 'التوصيل', 'icon': '📦', 'color': 0xFFE91E63},
    {'id': 'travel', 'name': 'السفر', 'icon': '✈️', 'color': 0xFF2196F3},
    {'id': 'tourism', 'name': 'السياحة', 'icon': '🌍', 'color': 0xFF4CAF50},
    {'id': 'real_estate', 'name': 'العقارات', 'icon': '🏘️', 'color': 0xFF795548},
    {'id': 'food', 'name': 'الطعام', 'icon': '🍔', 'color': 0xFFFF9800},
    {'id': 'restaurants', 'name': 'المطاعم', 'icon': '🍽️', 'color': 0xFFE91E63},
    {'id': 'cafes', 'name': 'المقاهي', 'icon': '☕', 'color': 0xFF795548},
    {'id': 'grocery', 'name': 'البقالة', 'icon': '🛒', 'color': 0xFF4CAF50},
    {'id': 'pharmacy', 'name': 'الصيدلة', 'icon': '💊', 'color': 0xFFF44336},
    {'id': 'toys', 'name': 'الألعاب', 'icon': '🧸', 'color': 0xFFFF9800},
    {'id': 'baby', 'name': 'أطفال', 'icon': '👶', 'color': 0xFFE91E63},
  ];

  static List<Map<String, dynamic>> getByParent(String? parentId) {
    if (parentId == null) {
      return categories.where((c) => c['parent_id'] == null).toList();
    }
    return categories.where((c) => c['parent_id'] == parentId).toList();
  }

  static Map<String, dynamic>? getById(String id) {
    try {
      return categories.firstWhere((c) => c['id'] == id);
    } catch (e) {
      return null;
    }
  }
}
