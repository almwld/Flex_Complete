import 'package:flutter/material.dart';

/// فئة المنزل والمطبخ
class HomeCategory {
  static const String id = 'home';
  static const String name = 'المنزل والمطبخ';
  static const String icon = '🏠';
  static const Color color = Color(0xFFFF9800);

  static const List<Map<String, dynamic>> subcategories = [
    {'id': 'furniture', 'name': 'الأثاث', 'icon': '🛋️'},
    {'id': 'kitchen', 'name': 'المطبخ', 'icon': '🍳'},
    {'id': 'bedding', 'name': 'الفرشات', 'icon': '🛏️'},
    {'id': 'decor', 'name': 'الديكور', 'icon': '🖼️'},
    {'id': 'lighting', 'name': 'الإضاءة', 'icon': '💡'},
    {'id': 'garden', 'name': 'الحديقة', 'icon': '🌳'},
    {'id': 'storage', 'name': 'التخزين', 'icon': '📦'},
    {'id': 'cleaning', 'name': 'التنظيف', 'icon': '🧹'},
  ];
}
