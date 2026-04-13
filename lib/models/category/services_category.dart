import 'package:flutter/material.dart';

/// فئة الخدمات
class ServicesCategory {
  static const String id = 'services';
  static const String name = 'الخدمات';
  static const String icon = '🔧';
  static const Color color = Color(0xFF9E9E9E);

  static const List<Map<String, dynamic>> subcategories = [
    {'id': 'repair', 'name': 'إصلاح وصيانة', 'icon': '🔧'},
    {'id': 'cleaning', 'name': 'تنظيف', 'icon': '🧹'},
    {'id': 'delivery', 'name': 'توصيل', 'icon': '🚚'},
    {'id': 'moving', 'name': 'نقل أثاث', 'icon': '📦'},
    {'id': 'gardening', 'name': 'حدائق', 'icon': '🌳'},
    {'id': 'electrical', 'name': 'كهرباء', 'icon': '⚡'},
    {'id': 'plumbing', 'name': 'سباكة', 'icon': '🚿'},
    {'id': 'painting', 'name': 'دهانات', 'icon': '🎨'},
  ];
}
