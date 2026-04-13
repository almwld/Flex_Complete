import 'package:flutter/material.dart';

/// فئة الأزياء
class FashionCategory {
  static const String id = 'fashion';
  static const String name = 'الأزياء';
  static const String icon = '👗';
  static const Color color = Color(0xFFE91E63);

  static const List<Map<String, dynamic>> subcategories = [
    {'id': 'women', 'name': 'ملابس نسائية', 'icon': '👗'},
    {'id': 'men', 'name': 'ملابس رجالية', 'icon': '👔'},
    {'id': 'kids', 'name': 'ملابس أطفال', 'icon': '🧸'},
    {'id': 'shoes', 'name': 'الأحذية', 'icon': '👟'},
    {'id': 'bags', 'name': 'الحقائب', 'icon': '👜'},
    {'id': 'jewelry', 'name': 'المجوهرات', 'icon': '💍'},
    {'id': 'watches', 'name': 'الساعات', 'icon': '⌚'},
    {'id': 'accessories', 'name': 'الإكسسوارات', 'icon': '🕶️'},
  ];
}
