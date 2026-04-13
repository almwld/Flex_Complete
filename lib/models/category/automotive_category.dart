import 'package:flutter/material.dart';

/// فئة السيارات
class AutomotiveCategory {
  static const String id = 'automotive';
  static const String name = 'السيارات';
  static const String icon = '🚗';
  static const Color color = Color(0xFF607D8B);

  static const List<Map<String, dynamic>> subcategories = [
    {'id': 'cars', 'name': 'السيارات', 'icon': '🚗'},
    {'id': 'motorcycles', 'name': 'الدراجات النارية', 'icon': '🏍️'},
    {'id': 'parts', 'name': 'قطع الغيار', 'icon': '🔧'},
    {'id': 'accessories', 'name': 'الإكسسوارات', 'icon': '🔑'},
    {'id': 'oils', 'name': 'الزيوت والسوائل', 'icon': '🛢️'},
    {'id': 'tools', 'name': 'أدوات السيارة', 'icon': '🪛'},
    {'id': 'electronics', 'name': 'إلكترونيات السيارة', 'icon': '📱'},
    {'id': 'cleaning', 'name': 'التنظيف والعناية', 'icon': '🚿'},
  ];
}
